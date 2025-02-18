class ServerExceptions implements Exception {
  ServerExceptions({
    required this.statusCode,
    required this.message,
  });
  int statusCode;
  String message;
}
