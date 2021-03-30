class LinkedListTypeError implements Exception {
  final String message;

  LinkedListTypeError(this.message);

  @override
  String toString() {
    return this.message;
  }
}

class LinkedListIndexError implements Exception {
  final String message;

  LinkedListIndexError(this.message);

  @override
  String toString() {
    return this.message;
  }
}
