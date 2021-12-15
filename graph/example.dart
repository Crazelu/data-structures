import 'graph.dart';
import 'node.dart';

void main() {
  final node1111 = Node(12111);
  final otherNode = Node(
    333,
    nodeNeighbors: [
      Node(444),
      node1111,
    ],
  );

  final firstNode = Node(
    999,
    nodeNeighbors: [otherNode],
  );

  final node2 = Node(2);

  final graph = Graph(
    initialNode: Node(
      1,
      nodeNeighbors: [
        node2,
        Node(
          3,
          nodeNeighbors: [
            Node(42),
            Node(53),
          ],
        ),
        Node(4),
        Node(5),
      ],
    ),
  );

  print(graph);

  graph.addNode(firstNode);

  print(graph);

  graph.addEdge(
    Node(11),
    Node(30),
  );

  print(graph);
  print(graph.contains(node1111));

  // print(graph.isAdjacent(firstNode, otherNode));

  // graph.deleteNode(otherNode);

  // print(graph);

  // graph.deleteEdge(graph.initialNode!, node2);

  // print(graph);
}
