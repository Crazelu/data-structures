class _Node<T extends Object> {
  T value;
  _Node<T>? next;
  _Node<T>? previous;
  int priority;

  _Node({
    required this.value,
    required this.priority,
    this.next,
    this.previous,
  });
}

class PriorityQueue<T extends Object> {
  _Node<T>? _root;

  int _length = 0;

  ///Number of elements contained in queue
  int get length => _length;

  ///Inserts [value] into [PriorityQueue] based on [priority]
  void insert(T value, int priority) {
    _Node<T> newNode = _Node<T>(value: value, priority: priority);

    if (_root == null) {
      _root = newNode;
      _length++;
      return;
    }

    _Node<T>? currentNode = _root;
    _Node<T>? lastNode = _root;
    bool iterate = true;

    while (iterate) {
      if (newNode.priority == currentNode?.priority) {
        lastNode = currentNode;
        currentNode = currentNode?.previous;
        continue;
      }

      if (currentNode != null && newNode.priority < currentNode.priority) {
        lastNode = currentNode;
        currentNode = currentNode.previous;
        continue;
      }

      if (currentNode != null && newNode.priority > currentNode.priority) {
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
