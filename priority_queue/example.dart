import 'priority_queue.dart';

void main() {
  simpleExample();
  advancedExample();
}

void simpleExample() {
  final queue = PriorityQueue<int>();
  queue.insert(1);
  queue.insert(2);
  queue.insert(3);
  queue.insert(7);
  queue.insert(8);
  queue.insert(5);
  queue.insert(90);
  queue.insert(4);
  queue.insert(0);

  print(queue);
}

void advancedExample() {
  final queue = PriorityQueue<Computation>();

  queue.insert(
    Computation(priority: 1, action: () => print("Oops I'll be executed last")),
  );

  queue.insert(
    Computation(priority: 2, action: () => print("At least I'm not last")),
  );

  queue.insert(
    Computation(priority: 3, action: () => print("I'll be executed first")),
  );

  queue.insert(
    Computation(
      priority: 3,
      action: () => print("I'll be executed just after the first action"),
    ),
  );

  for (var computation in queue.entries) {
    computation.run();
  }
}

class Computation implements Comparable {
  const Computation({
    required this.priority,
    required this.action,
  });

  final int priority;
  final Function() action;

  void run() => action();

  @override
  int compareTo(other) {
    return priority.compareTo((other as Computation).priority);
  }

  @override
  String toString() {
    return "Computation(priority: $priority, action: $action)";
  }
}
