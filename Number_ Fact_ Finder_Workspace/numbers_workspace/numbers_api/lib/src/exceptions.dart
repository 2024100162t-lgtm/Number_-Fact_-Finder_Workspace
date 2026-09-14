class NumberException implements Exception {
  final String message;
  final Object? cause;

  NumberException(this.message, [this.cause]);

  @override
  String toString() {
    if (cause != null) {
      return 'NumberException: $message (Underlying: $cause)';
    }

    return 'NumberException: $message';
  }
}
