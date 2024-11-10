import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Selectable Buttons'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableButton(),
              const SizedBox(height: 16.0),
              SelectableButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
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

  String get _textLabel => _isSelected ? 'Selected' : 'Not Selected';
  Color get _textColor => _isSelected ? Colors.white : Colors.black;
  Color get _backgroundColor =>
      _isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: _toggleSelection,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _backgroundColor, // Use backgroundColor instead of primary
        ),
        child: Center(
          child: Text(
            _textLabel,
            style: TextStyle(
              color: _textColor,
            ),
          ),
        ),
      ),
    );
  }
}
