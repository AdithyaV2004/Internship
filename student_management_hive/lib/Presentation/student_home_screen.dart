import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management_hive/Core/core.dart';
import 'package:student_management_hive/Model/student_model.dart';
import 'package:student_management_hive/infrastructure/db_functions.dart';

class ScreenStudentHome extends StatefulWidget {
  const ScreenStudentHome({super.key});

  @override
  State<ScreenStudentHome> createState() => _ScreenStudentHomeState();
}

class _ScreenStudentHomeState extends State<ScreenStudentHome> {
  final studentNameController = TextEditingController();
  final studentRollNoController = TextEditingController();
  final studentMarksController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int? editingKey; // Holds the key of the student being edited

  @override
  void initState() {
    super.initState();
    getAllStudents();
  }

  void clearFields() {
    studentNameController.clear();
    studentRollNoController.clear();
    studentMarksController.clear();
    setState(() {
      editingKey = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Students Management',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .45,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: studentNameController,
                      validator: (value) =>
                          value!.isEmpty ? 'Student Name Required' : null,
                      decoration: InputDecoration(
                        hintText: 'Student Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: studentRollNoController,
                              validator: (value) => value!.isEmpty
                                  ? 'Roll Number Required'
                                  : null,
                              decoration: InputDecoration(
                                hintText: 'Student Roll Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: studentMarksController,
                              validator: (value) =>
                                  value!.isEmpty ? 'Marks Required' : null,
                              decoration: InputDecoration(
                                hintText: 'Student Marks',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final student = StudentModel(
                                  id: '',
                                  studentName: studentNameController.text,
                                  studentRollNumber:
                                      studentRollNoController.text,
                                  studentMarks: studentMarksController.text,
                                );

                                if (editingKey != null) {
                                  await updateStudent(editingKey!, student);
                                } else {
                                  addStudent(student);
                                }

                                clearFields();
                              }
                            },
                            child: Text(
                              editingKey == null
                                  ? 'Add Student'
                                  : 'Update Student',
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () async {
                              final result = await Hive.openBox<StudentModel>(
                                'student_db',
                              );
                              await result.clear();
                              getAllStudents();
                              clearFields();
                            },
                            child: Text('Clear All'),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.indigo),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * .55,
            child: ValueListenableBuilder(
              valueListenable: studentsList,
              builder: (context, List<StudentModel> studentList, _) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final student = studentList[index];
                    return ListTile(
                      leading: Text(student.studentName[0]),
                      title: Text(student.studentName),
                      subtitle: Row(
                        children: [
                          Text('Roll Number: ${student.studentRollNumber}'),
                          Spacer(),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  final box = await Hive.openBox<StudentModel>(
                                    'student_db',
                                  );
                                  final key = box.keyAt(index);
                                  final selected = box.get(key);

                                  if (selected != null) {
                                    setState(() {
                                      editingKey = key;
                                      studentNameController.text =
                                          selected.studentName;
                                      studentRollNoController.text =
                                          selected.studentRollNumber;
                                      studentMarksController.text =
                                          selected.studentMarks;
                                    });
                                  }
                                },
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final box = await Hive.openBox<StudentModel>(
                                    'student_db',
                                  );
                                  final key = box.keyAt(index);
                                  await deleteStudent(key);
                                  clearFields();
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Text(student.studentMarks),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: studentList.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
