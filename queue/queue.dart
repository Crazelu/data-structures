class _Node<T extends Object> {
  T data;
  _Node<T>? next;
  _Node<T>? previous;

  _Node({
    required this.data,
    this.next,
    this.previous,
  });
}

class Queue<T extends Object> {
  _Node<T>? _head;
  _Node<T>? _tail;

  int _length = 0;

  ///Number of elements contained in queue
  int get length => _length;

  ///Inserts [value] at the end of queue
  void insert(T value) {
    _Node<T> newNode = _Node<T>(data: value);
    if (_tail == null) {
      _head = _tail = newNode;
    } else {
      _Node<T> lastNode = _tail!;
      newNode.next = lastNode;
      lastNode.previous = newNode;
      _tail = newNode;
    }
    _length++;
  }

  ///Removes topmost node and returns it's value.
  ///Returns `null` if queue is empty.
  T? pop() {
    if (_head == null) return null;
    final oldHead = _head;
    _head = oldHead?.previous;
    _head?.next = null;
    if (_head == null) {
      _tail = null;
    }
    _length--;
    return oldHead?.data;
  }

  @override
  String toString() {
    String result = "";
    _Node? currentNode = _tail;
    while (currentNode != null) {
      result += "${currentNode.data}${currentNode.next != null ? ' -> ' : ''}";
      currentNode = currentNode.next;
    }
    return "[$result]";
  }
}
