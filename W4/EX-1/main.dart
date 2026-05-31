import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My Hobbies')),
      body: Center(
        child: Column(
          children: [
            Container(
            height: 150,
            width: 900,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 10, 179, 16),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.gamepad, size: 40, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Gaming",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
            ),
            Container(
            height: 150,
            width: 900,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 8, 214, 233),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.music_note, size: 40, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Music",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
            ),
            Container(
                height: 150,
                width: 900,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 8, 214, 233),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.travel_explore, size: 40, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Travel",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
          ],
          ),  
      ),
      ),
    );
  }
}
