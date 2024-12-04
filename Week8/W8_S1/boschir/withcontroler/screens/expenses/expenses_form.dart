import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _secondController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Textfield();
  }

  Padding Textfield() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _secondController,
            maxLength: 50,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly, // Ensures only numbers
            ],
            decoration: const InputDecoration(
              label: Text('Amount'),
              counterText: '', // Optionally hides the maxLength counter
            ),
          ),
          ElevatedButton(
              onPressed: () => {
                    print(_titleController.text),
                    print(_secondController.text),
                  },
              child: const Text('Check value')),
          ElevatedButton(onPressed: () => {}, child: const Text('Check value')),
        ],
      ),
    );
  }
}
