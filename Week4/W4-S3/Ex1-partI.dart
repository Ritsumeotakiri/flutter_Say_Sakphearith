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
        appBar: AppBar(title: const Text('Selectable Button Example')),
        body: Center(child: SelectableButton()),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool _isSelected = false;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: _toggleSelection,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _isSelected ? Colors.blue : Colors.grey, // Background color
        ),
        child: Center(
          child: Text(
            _isSelected ? "Selected" : "Not Selected",
            style: TextStyle(
              color: _isSelected ? Colors.white : Colors.black, // Text color
            ),
          ),
        ),
      ),
    );
  }
}
