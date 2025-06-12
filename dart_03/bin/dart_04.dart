//List
void main() {
  List<int> myList = [1, 2, 3, 4, 5, 6];

  myList.add(10);
  myList.insert(4, 34);
  myList.addAll([7, 8, 9]);
  myList.remove(4);
  myList.removeAt(3);
  myList.removeRange(0, 3);
  myList.removeWhere(
    (i) => i < 6,
  ); //To iterate over a list and remove an element by an condition
  print("${myList.length}");
  myList.sort();
  myList.sort((a, b) {
    return b.compareTo(a);
  });
  print("$myList");
}
