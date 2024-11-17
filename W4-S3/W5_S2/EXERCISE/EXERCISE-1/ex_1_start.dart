import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // Method 1: Loop in Array
            const Label("Method 1: Loop in Array", bold: true),
            const Text("Start"),
            for (var i = 0; i < colors.length; i++) Text(colors[i]),
            const Text("End"),
            const SizedBox(height: 20),

            // Method 2: Map
            const Label("Method 2: Map", bold: true),
            const Text("Start"),
            ...colors.map((color) => Text(color)).toList(),
            const Text("End"),
            const SizedBox(height: 20),

            // Method 3: Dedicated Function
            const Label("Method 3: Dedicated Function", bold: true),
            const Text("Start"),
            ...getColorWidgets(),
            const Text("End"),
          ],
        ),
      ),
    ),
  ));
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}

// Dedicated function for Method 3
List<Widget> getColorWidgets() {
  return colors.map((color) => Text(color)).toList();
}
