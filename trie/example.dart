import 'trie.dart';

void main() {
  final trie = Trie();

  trie.insert("Luck");
  trie.insert("Lucky");
  trie.insert("Luckylu");
  trie.insert("Lucas");
  trie.insert("Luchi");
  trie.insert("Lucachi");
  trie.insert("Lucachison");
  trie.insert("Lucason");
  trie.insert("Lucro");
  trie.insert("Lucroul");
  trie.insert("Lucaine");

  print(trie.doesWordExist("Lucaine"));

  print(trie.autoComplete(prefix: "Lu", limit: 5));
}
