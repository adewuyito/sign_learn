class SocketEventModel<T> {
  SocketEventModel({
    required this.eventName,
    required this.data,
  });

  final String eventName;
  final T data;
}
