# HashMap

An implementation of the HashMap data structure written in Dart.
This implementation uses open addressing to handle collisions. You can find an implementation that uses closed addressing (chaining) [here](https://github.com/Crazelu/data-structures/tree/main/hashtable).

Linear probing is used to find slots in the HashMap for insertion and when necessary, the HashMap's size is increased to allow insertion of more key-value pairs.

The underlying hash function is a division function which (admittedly) can be optimized.

The HashMap's max size can be altered in its instantiation to reduce the number of collisions and ultimately allow custom specification of allocatable contiguous memory chunks. By default, the max size is 13.

For the current implementation of the hash function, a prime max size that is not close to any multiple and 2 and 5 works best to achieve a uniform distribution.

## Example
```dart
HashMap hashMap = HashMap();
hashMap.insert(1, "one"); //or hashMap[1] = "one"
hashMap[1] = "Not one"; //replaces "one"
hashMap.remove(1);
```
