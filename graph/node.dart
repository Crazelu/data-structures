class Node<T> {
  Object data;
  bool active;
  int weight;
  List<Node<T>>? nodeNeighbors;

  Node(
    this.data, {
    this.nodeNeighbors,
    this.weight = 0,
    this.active = false,
  }) : _neighbors = nodeNeighbors ?? [];

  List<Node<T>> _neighbors = [];
  List<Node<T>> get neighbors => _neighbors;

  void setWeight(int newWeight) {
    weight = newWeight;
  }

  void setActive(bool active) {
    this.active = active;
  }

  void addNeighbor(Node<T> neighbor) {
    _neighbors.add(neighbor);
  }

  void removeNeighbor(Node<T> neighbor) {
    _neighbors.remove(neighbor);
  }

  Node<T> copyWith({List<Node<T>>? neighbors}) {
    return Node<T>(
      this.data,
      weight: this.weight,
      active: this.active,
      nodeNeighbors: neighbors ?? this.neighbors,
    );
  }
}
