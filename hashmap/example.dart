import 'hashmap.dart';

void main() {
  final hashMap = HashMap<int, String>();
  hashMap[0] = 'Zero';
  hashMap[1] = 'One';
  hashMap[2] = 'Two';
  hashMap[3] = 'Three';
  hashMap[4] = 'Four';
  hashMap[5] = 'Five';
  hashMap[6] = 'Six';
  hashMap[7] = 'Seven';
  hashMap[8] = 'Eight';

  print(hashMap);

  hashMap.remove(0);

  hashMap[9] = 'Nine';
  hashMap[10] = 'Ten';
  hashMap[11] = 'Eleven';
  hashMap[12] = 'Twelve';
  hashMap[13] = 'Thirteen';
  hashMap[14] = 'Fourteen';
  hashMap[15] = 'Fifteen';

  print(hashMap);
  print(hashMap.get(0));
  print(hashMap.get(9));
}
