/*
Define a class Student with properties name, age, and grade, and the member function
getValue() to display student details respectively. Create an object and using the object
initialize the member variables, and get values of a student
*/
class Student {
  String? name;
  int? age;
  int? grade;
  void getValue(String name, int age, int grade) {
    this.name = name;
    this.age = age;
    this.grade = grade;
    print("Name: $name \nAge: $age \nGrade: $grade");
  }
}

void main() {
  Student s = Student();
  s.getValue("Adithya", 20, 12);
}
