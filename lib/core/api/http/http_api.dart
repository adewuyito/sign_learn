abstract class IHttpApi {
  /// get
  Future get(
    String uri, {
    Map<String, dynamic>? queryParameters,
  });

  /// post
  Future post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  /// put
  Future put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  /// delete
  Future delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}
