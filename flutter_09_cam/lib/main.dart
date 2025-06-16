import 'package:flutter/material.dart';
import 'package:flutter_09_cam/Presentation/image_screen.dart';
import 'package:flutter_09_cam/Presentation/screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Selector',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/image': (context) => const ImageScreen(),
      },
    );
  }
}
