import 'queue.dart';

void main() {
  final queue = Queue<int>();
  queue.insert(1);
  queue.insert(2);
  queue.insert(3);
  queue.insert(4);

  print(queue); //[4 -> 3 -> 2 -> 1]
  print(queue.length); //4

  print(queue.pop()); //1
  print(queue.pop()); //2
  print(queue.pop()); //3
  print(queue.pop()); //4
  print(queue.pop()); //null

  print(queue); //[] (empty queue)
  print(queue.length); //0
}
