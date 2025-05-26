class UserNotFoundException implements Exception {
  static const String message = 'User not found';
}

class ServerException implements Exception {
  final String message;
  final int statusCode;

  const ServerException({required this.message, required this.statusCode});

  @override
  String toString() => 'ServerException: $message (Status: $statusCode)';
}
