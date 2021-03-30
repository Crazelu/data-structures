import 'exceptions.dart';

class DoubleNode<T> {
  Object data;
  DoubleNode<T>? prev;
  DoubleNode<T>? next;

  DoubleNode({required this.data, this.prev, this.next});
}

class DoubleLinkedList<T> {
  DoubleNode<T>? node;

  DoubleLinkedList({this.node});

  int get length {
    int count = 0;

    if (this.node != null) {
      DoubleNode<T> current = this.node!;
      while (current.next != null) {
        count++;
        current = current.next!;
      }
    }

    return count;
  }

  void checkType(Object data) {
    if (!(data is T)) {
      throw LinkedListTypeError(
          "Type $T expected but ${data.runtimeType} received");
    }
  }

  void insertAtEnd(Object data) {
    checkType(data);

    if (this.node == null) {
      this.node = DoubleNode<T>(data: data);
    } else {
      DoubleNode<T> last = this.node!;
      while (last.next != null) {
        last = last.next!;
      }
      last.next = DoubleNode<T>(data: data, prev: last);
    }
  }

  void insertAtBeginning(Object data) {
    checkType(data);

    DoubleNode<T> arg = DoubleNode<T>(data: data);
    if (this.node == null) {
      this.node = arg;
    } else {
      DoubleNode<T> first = this.node!;
      this.node = arg;
      arg.next = first;
      first.prev = arg;
    }
  }

  void insertAtPosition(int pos, Object data) {
    checkType(data);
    int length = this.length;
    if (pos > length) {
      throw LinkedListIndexError("Invalid index $pos. Range 0:${this.length}");
    }
    DoubleNode<T> arg = DoubleNode<T>(data: data);

    if (pos == 0) {
      DoubleNode<T> first = this.node!;

      this.node = arg;
      arg.next = first.next;
      first.next?.prev = arg;
    } else if (pos == -1 || pos == length) {
      DoubleNode<T> last = this.node!;

      while (last.next?.next != null) {
        last = last.next!;
      }
      last.next = arg;
      arg.prev = last;
    } else {
      int count = 0;

      DoubleNode<T> last = this.node!;
      DoubleNode<T> current = this.node!;

      while (current.next != null) {
        if (pos == count) break;
        count++;
        last = current;
        current = current.next!;
      }

      DoubleNode<T> _arg =
          DoubleNode<T>(data: data, prev: last, next: current.next);

      last.next = _arg;
      current.next?.prev = _arg;
    }
  }

  Object? pop(Object arg) {
    if (this.node != null) {
      DoubleNode<T> currentNode = this.node!;
      DoubleNode<T> lastNode = this.node!;
      while (currentNode.next != null) {
        if (currentNode.data == arg) {
          //if first node is the one with data to be popped,
          //set new root node to firtNode.next
          if (currentNode == this.node) {
            this.node = currentNode.next!;
            currentNode.prev = null;
          } else {
            lastNode.next = currentNode.next!;
            lastNode.prev = currentNode;
          }

          return currentNode.data;
        }
        lastNode = currentNode;
        currentNode = currentNode.next!;
      }
      //if node with data `arg` to be popped has no next node

      if (currentNode.data == arg) {
        //set first node to null if node to be popped is the only node in the list
        //otherwise set next property of the last node in the list to null
        if (currentNode.next == null) {
          this.node = null;
        } else {
          lastNode.next = null;
        }
        return currentNode.data;
      }
    }
  }

  DoubleLinkedList<T> reverse() {
    if (this.node == null) return this;

    DoubleNode<T>? following = this.node!;
    DoubleNode<T>? current = this.node!;
    DoubleNode<T>? previous;

    while (current != null) {
      following = following?.next;
      current.next = previous;
      current.prev = following;
      previous = current;
      current = following;
    }
    this.node = previous;

    return this;
  }

  void verify() {
    DoubleNode<T> last = this.node!;

    while (last.next != null) {
      print("Data: ${last.data}");
      print("Previous: ${last.prev?.data}");
      print("Next: ${last.next?.data}\n");
      last = last.next!;
    }
    print("Data: ${last.data}");
    print("Previous: ${last.prev?.data}");
    print("Next: ${last.next?.data}");
  }

  @override
  String toString() {
    if (this.node == null) {
      return '[]';
    }

    String res = '';
    DoubleNode<T> nextNode = this.node!;
    while (nextNode.next != null) {
      res += '${nextNode.data}, ';
      nextNode = nextNode.next!;
    }
    res += '${nextNode.data}';

    return '[$res]';
  }
}

void main() {
  // DoubleLinkedList list = DoubleLinkedList();
  // print(list.reverse());
  // list.insertAtEnd(3);
  // print(list);
  // list.insertAtEnd(4);
  // print(list);
  // list.insertAtBeginning(5);
  // list.insertAtBeginning(5);
  // list.insertAtEnd(5);
  // print(list);
  // list.insertAtBeginning(10);
  // print(list);
  // list.insertAtPosition(0, 7);
  // print(list);
  // list.insertAtPosition(-1, 9);
  // print(list);
  // list.insertAtPosition(3, 12);
  // print(list);
  // list.insertAtEnd(33);
  // list.insertAtBeginning(0);
  // list.insertAtPosition(2, 66);
  // print(list);

  // print(list.pop(7));
  // print(list.pop(5));

  // print(list.reverse());
  // list.verify();
}
