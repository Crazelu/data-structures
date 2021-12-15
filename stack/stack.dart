class Node<T> {
  T? data;
  Node<T>? next;

  Node({
    this.data,
    this.next,
  });
}

class Stack<T> {
  Node<T>? node;

  Stack({this.node});

  ///Adds an entry to the stack
  void push(T? data) {
    Node<T> arg = Node<T>(data: data);
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

  ///Pops an entry from stack.
  ///
  ///Returns null if stack is empty.
  T? pop() {
    if (this.node == null) return null;
    Node<T> lastNode = this.node!;
    Node<T> prevNode = lastNode;

    while (lastNode.next != null) {
      prevNode = lastNode;
      lastNode = lastNode.next!;
    }
    prevNode.next = null;
    return lastNode.data;
  }

  @override
  String toString() {
    if (this.node == null) {
      return '[]';
    }

    String res = '';
    Node nextNode = this.node!;
    while (nextNode.next != null) {
      res += '${nextNode.data} -> ';
      nextNode = nextNode.next!;
    }
    res += '${nextNode.data}';

    return '[$res]';
  }
}

void main() {
  Stack stack = Stack();

  for (var i in List.generate(10, (index) => index)) {
    stack.push(i);
  }

  print(stack.pop());
  print(stack.pop());
  print(stack.pop());

  print(stack);
}
