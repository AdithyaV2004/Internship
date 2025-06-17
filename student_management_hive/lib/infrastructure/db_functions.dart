import 'package:hive_flutter/adapters.dart';
import 'package:student_management_hive/Core/core.dart';
import 'package:student_management_hive/Model/student_model.dart';

void addStudent(StudentModel s) async {
  final result = await Hive.openBox<StudentModel>("Student_DB");
  int id = await result.add(s);
  s.id = id.toString();
  await result.put(id, s);
  getAllStudents();
}

void getAllStudents() async {
  final result = await Hive.openBox<StudentModel>("Student_DB");
  studentsList.value.clear();
  studentsList.value.addAll(result.values);
  studentsList.notifyListeners();
}

Future<void> deleteStudent(int key) async {
  final studentDB = await Hive.openBox<StudentModel>('Student_DB');
  await studentDB.delete(key);
  getAllStudents();
}

Future<void> updateStudent(int key, StudentModel newStudent) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.put(key, newStudent);
  getAllStudents(); // Refresh UI
}
