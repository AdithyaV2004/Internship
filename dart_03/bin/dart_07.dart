/*
 Create a class Rectangle with properties length and breadth. Write methods to
calculate area and perimeter. 
*/
class Rectangle {
  double? length;
  double? breadth;
  void calc() {
    print("Area: ${length! * breadth!}");
    print("Perimeter: ${2 * (length! * breadth!)}");
  }
}

void main() {
  double len = 6.45;
  double bre = 9.9;
  Rectangle r = Rectangle();
  r.length = len;
  r.breadth = bre;
  r.calc();
}
