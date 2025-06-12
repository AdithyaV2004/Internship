import 'package:flutter/material.dart';
import 'package:flutter_06_emp_payroll/Presentation/pay_screen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  List<String> employeeDepartment = ["IT", "HR", "Finance", "Management"];
  String? selectedDepartment;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          "Employee Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 46, 105, 48),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 100, 8, 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Employee name is required";
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Employee Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 40, 8, 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Employee ID is required";
                      }
                      return null;
                    },
                    controller: idController,
                    decoration: InputDecoration(
                      hintText: "Employee ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 50, 8, 20),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Choose a department";
                      }
                      return null;
                    },
                    items: employeeDepartment.map((department) {
                      return DropdownMenuItem(
                        value: department,
                        child: Text(department),
                      );
                    }).toList(),
                    onChanged: (newDept) {
                      selectedDepartment = newDept!;
                    },
                    hint: Text("Select Department"),
                    value: selectedDepartment,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 40, 8, 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Salary is required";
                      }
                      return null;
                    },
                    controller: salaryController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Basic Salary",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 370,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double bs = double.parse(salaryController.text);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PayScreen(
                              employeeName: nameController.text,
                              employeeId: idController.text,
                              department: selectedDepartment ?? 'None',
                              basicSalary: bs,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 17, 112, 7),
                    ),
                    child: Text(
                      "Process",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
