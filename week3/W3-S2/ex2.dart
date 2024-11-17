import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(40),
          color: Colors.blue,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.cyan, 
              borderRadius: BorderRadius.circular(10), 
            ),
            child: const Text(
              "Hello, CADT Student!",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    ),
  ));
}
