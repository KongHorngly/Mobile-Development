import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          color: const Color.fromARGB(255, 211, 211, 211),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(130, 201, 234, 1),
                  borderRadius: BorderRadius.circular(30),
                ),

                margin: EdgeInsets.all(10),

                child: Center(child: Text("OOP")),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 88, 194, 243),
                  borderRadius: BorderRadius.circular(30),
                ),

                margin: EdgeInsets.all(10),

                child: Center(child: Text("DART")),
              ),

              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 59, 169, 220),
                  borderRadius: BorderRadius.circular(30),
                ),

                margin: EdgeInsets.all(10),

                child: Center(child: Text("FLUTTER")),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
