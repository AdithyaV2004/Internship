import 'package:flutter/material.dart';
import 'package:flutter_08/Presentation/splash_screen.dart';
import 'package:flutter_08/Presentation/summary_screen.dart';
import 'package:flutter_08/Presentation/task_model.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int todoCount = 0;
  int editFlag = 0;
  int? editingIndex; // Track which task is being edited
  final TextEditingController taskController = TextEditingController();

  List<TodoModel> myTask = [];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 88, 33),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScreenSplash()),
            );
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Text(
          "ToDo App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: taskController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter the task first";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter your task here",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              TodoModel t = TodoModel(
                                taskName: taskController.text,
                                taskStatus: "0",
                                taskID: (editingIndex == null)
                                    ? (++todoCount).toString()
                                    : myTask[editingIndex!].taskID,
                              );

                              setState(() {
                                if (editFlag == 0) {
                                  addTodo(t);
                                } else {
                                  if (editingIndex != null) {
                                    editTodo(t, editingIndex!);
                                  }
                                }
                                taskController.clear();
                                editFlag = 0;
                                editingIndex = null;
                              });
                            }
                          },
                          icon: Icon(editFlag == 0 ? Icons.add : Icons.save),
                        ),
                        if (editFlag == 1)
                          IconButton(
                            onPressed: () {
                              setState(() {
                                taskController.clear();
                                editFlag = 0;
                                editingIndex = null;
                              });
                            },
                            icon: Icon(Icons.cancel),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          myTask[index].taskStatus =
                              myTask[index].taskStatus == "0" ? "1" : "0";
                        });
                      },
                      leading: Text(
                        (index + 1).toString(),
                        style: TextStyle(fontSize: 17),
                      ),
                      title: Text(myTask[index].taskName),
                      subtitle: Row(
                        children: [
                          Text(
                            myTask[index].taskStatus == "0"
                                ? "Not Completed"
                                : "Completed",
                            style: TextStyle(
                              color: myTask[index].taskStatus == "0"
                                  ? Colors.red
                                  : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Statusdetails(task: myTask[index]),
                                ),
                              );
                            },
                            child: Text("View"),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                myTask.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                editFlag = 1;
                                editingIndex = index;
                                taskController.text = myTask[index].taskName;
                              });
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: myTask.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Add task
  void addTodo(TodoModel t) {
    myTask.add(t);
  }

  // Edit task at specific index
  void editTodo(TodoModel t, int index) {
    myTask[index] = t;
  }
}
