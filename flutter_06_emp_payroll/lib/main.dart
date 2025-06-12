import 'package:flutter/material.dart';
import 'package:flutter_06_emp_payroll/Presentation/details_screen.dart';
// import 'package:flutter_06_emp_payroll/Presentation/pay_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DetailsScreen());
  }
}
