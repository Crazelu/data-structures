import 'exceptions.dart';

class Node<T extends Object> {
  T data;
  Node<T>? next;

  Node({required this.data, this.next});
}

class LinkedList<T extends Object> {
  ///Head node
  Node<T>? _head;

  int _length = 0;

  ///Length of list (i.e number of elements it contains)
  int get length => _length;

  ///Inserts[data] at the end of list
  void insertAtEnd(T data) {
    Node<T> newNode = Node<T>(data: data);
    //if linkedlist is empty, insert this item at the beginning
    if (_head == null) {
      _head = newNode;
      _length = 1;
    } else {
      Node<T> lastNode = _head!;
      while (lastNode.next != null) {
        lastNode = lastNode.next!;
      }
      lastNode.next = newNode;
      _length++;
    }
  }

  ///Inserts [data] at the beginning of list
  void insertAtBeginning(T data) {
    Node<T> newNode = Node<T>(data: data);
    //if linkedlist is empty, insert this item at the beginning
    if (_head == null) {
      _head = newNode;
      _length = 1;
    } else {
      Node<T> firstNode = _head!;
      _head = newNode;
      _head!.next = firstNode;
      _length++;
    }
  }

  ///Inserts [data] at index [index].
  ///This replaces the previous value at [index] (if any) with [data].
  void insertAtPosition(int index, T data) {
    int length = this.length;
    if (index > length) {
      throw LinkedListIndexError(
          "Invalid index $index. Range 0:${this.length}");
    }

    Node<T> newNode = Node<T>(data: data);
    if (index == 0) {
      Node<T> current = _head!;
      if (current.next == null) {
        _head = newNode;
      } else {
        _head = newNode;
        newNode.next = current.next;
      }
      return;
    }

    if (index == -1 || index == length) {
      Node<T> current = _head!;

      while (current.next?.next != null) {
        current = current.next!;
      }

      current.next = newNode;
      return;
    }

    int count = 0;
    Node<T> current = _head!;
    Node<T> last = _head!;
    if (_head != null) {
      while (current.next != null) {
        if (index == count) break;
        count++;
        last = current;
        current = current.next!;
      }
    }
    last.next = Node<T>(data: data, next: current.next);
  }

  ///Removes and returns `value` entry from list if it exists.
  ///Does nothing and returns null if `value` is not contained in list.
  T? pop(T value) {
    if (_head != null) {
      Node<T> currentNode = _head!;
      Node<T> lastNode = _head!;
      while (currentNode.next != null) {
        if (currentNode.data == value) {
          //if first node is the one with data to be popped,
          //set new root node to firtNode.next
          if (currentNode == _head) {
            _head = currentNode.next!;
          } else {
            lastNode.next = currentNode.next!;
          }

          _length--;
          return currentNode.data;
        }
        lastNode = currentNode;
        currentNode = currentNode.next!;
      }
      //if node with data `value` to be popped has no next node

      if (currentNode.data == value) {
        //set first node to null if node to be popped is the only node in the list
        //otherwise set next property of the last node in the list to null
        if (currentNode.next == null) {
          _head = null;
        } else {
          lastNode.next = null;
        }
        _length--;
        return currentNode.data;
      }
    }
    return null;
  }

  ///Reverses list
  LinkedList<T> reverse() {
    if (_head == null) return this;
    Node<T>? following = _head!;
    Node<T>? current = _head!;
    Node<T>? previous;

    while (current != null) {
      following = following?.next;
      current.next = previous;
      previous = current;
      current = following;
    }
    _head = previous;
    return this;
  }

  operator []=(int index, T data) {
    insertAtPosition(index, data);
  }

  @override
  String toString() {
    if (_head == null) {
      return '[]';
    }

    String res = '';
    Node nextNode = _head!;
    while (nextNode.next != null) {
      res += '${nextNode.data}, ';
      nextNode = nextNode.next!;
    }
    res += '${nextNode.data}';

    return '[$res]';
  }
}

// void main() {
//   LinkedList list = LinkedList();
//   print(list);
//   list.insertAtEnd(2);
//   print(list.pop(2));
//   print(list);
//   list.insertAtEnd(4);
//   print(list);
//   list.insertAtBeginning("ME");
//   print(list);
//   list.insertAtEnd(4);
//   print(list);
//   list.insertAtPosition(0, 3);
//   print(list);
//   print(list.pop(3));
//   print(list);

//   list.insertAtBeginning(43);
//   list.insertAtBeginning(13);
//   list.insertAtEnd(7);

//   print(list);
//   print(list.reverse());
//   print("LENGTH: ${list.length}");

//   final numbers = LinkedList<int>();
//   numbers.insertAtBeginning(0);
//   numbers.insertAtBeginning(1);
//   print(numbers);
//   numbers[0] = 9;

//   print(numbers);
//   print("LENGTH: ${numbers.length}");
// }
