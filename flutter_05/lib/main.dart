import 'package:flutter/material.dart';
import 'package:flutter_05/Presentation/splash_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ScreenSplash());
  }
}
