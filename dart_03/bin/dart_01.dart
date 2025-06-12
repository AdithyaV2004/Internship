class Person {
  int? age;
  String? name;
  Person(int age, String name) {
    this.age = age;
    this.name = name;
  }
}

void main() {
  Person p = Person(50, "Joy");
  print("Age: ${p.age}");
  print("Name: ${p.name}");
}
