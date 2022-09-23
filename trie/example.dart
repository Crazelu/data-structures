import 'trie.dart';

void main() {
  final trie = Trie();

  trie.insert("Luck");
  trie.insert("Lucky");
  trie.insert("Luckily");
  trie.insert("Lucas");
  trie.insert("Luchi");
  trie.insert("Lucachi");
  trie.insert("Lucachison");
  trie.insert("Lucason");
  trie.insert("Lucro");
  trie.insert("Lucroul");
  trie.insert("Lucaine");
  trie.insert("Luke");

  print(trie.doesWordExist("Lucaine")); //true
  print(trie.doesPrefixExist("Luk")); //true
  print(trie.doesPrefixExist("Li")); //false

  //prints all autocomplete suggestions for 'Lu'
  print(trie.autoComplete(prefix: "Lu"));
}
