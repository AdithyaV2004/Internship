/*
Create a base class Shape with a method area(). Inherit it in Rectangle and
Circle classes and override the area() method. 
*/
abstract class Shape {
  void area();
}

class Rectangle extends Shape {
  double? length;
  double? breadth;
  Rectangle(double l, double b) {
    length = l;
    breadth = b;
  }
  @override
  void area() {
    print("Area of Rectangle: ${length! * breadth!}");
  }
}

class Circle extends Shape {
  double? radius;
  Circle(double r) {
    radius = r;
  }

  @override
  void area() {
    print("Area of Circle: ${3.14 * radius! * radius!}");
  }
}

void main() {
  Rectangle r = Rectangle(10, 4);
  r.area();
  Circle c = Circle(34);
  c.area();
}
