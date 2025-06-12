import 'package:flutter/material.dart';

class PayScreen extends StatelessWidget {
  final String employeeName;
  final String employeeId;
  final String department;
  final double basicSalary;

  const PayScreen({
    super.key,
    required this.employeeName,
    required this.employeeId,
    required this.department,
    required this.basicSalary,
  });

  @override
  Widget build(BuildContext context) {
    double da = 0.5 * basicSalary;
    double hra = 0.3 * basicSalary;
    double ta = 0.15 * basicSalary;
    double netSalary = basicSalary + da + hra + ta;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 249, 32, 104),
        title: Text(
          "Pay Slip",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Employee Name: $employeeName", style: _detailTextStyle()),
            Text("Employee ID: $employeeId", style: _detailTextStyle()),
            Text("Employee Department: $department", style: _detailTextStyle()),
            Text("Basic Salary: ₹$basicSalary", style: _detailTextStyle()),
            Text("HRA: ₹$hra", style: _detailTextStyle()),
            Text("DA: ₹$da", style: _detailTextStyle()),
            Text("TA: ₹$ta", style: _detailTextStyle()),
            Text("Net Salary: ₹$netSalary", style: _detailTextStyle()),
          ],
        ),
      ),
    );
  }

  TextStyle _detailTextStyle() {
    return TextStyle(
      color: Colors.blue,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }
}
