import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

// ignore: must_be_immutable
class MainApp extends StatelessWidget {
  MainApp({super.key});
  ValueNotifier<bool> doHide = ValueNotifier(true);
  ValueNotifier<String> str = ValueNotifier("show");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  doHide.value = doHide.value == true ? false : true;
                },
                child: ValueListenableBuilder(
                  valueListenable: doHide,
                  builder: (context, bool newVisibility, _) {
                    return Text(newVisibility == true ? "Hide" : "Show");
                  },
                ),
              ),
              ValueListenableBuilder(
                valueListenable: doHide,
                builder: (context, bool newVisibility, _) {
                  return Visibility(
                    visible: newVisibility,
                    child: Text("Ninja text"),
                  );
                },
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     counterNotifier.value = counterNotifier.value + 1;
        //   },
        //   child: Icon(Icons.add),
        // ),
      ),
    );
  }
}
