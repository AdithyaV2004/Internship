import 'package:flutter/material.dart';
import 'package:flutter_05/Presentation/home_screen.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      ),
    );
  }

  waitsplash() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(
      // ignore: use_build_context_synchronously
      context,
    ).push(MaterialPageRoute(builder: (context) => ScreenHome()));
  }
}
