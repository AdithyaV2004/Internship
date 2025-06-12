/*
Define a class Person with a constructor that initializes name and age. Create and display
the object.

*/
class Person {
  final String nm;
  final int ag;

  Person({required this.nm, required this.ag});
  void display() {
    print("Name: $nm\nAge: $ag\n");
  }
}

void main() {
  Person p1 = Person(ag: 20, nm: "Adithya");
  p1.display();
}
