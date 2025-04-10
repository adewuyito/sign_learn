import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/core/config.dart';
import 'package:sign_learn/core/core.dart';

/// dio api client provider
final dioHttpApiProvider = Provider<IHttpApi>((ref) {
  return DioHttpApi(ref);
});

class DioHttpApi implements IHttpApi {
  final Ref ref;

  final Dio _dio;

  DioHttpApi(this.ref) : _dio = Dio() {
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds:60),
      receiveTimeout: Duration(seconds: 60),
      contentType: 'application/json',
      validateStatus: _validateStatus,
    );

    // set the options
    _dio.options = baseOptions;

    final presetHeaders = <String, String>{
      Headers.acceptHeader: '*/*',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    _dio.options.headers = presetHeaders;

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestHeader: false,
          requestBody: true,
          responseBody: true,
          error: false,
        ),
      );
    }
  }

  static String baseUrl = AppConfig.baseUrl;

  @override
  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
  }) async {
    await setToken();

    try {
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
      );

      return response;
    } catch (e) {
      throw ApiException.getDioException(e);
    }
  }

  @override
  Future<Response> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    await setToken();

    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
      );

      return response;
    } catch (e) {
      log('e is $e');
      throw ApiException.getDioException(e);
    }
  }

  @override
  Future<Response> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    await setToken();

    try {
      final response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
      );

      return response;
    } catch (e) {
      throw ApiException.getDioException(e);
    }
  }

  @override
  Future<Response> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    await setToken();

    try {
      final response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
      );

      return response;
    } catch (e) {
      log('e is $e');
      throw ApiException.getDioException(e);
    }
  }

  /// validate the status of a request
  bool _validateStatus(int? status) {
    return status! == 200 || status == 201;
  }

  /// adds the logged in user's token to the dio header
  Future<void> setToken() async {
    final token = await _getToken();
    log('token from DIO HTTP API =============> $token');
    final tokenHeader = <String, String>{
      if (token != null) 'authToken': token,
    };

    _dio.options.headers.addAll(tokenHeader);
  }

  /// get the logged in user's token
  Future<String?> _getToken() async {
    // return await ref.read(authRepositoryProvider).getIdToken();
    return '';
  }
}

extension ResponseExtension on Response {
  bool get isSuccess {
    final is200 = statusCode == HttpStatus.ok;
    final is201 = statusCode == HttpStatus.created;
    return is200 || is201;
  }
}
