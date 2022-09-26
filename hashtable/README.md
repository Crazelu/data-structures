# HashTable

An implementation of the HashTable data structure written in Dart.
This implementation uses closed addressing (chaining) to handle collisions.

The underlying hash function is a division function which (admittedly) can be optimized.

The HashTable's max size can be altered in it's instantiation to reduce the number of collisions and ultimately allow custom specification of allocatable contiguous memory chunks. By default, the max size is 13.

For the current implementation of the hash function, a prime max size that is not close to any multiple and 2 and 5 works best to achieve a uniform distribution.

## Example
```dart
HashTable hashTable = HashTable();
hashTable.insert(1, "one"); //or hashTable[1] = "one"
hashTable[1] = "Not one"; //replaces "one"
hashTable.remove(1);
```
