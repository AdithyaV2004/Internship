import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management_hive/Model/student_model.dart';
import 'package:student_management_hive/Presentation/student_home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //To ensure i/o streams are open for db operations
  await Hive.initFlutter(); //await forces the function to complete before proceeding
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ScreenStudentHome());
  }
}
