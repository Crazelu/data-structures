class _Node<K extends Object, V extends Object> {
  const _Node({
    required this.key,
    required this.value,
  });

  final K key;
  final V value;
}

class _DeletedNode<K extends Object, V extends Object> extends _Node<K, V> {
  const _DeletedNode({required super.key, required super.value});
}

class HashMap<K extends Object, V extends Object> {
  static const _kMaxSize = 13;

  HashMap({int maxSize = _kMaxSize}) {
    _maxSize = maxSize;
    _table = List<_Node<K, V>?>.generate(_maxSize, (index) => null);
  }
  late int _maxSize;
  late List<_Node<K, V>?> _table;

  int _hash(K key) {
    return key.hashCode % _maxSize;
  }

  void _growSizeAndCopyTable() {
    final oldTable = _table;
    _maxSize += _kMaxSize;
    _table = List<_Node<K, V>?>.generate(_maxSize, (index) => null);
    for (final node in oldTable) {
      if (node != null && node is! _DeletedNode) {
        insert(node.key, node.value);
      }
    }
  }

  void insert(K key, V value) {
    int hashValue = _hash(key);
    final newNode = _Node<K, V>(key: key, value: value);
    if (_table[hashValue] == null) {
      _table[hashValue] = newNode;
      return;
    }

    if (_table[hashValue] != null && _table[hashValue]!.key == key) {
      _table[hashValue] = newNode;
      return;
    }

    int increment = 1;
    int nextHash = hashValue + increment;

    while (true) {
      if (nextHash > _maxSize - 1) {
        _growSizeAndCopyTable();
        insert(key, value);
        return;
      }

      if (_table[nextHash] == null || _table[nextHash] is _DeletedNode) {
        _table[nextHash] = newNode;
        return;
      }

      increment++;
      nextHash = hashValue + increment;
    }
  }

  void remove(K key) {
    int hashValue = _hash(key);
    var node = _table[hashValue];
    if (node != null && node.key == key) {
      _table[hashValue] = _DeletedNode<K, V>(key: node.key, value: node.value);
      return;
    }

    hashValue++;
    while (true) {
      if (hashValue > _maxSize - 1) return;

      node = _table[hashValue];

      if (node == null) return;

      if (node.key == key) {
        _table[hashValue] = _DeletedNode<K, V>(
          key: node.key,
          value: node.value,
        );
        return;
      }

      hashValue++;
    }
  }

  V? get(K key) {
    int hashValue = _hash(key);
    var node = _table[hashValue];
    if (node != null && node.key == key) {
      return node.value;
    }

    hashValue++;
    while (true) {
      if (hashValue > _maxSize - 1) return null;

      node = _table[hashValue];

      if (node == null) return null;

      if (node.key == key) return node.value;

      hashValue++;
    }
  }

  void clear() {
    _maxSize = _kMaxSize;
    _table = List<_Node<K, V>?>.generate(_maxSize, (index) => null);
  }

  Iterable<K> get keys {
    List<K> _keys = [];
    for (final node in _table) {
      if (node != null && node is! _DeletedNode) {
        _keys.add(node.key);
      }
    }
    return _keys;
  }

  Iterable<V> get values {
    List<V> _values = [];
    for (final node in _table) {
      if (node != null && node is! _DeletedNode) {
        _values.add(node.value);
      }
    }
    return _values;
  }

  void operator []=(K key, V value) => insert(key, value);
  V? operator [](K key) => get(key);

  @override
  String toString() {
    String result = '';

    for (final node in _table) {
      if (node != null && node is! _DeletedNode) {
        result += '${node.key}: ${node.value}, ';
      }
    }

    if (result.isNotEmpty) {
      result = result.substring(0, result.length - 2);
    }

    return '{$result}';
  }
}
