import 'package:flutter/material.dart';

class CounterHome extends StatefulWidget {
  const CounterHome({super.key});

  @override
  State<CounterHome> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter",
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(150),
              ),
              child: Text(
                counter.toString(),
                style: TextStyle(color: Colors.white, fontSize: 90),
              ),
            ),
            Text("Press the button!"),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  //To update widgets in stateful widget.
                  counter -= 1;
                });
              },
              child: Icon(Icons.minimize),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter += 1;
              });
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
