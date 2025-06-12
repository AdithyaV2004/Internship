/*
19. Define a class Student with the following properties:
rollNo (int), name (String), age (int), totalMarks (double)
Create a list of Student objects with at least 3 students. Each student should have
unique rollNo, name, age, and totalMarks.
Implement the following operations on the list:
a. Add Operation: Add a new student to the list.
b. Edit Operation: Update the details of a student using their rollNo.
c. Delete Operation: Remove a student from the list using their rollNo.
 */

class Student {
  int? rollNo;
  String? name;
  int? age;
  double? totalMarks;
  Student({this.rollNo, this.name, this.age, this.totalMarks});
}

void main() {
  Student s1 = Student(rollNo: 12, name: "Adithyan", age: 19, totalMarks: 45.5);
  Student s2 = Student(rollNo: 13, name: "Adithya", age: 20, totalMarks: 35.5);
  Student s3 = Student(rollNo: 47, name: "Berly", age: 21, totalMarks: 40.5);
  List<Student> studentList = [s1, s2, s3];
  for (var i in studentList) {
    print(
      "Name: ${i.name} \nRollNo: ${i.rollNo} \nAge: ${i.age} \nTotal Marks: ${i.totalMarks}\n",
    );
  }
  Student s4 = Student(rollNo: 48, name: "Mathew", age: 22, totalMarks: 30.5);
  studentList.add(s4);
  for (var i in studentList) {
    if (i.rollNo == 47) {
      i.totalMarks = (i.totalMarks! + 10);
    }
  }
  print("\nUpdated marks:");
  for (var i in studentList) {
    print(
      "Name: ${i.name} \nRollNo: ${i.rollNo} \nAge: ${i.age} \nTotal Marks: ${i.totalMarks}\n",
    );
  }

  studentList.removeWhere((i) => i.rollNo == 13); //To implement inline function

  print("\nDeleted marks:");
  for (var i in studentList) {
    print(
      "Name: ${i.name} \nRollNo: ${i.rollNo} \nAge: ${i.age} \nTotal Marks: ${i.totalMarks}\n",
    );
  }
}
