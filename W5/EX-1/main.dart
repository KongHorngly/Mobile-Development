import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableButton(),
              SizedBox(height: 10),
              SelectableButton(),
              SizedBox(height: 10),
              SelectableButton(),
              SizedBox(height: 10),
              SelectableButton(),
            ],
          ),
        ),
      ),
    ),
  );
}

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  String get buttonText => isSelected ? "Selected" : "Not Selected";

  Color get textColor => isSelected ? Colors.white : Colors.black;

  Color get backgroundColor =>
      isSelected ? Colors.blue.shade500 : Colors.blue.shade50;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Text(
          buttonText,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
    );
  }
}
