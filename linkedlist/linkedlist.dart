import 'exceptions.dart';

class Node<T> {
  Object data;
  Node<T>? next;

  Node({required this.data, this.next});
}

class LinkedList<T> {
  Node<T>? node;

  LinkedList({this.node});

  int get length {
    int count = 0;
    if (this.node != null) {
      Node<T> current = this.node!;
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

  ///inserts new node at the end of list
  void insertAtEnd(Object data) {
    checkType(data);
    Node<T> arg = Node<T>(data: data);
    //if linkedlist is empty, insert this item at the beginning
    if (this.node == null) {
      this.node = arg;
    } else {
      Node<T> lastNode = this.node!;
      while (lastNode.next != null) {
        lastNode = lastNode.next!;
      }
      lastNode.next = arg;
    }
  }

  ///inserts new node at the beginning of list
  void insertAtBeginning(Object data) {
    checkType(data);
    Node<T> arg = Node<T>(data: data);
    //if linkedlist is empty, insert this item at the beginning
    if (this.node == null) {
      this.node = arg;
    } else {
      Node<T> firstNode = this.node!;
      this.node = arg;
      this.node!.next = firstNode;
    }
  }

  void insertAtPosition(int pos, Object data) {
    checkType(data);
    int length = this.length;
    if (pos > length) {
      throw LinkedListIndexError("Invalid index $pos. Range 0:${this.length}");
    }

    Node<T> arg = Node<T>(data: data);
    if (pos == 0) {
      Node<T> current = this.node!;
      if (current.next == null) {
        this.node = arg;
      } else {
        this.node = arg;
        arg.next = current.next;
      }
      return;
    }

    if (pos == -1 || pos == length) {
      Node<T> current = this.node!;

      while (current.next?.next != null) {
        current = current.next!;
      }

      current.next = arg;
      return;
    }

    int count = 0;
    Node<T> current = this.node!;
    Node<T> last = this.node!;
    if (this.node != null) {
      while (current.next != null) {
        if (pos == count) break;
        count++;
        last = current;
        current = current.next!;
      }
    }
    last.next = Node<T>(data: data, next: current.next);
  }

  ///removes first node whose object is same as `arg`
  Object? pop(Object arg) {
    if (this.node != null) {
      Node<T> currentNode = this.node!;
      Node<T> lastNode = this.node!;
      while (currentNode.next != null) {
        if (currentNode.data == arg) {
          //if first node is the one with data to be popped,
          //set new root node to firtNode.next
          if (currentNode == this.node) {
            this.node = currentNode.next!;
          } else {
            lastNode.next = currentNode.next!;
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

  LinkedList<T> reverse() {
    if (this.node == null) return this;
    Node<T>? following = this.node!;
    Node<T>? current = this.node!;
    Node<T>? previous;

    while (current != null) {
      following = following?.next;
      current.next = previous;
      previous = current;
      current = following;
    }
    this.node = previous;
    return this;
  }

  @override
  String toString() {
    if (this.node == null) {
      return '[]';
    }

    String res = '';
    Node nextNode = this.node!;
    while (nextNode.next != null) {
      res += '${nextNode.data}, ';
      nextNode = nextNode.next!;
    }
    res += '${nextNode.data}';

    return '[$res]';
  }
}

void main() {
  // LinkedList list = LinkedList();
  // print(list);
  // list.insertAtEnd(2);
  // print(list.pop(2));
  // print(list);
  // list.insertAtEnd(4);
  // print(list);
  // list.insertAtBeginning("ME");
  // print(list);
  // list.insertAtEnd(4);
  // print(list);
  // list.insertAtPosition(0, 3);
  // print(list.pop(3));
  // print(list);

  // list.insertAtBeginning(43);
  // list.insertAtBeginning(13);
  // list.insertAtEnd(7);

  // print(list);

  // print(list.reverse());

  // print(list);
}
