import 'package:flutter/material.dart';
import 'package:pratice/W8_S1/project()/screens/ExspenseView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'nice ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Exspenseview(),
    );
  }
}
