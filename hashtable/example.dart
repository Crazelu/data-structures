import 'hashtable.dart';

void main() {
  final sophiaTheCat = const Cat("Sophia", "Sphynx");
  final jamesTheCat = const Cat("James", "Sphynx");
  final hashTable = HashTable<Object, String>();

  hashTable.insert("Egypt", "Cairo");
  hashTable.insert("Ghana", "Accra");
  hashTable.insert("Sierra Leone", "Freetown");
  hashTable.insert("Togo", "Lome");
  hashTable.insert("Kenya", "Nairobi");
  hashTable[sophiaTheCat] = "Sophia";
  hashTable[jamesTheCat] = "James";
  hashTable["Nigeria"] = "Abuja";

  print(hashTable);
  print(hashTable.get("Nigeria"));
  print(hashTable.get("Egypt"));
  print(hashTable["Kenya"]);
  print(hashTable.get("Togo"));
  print(hashTable.get(jamesTheCat));

  hashTable.remove("Ghana");
  print(hashTable);
  print(hashTable.get("Ghana"));
  print(hashTable[sophiaTheCat]);

  print(hashTable.keys);
  print(hashTable.values);
}

class Cat {
  final String name;
  final String breed;

  const Cat(this.name, this.breed);

  @override
  int get hashCode {
    return name.hashCode * breed.hashCode;
  }

  @override
  bool operator ==(Object other) {
    return other is Cat && other.breed == breed && other.name == name;
  }
}
