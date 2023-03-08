class _Node<T> {
  T value;
  _Node<T>? next;
  _Node<T>? previous;

  _Node({
    required this.value,
    this.next,
    this.previous,
  });
}

class PriorityQueue<T extends Comparable> {
  _Node<T>? _root;

  int _length = 0;

  ///Number of elements contained in queue
  int get length => _length;

  ///Elements in this queue in order of their priority
  List<T> get entries {
    List<T> result = [];
    _Node? currentNode = _root;
    while (currentNode != null) {
      result.add(currentNode.value);
      currentNode = currentNode.previous;
    }
    return result;
  }

  ///Inserts [value] into queue
  void insert(T value) {
    _Node<T> newNode = _Node<T>(value: value);

    if (_root == null) {
      _root = newNode;
      _length++;
      return;
    }

    _Node<T>? currentNode = _root;
    _Node<T>? lastNode = _root;
    bool iterate = true;

    while (iterate) {
      if (currentNode != null &&
          newNode.value.compareTo(currentNode.value) == 0) {
        lastNode = currentNode;
        currentNode = currentNode.previous;
        continue;
      }

      if (currentNode != null &&
          newNode.value.compareTo(currentNode.value) == -1) {
        lastNode = currentNode;
        currentNode = currentNode.previous;
        continue;
      }

      if (currentNode != null &&
          newNode.value.compareTo(currentNode.value) == 1) {
        final temp = currentNode.next;

        if (temp == null) {
          newNode.previous = currentNode;
          currentNode.next = newNode;
          _root = newNode;
        } else {
          newNode.next = temp;
          newNode.previous = currentNode;
          temp.previous = newNode;
          currentNode.next = newNode;
        }

        iterate = false;
      }

      if (currentNode == null) {
        lastNode?.previous = newNode;
        newNode.next = lastNode;
        iterate = false;
      }
    }

    _length++;
  }

  ///Removes topmost node and returns it's value.
  ///Returns `null` if queue is empty.
  T? pop() {
    if (_root == null) return null;
    final oldRoot = _root;
    _root = oldRoot?.previous;
    _root?.next = null;
    _length--;
    return oldRoot?.value;
  }

  @override
  String toString() {
    String result = "";
    _Node? currentNode = _root;
    while (currentNode != null) {
      result +=
          "${currentNode.value}${currentNode.previous != null ? ', ' : ''}";
      currentNode = currentNode.previous;
    }
    return "[$result]";
  }
}
