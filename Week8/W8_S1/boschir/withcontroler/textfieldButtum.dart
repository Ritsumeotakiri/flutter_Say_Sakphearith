import 'package:flutter/material.dart';

class Textfieldbuttum extends StatefulWidget {
  const Textfieldbuttum({super.key});

  @override
  State<Textfieldbuttum> createState() => _TextfieldbuttumState();
}

class _TextfieldbuttumState extends State<Textfieldbuttum> {
  final _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Amount'),
            ),
          ),
          ElevatedButton(
              onPressed: () => {print(_titleController.text)},
              child: const Text('Check value'))
        ],
      ),
    );
  }
}
