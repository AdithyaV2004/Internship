import 'package:flutter/material.dart';
import 'package:flutter_08/Presentation/home_screen.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    waitsplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 88, 33),
      body: Center(child: Image(image: AssetImage("assets/loader.gif"))),
    );
  }

  waitsplash() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(
      // ignore: use_build_context_synchronously
      context,
    ).push(MaterialPageRoute(builder: (context) => ScreenHome()));
  }
}
