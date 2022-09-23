class _TrieNode {
  final Map<String, _TrieNode> children;
  late bool endOfWord;

  _TrieNode({
    this.endOfWord = false,
  }) : children = {};
}

class Trie {
  final _TrieNode _root;

  Trie() : _root = _TrieNode();

  ///Inserts word into trie
  void insert(String word) {
    int length = word.length;
    _TrieNode node = _root;
    for (int i = 0; i < length; i++) {
      final char = word[i];
      if (node.children[char] == null) {
        final newNode = _TrieNode(endOfWord: i == length - 1);
        node.children[char] = newNode;
        node = newNode;
      } else {
        node = node.children[char]!;
      }
    }
    node.endOfWord = true;
  }

  ///Performs a prefix search
  bool doesPrefixExist(String prefix) {
    int length = prefix.length;
    _TrieNode node = _root;
    for (int i = 0; i < length; i++) {
      final char = prefix[i];
      if (node.children[char] == null) return false;
      node = node.children[char]!;
    }
    return true;
  }

  ///Performs a full word search
  bool doesWordExist(String word) {
    int length = word.length;
    _TrieNode node = _root;
    for (int i = 0; i < length; i++) {
      final char = word[i];
      if (node.children[char] == null) return false;
      node = node.children[char]!;
    }
    return node.endOfWord;
  }

  int? _getLimit({int count = 0, int? limit}) {
    if (limit == null) return null;
    return limit - count;
  }

  ///Autocompletes [prefix] with suggestions from `trie`.
  ///If `limit` is not null, the returned list of suggestions
  ///will contain <=limit elements.
  List<String> autoComplete({required String prefix, int? limit}) {
    List<String> result = [];

    _TrieNode node = _root;
    int length = prefix.length;
    for (int i = 0; i < length; i++) {
      final char = prefix[i];
      if (node.children[char] == null) return [];
      node = node.children[char]!;
    }

    for (var char in node.children.keys) {
      final length = result.length;
      if (limit != null && length >= limit) break;
      _TrieNode? currentNode = node.children[char];
      if (currentNode == null || currentNode.endOfWord) {
        result.add(prefix + char);
        result.addAll(
          autoComplete(
            prefix: prefix + char,
            limit: _getLimit(limit: limit, count: length),
          ),
        );
      } else {
        result.addAll(
          autoComplete(
            prefix: prefix + char,
            limit: _getLimit(limit: limit, count: length),
          ),
        );
      }
    }

    if (limit != null) return result.take(limit).toList();

    return result;
  }
}
