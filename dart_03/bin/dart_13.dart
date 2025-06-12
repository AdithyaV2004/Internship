/*
Create a list of strings and sort it alphabetically, then print the sorted list
Reverse a list and print the reversed list.

Check if an element exists in a list using contains and print the result.
*/
void main() {
  List<String> myString = ["Adithya", "Raj", "Abin", "Berly", "Ching Chong", "Hima"];
  myString.sort();
  List<String> revString = myString.reversed.toList();
  print(myString);
  print(revString);
  bool con = myString.contains("Raj");
  if (con) {
    print("Search is successful.");
  } else {
    print("Search is unsuccessful.");
  }
}
