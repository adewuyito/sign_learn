// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoModelImpl _$$UserInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoModelImpl(
      userId: json['userId'] as String,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      displayImage: json['displayImage'] as String?,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserInfoModelImplToJson(_$UserInfoModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullname': instance.fullname,
      'email': instance.email,
      'displayImage': instance.displayImage,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'runtimeType': instance.$type,
    };

_$UserInfoModelUnknownImpl _$$UserInfoModelUnknownImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInfoModelUnknownImpl(
      userId: json['userId'] as String? ?? '',
      fullname: json['fullname'] as String? ?? '',
      email: json['email'] as String? ?? '',
      displayImage: json['displayImage'] as String? ?? '',
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserInfoModelUnknownImplToJson(
        _$UserInfoModelUnknownImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullname': instance.fullname,
      'email': instance.email,
      'displayImage': instance.displayImage,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'runtimeType': instance.$type,
    };
