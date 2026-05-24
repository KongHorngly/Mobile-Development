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
        body: Center(
          child: Container(
            width: 500,
            height: 200,
            alignment: Alignment.center,

            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 7, 105, 192),
            ),

            child: const Text(
              "Lyyyy Steav",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
