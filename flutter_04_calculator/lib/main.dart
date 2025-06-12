import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  Widget calcButton({
    required String label,
    required VoidCallback onPressed,
    required Color color,
    double fontSize = 30,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(90, 90),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const Drawer(
        child: Center(
          child: Text("Drawer content", style: TextStyle(fontSize: 18)),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Calculator",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            color: Color.fromARGB(255, 0, 255, 42),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 230,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: TextFormField(
                  cursorHeight: 80,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 30, right: 10),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Enter expression",
                    hintStyle: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // First Row
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton(
                    label: "AC",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 109, 105, 105),
                  ),
                  calcButton(
                    label: "+/-",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 109, 105, 105),
                    fontSize: 25,
                  ),
                  calcButton(
                    label: "%",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 109, 105, 105),
                  ),
                  calcButton(
                    label: "÷",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 193, 193, 3),
                    fontSize: 40,
                  ),
                ],
              ),
            ),

            // Second Row
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton(
                    label: "7",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 47, 37, 37),
                  ),
                  calcButton(
                    label: "8",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 47, 37, 37),
                  ),
                  calcButton(
                    label: "9",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 47, 37, 37),
                  ),
                  calcButton(
                    label: "X",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 193, 193, 3),
                  ),
                ],
              ),
            ),

            // Third Row
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton(
                    label: "4",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 47, 37, 37),
                  ),
                  calcButton(
                    label: "5",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 47, 37, 37),
                  ),
                  calcButton(
                    label: "6",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 47, 37, 37),
                  ),
                  calcButton(
                    label: "-",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 193, 193, 3),
                    fontSize: 45,
                  ),
                ],
              ),
            ),

            // Fourth Row
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton(
                    label: "1",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 47, 37, 37),
                  ),
                  calcButton(
                    label: "2",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 47, 37, 37),
                  ),
                  calcButton(
                    label: "3",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 47, 37, 37),
                  ),
                  calcButton(
                    label: "+",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 193, 193, 3),
                    fontSize: 40,
                  ),
                ],
              ),
            ),

            // Fifth Row
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 47, 37, 37),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: 90,
                    height: 90,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.calculate,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),

                  calcButton(
                    label: "0",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 47, 37, 37),
                  ),
                  calcButton(
                    label: ".",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 47, 37, 37),
                    fontWeight: FontWeight.bold,
                  ),
                  calcButton(
                    label: "=",
                    onPressed: () {},
                    color: const Color.fromARGB(255, 193, 193, 3),
                    fontSize: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
