# PriorityQueue

An implementation of the PriorityQueue data structure written in Dart.
This implementation uses `Comparable` type to check for priority and insert items where they belong in the queue.


## Example
```dart
void main() {
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

//----OUTPUT-----

//I'll be executed first
//I'll be executed just after the first action
//At least I'm not last
//Oops I'll be executed last
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
}
```
