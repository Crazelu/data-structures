class GraphTypeError implements Exception {
  final String message;

  GraphTypeError(this.message);

  @override
  String toString() {
    return this.message;
  }
}
