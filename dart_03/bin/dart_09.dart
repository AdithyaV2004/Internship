/*
Create a base class Animal with a method makeSound(). Inherit it in Dog and Cat
classes and override the method.
*/
class Animal {
  void makeSound() {
    print("Animal makes sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Dog barks.");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Cat meows.");
  }
}

void main() {
  Dog d = Dog();
  d.makeSound();
  Cat c = Cat();
  c.makeSound();
}
