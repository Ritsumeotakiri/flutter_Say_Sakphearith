import 'package:chesstwo/screens/manu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChessTwoApp());
}

class ChessTwoApp extends StatelessWidget {
  const ChessTwoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weeboo Chess',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
