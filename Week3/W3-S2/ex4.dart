import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Customcadr(text: "First Card"),
            Customcadr(text: "Second Card", color: Colors.yellow), // Example with a different color
            Customcadr(), // Default text "Hello"
          ],
        ),
      ),
    ),
  ));
}

class Customcadr extends StatelessWidget {
  final String text;
  final Color color;

  const Customcadr({
    super.key,
    this.text = "Hello", // Default text
    this.color = Colors.white, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),
      margin: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 24, color: color),
          ),
        ),
      ),
    );
  }
}
