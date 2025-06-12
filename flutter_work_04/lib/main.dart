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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 9, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 141, 44),
        toolbarHeight: 80,
        title: const Text(
          "Welcome Home",
          style: TextStyle(
            color: Color.fromARGB(255, 213, 255, 1),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 9, 141, 44),
              ),
              child: IconButton(
                onPressed: () {
                  debugPrint("----Logout icon pressed----");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color.fromARGB(255, 0, 51, 95),
                      content: Text(
                        "You have been logged out!",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 212, 255, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      duration: Duration(seconds: 2), // show for 2 seconds
                    ),
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                tooltip: 'Logout',
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: 420,
              child: Image.asset("assets/world.jpg", fit: BoxFit.cover),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "Hello World",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 183, 255, 0),
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                debugPrint("----ElevatedButton Pressed----");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 0, 51, 95),
                    content: Text(
                      "You have been Elevated!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 243, 205, 204),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    duration: Duration(seconds: 2), // show for 2 seconds
                  ),
                );
              },
              child: const Text(
                "Elevate",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
              ),
            ),
            TextButton(
              onPressed: () {
                debugPrint("----TextButton pressed----");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 0, 51, 95),
                    content: Text(
                      "You have Texted!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 195, 255, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    duration: Duration(seconds: 2), // show for 2 seconds
                  ),
                );
              },
              child: const Text(
                "Text",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
