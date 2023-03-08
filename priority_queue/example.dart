import 'priority_queue.dart';

void main() {
  final priorityQueue = PriorityQueue<String>();
  priorityQueue.insert("Dean 1", 4);
  priorityQueue.insert("VC 1", 5);
  priorityQueue.insert("Student 1", 2);
  priorityQueue.insert("VC 2", 5);
  priorityQueue.insert("Dean 2", 4);
  priorityQueue.insert("Lecturer 1", 3);
  priorityQueue.insert("Student 2", 2);
  priorityQueue.insert("VC 3", 5);
  priorityQueue.insert("Dean 3", 4);
  priorityQueue.insert("Lecturer 2", 3);

  print(priorityQueue);
  print(priorityQueue.length);
}
