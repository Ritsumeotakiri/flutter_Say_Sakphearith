import 'package:flutter/material.dart';
import 'package:pratice/W8_S1/project()/models/exspense.dart';

class ExspenseScreen extends StatefulWidget {
  const ExspenseScreen({super.key});

  @override
  State<ExspenseScreen> createState() => _ExspenseScreenState();
}

class _ExspenseScreenState extends State<ExspenseScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Exspenseview extends StatelessWidget {
  const Exspenseview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ExpenseType.values.map((e) => Text(e.name)).toList(),
    );
  }
}
