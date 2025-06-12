import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

// ignore: must_be_immutable
class MainApp extends StatelessWidget {
  MainApp({super.key});
  ValueNotifier<Color> colorNotifier = ValueNotifier(Colors.black);
  ValueNotifier<Color> backColorNotifier = ValueNotifier(Colors.white);
  ValueNotifier<String> displayString = ValueNotifier("click button");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValueListenableBuilder(
        valueListenable: backColorNotifier,
        builder: (context, newColor, _) {
          return Scaffold(
            backgroundColor: newColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          colorNotifier.value = Colors.blue;
                          backColorNotifier.value = Colors.black;
                          displayString.value = "Black";
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: Text(""),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          colorNotifier.value = Colors.red;
                          backColorNotifier.value = Colors.yellow;
                          displayString.value = "Red";
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: Text(""),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          colorNotifier.value = Colors.pink;
                          backColorNotifier.value = const Color.fromARGB(
                            255,
                            238,
                            213,
                            213,
                          );
                          displayString.value = "Pink";
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                        ),
                        child: Text(""),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),

                  //required text
                  ValueListenableBuilder(
                    valueListenable: colorNotifier,
                    builder: (context, Color newColor, _) {
                      return ValueListenableBuilder(
                        valueListenable: displayString,
                        builder: (context, String newString, _) {
                          return Text(
                            newString,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: newColor,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
