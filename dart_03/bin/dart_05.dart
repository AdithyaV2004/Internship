class Student {
  final String? name;
  final int? roll;
  final int? mark;

  Student({required this.name, required this.roll, required this.mark});
}

void main() {
  List<Student> myStudent = [];
  Student s1 = Student(name: "Adithya", roll: 13, mark: 37);
  Student s2 = Student(name: "Raj", roll: 12, mark: 47);
  myStudent.addAll([s1, s2]);
  for (var doc in myStudent) {
    print("Name:${doc.name}\nRoll:${doc.roll}\nMark:${doc.mark}\n");
  }
}
