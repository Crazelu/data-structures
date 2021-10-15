import 'exceptions.dart';
import 'node.dart';

class Graph<T> {
  Node<T>? initialNode;

  Graph({this.initialNode});

  void _checkType(Object data) {
    if (!(data is T)) {
      throw GraphTypeError("Type $T expected but ${data.runtimeType} received");
    }
  }

  ///Returns `true` if graph has no node.
  ///Otherwise, returns `false`.
  bool isEmpty() {
    return this.initialNode == null;
  }

  ///If [initialNode] is null, sets [node] as [initialNode].
  ///
  ///Otherwise, adds an edge between [initialNode] and [node].
  void addNode(Node<T> node) {
    if (initialNode == null)
      initialNode = node;
    else
      initialNode!.addNeighbor(node);
  }

  ///If [initialNode] is null, sets node with [data] as [initialNode].
  ///
  ///Otherwise, adds an edge between [initialNode] and a new node with [data].
  void addNodeWithData(
    Object data, {
    int weight = 0,
    bool active = false,
  }) {
    _checkType(data);

    final node = Node<T>(
      data,
      weight: weight,
      active: active,
    );

    if (initialNode == null)
      initialNode = node;
    else
      initialNode!.addNeighbor(node);
  }

  ///If [initialNode] is null, sets [firstNode] as [initialNode]
  ///and sets [nextNode] as a neighbor of [firstNode].
  ///
  ///Otherwise, sets [firstNode] as a neighbor of [initialNode]
  ///and sets [nextNode] as a neighbor of [firstNode].
  void addEdge(
    Node<T> firstNode,
    Node<T> nextNode,
  ) {
    if (initialNode == null) {
      initialNode = firstNode;
      initialNode!.addNeighbor(nextNode);
    } else {
      initialNode!.addNeighbor(firstNode.copyWith(neighbors: [nextNode]));
    }
  }

  ///Returns `true` if [node] is contained in graph.
  ///Otherwise, returns false.
  bool contains(Node<T> node) {
    if (initialNode != null) {
      var currentNode = initialNode;
      int currentIndex = -1;

      while (currentIndex != initialNode!.neighbors.length - 1) {
        if (currentNode == node) return true;

        for (var iterableNode in currentNode!.neighbors) {
          if (iterableNode == node) return true;
        }

        currentIndex++;
        if ((initialNode!.neighbors.length) > 0)
          currentNode = initialNode!.neighbors[currentIndex];
      }

      return currentNode == node;
    }

    return false;
  }

  ///Returns `true` if [node] and [otherNode] forms an edge.
  ///Otherwise, returns false.
  bool isAdjacent(
    Node<T> node,
    Node<T> otherNode,
  ) {
    if (contains(node)) return node.neighbors.contains(otherNode);

    return false;
  }

  ///Deletes [node] from graph.
  ///
  ///Does nothing if [node] is not contained in graph.
  void deleteNode(Node<T> node) {
    if (node == initialNode) {
      initialNode = null;
      return;
    }

    if (initialNode != null) {
      var currentNode = initialNode;
      int currentIndex = -1;

      while (currentIndex != initialNode!.neighbors.length - 1) {
        if (currentNode == node)
          initialNode!.neighbors.replaceRange(
            currentIndex,
            currentIndex + 1,
            [],
          );

        for (int k = 0; k < currentNode!.neighbors.length; k++) {
          if (currentNode.neighbors[k] == node)
            currentNode.neighbors.replaceRange(k, k + 1, []);
        }

        currentIndex++;
        if ((initialNode!.neighbors.length) > 0)
          currentNode = initialNode!.neighbors[currentIndex];
      }

      initialNode!.neighbors.replaceRange(
        currentIndex,
        currentIndex + 1,
        [],
      );
    }
  }

  ///Removes edge between [node] and [otherNode] if any exists.
  void deleteEdge(Node<T> node, Node<T> otherNode) {
    if (contains(node)) node.removeNeighbor(otherNode);
  }

//TODO: Recursively print all nestings of nodes and their edges
//Currently prints only two levels
  @override
  String toString() {
    String result = "";

    if (initialNode != null) {
      var currentNode = initialNode;
      int currentIndex = -1;

      while (currentIndex != initialNode!.neighbors.length - 1) {
        result += "\n${currentNode!.data} -> ";
        for (var node in currentNode.neighbors) {
          result += " ${node.data},";
        }

        currentIndex++;
        if (initialNode!.neighbors.length > 0)
          currentNode = initialNode!.neighbors[currentIndex];
      }

      result += "\n${currentNode!.data} -> ";
      for (var node in currentNode.neighbors) {
        result += " ${node.data},";
      }
    }

    return result;
  }
}
