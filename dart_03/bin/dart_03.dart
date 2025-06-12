abstract class Animal {
  void sayHello();
}

class Human implements Animal {
  String? name;
  Human(String nm) {
    name = nm;
  }
  void sayName() {
    print("My name is $name");
  }

  @override
  void sayHello() {
    print("$name says Hello");
  }
}

void main() {
  String nm = "Joy";
  Human h = Human(nm);
  h.sayHello();
  h.sayName();
}
