class _Node<K extends Object, V extends Object> {
  _Node<K, V>? next;
  K key;
  V value;

  _Node({
    required this.key,
    required this.value,
    this.next,
  });
}

class HashTable<K extends Object, V extends Object> {
  HashTable({int maxSize = 13}) {
    _maxSize = maxSize;
    _table = List<_Node<K, V>?>.generate(_maxSize, (index) => null);
  }
  late int _maxSize;
  late List<_Node<K, V>?> _table;

  int _hash(K key) {
    return key.hashCode % _maxSize;
  }

  void insert(K key, V value) {
    remove(key);
    final hashValue = _hash(key);
    final newNode = _Node<K, V>(key: key, value: value);
    _Node<K, V>? lastNode = _table[hashValue];

    if (lastNode == null) {
      _table[hashValue] = newNode;
      return;
    }

    while (lastNode?.next != null) {
      lastNode = lastNode?.next;
    }
    lastNode?.next = newNode;
  }

  V? get(K key) {
    _Node<K, V>? node = _table[_hash(key)];
    while (node != null) {
      if (node.key == key) return node.value;
      node = node.next;
    }
    return null;
  }

  void remove(K key) {
    final hashValue = _hash(key);

    _Node<K, V>? previousNode;
    _Node<K, V>? node = _table[hashValue];

    while (node != null) {
      if (node.key == key) {
        if (previousNode == null) {
          _table[hashValue] = node.next;
        } else {
          previousNode.next = node.next;
        }
        return;
      }
      previousNode = node;
      node = node.next;
    }
  }

  void clear() {
    _table = List<_Node<K, V>?>.generate(_maxSize, (index) => null);
  }

  List<K> get keys {
    List<K> result = [];
    for (var column in _table) {
      _Node<K, V>? node = column;
      while (node != null) {
        result.add(node.key);
        node = node.next;
      }
    }
    return result;
  }

  List<V> get values {
    List<V> result = [];
    for (var column in _table) {
      _Node<K, V>? node = column;
      while (node != null) {
        result.add(node.value);
        node = node.next;
      }
    }
    return result;
  }

  void operator []=(K key, V value) {
    insert(key, value);
  }

  V? operator [](K key) => get(key);

  @override
  String toString() {
    String result = "";
    for (var column in _table) {
      _Node? node = column;
      while (node != null) {
        result += "${node.key}: ${node.value}, ";
        node = node.next;
      }
    }

    if (result.isNotEmpty) {
      result = result.substring(0, result.length - 2);
    }

    return "{$result}";
  }
}
