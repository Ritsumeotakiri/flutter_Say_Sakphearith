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
          title: Text('My Hobbies'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretches the width
          children: [
            SizedBox(height: 40),
            HobbyCard(hobby: 'Travelling', icon: Icons.travel_explore), // Single hobby card
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String hobby;
  final IconData icon;

  const HobbyCard({required this.hobby, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20), // Button radius
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            SizedBox(width: 30),
            Icon(icon, color: Colors.white, size: 40), // Predefined icon
            SizedBox(width: 20),
            Text(
              hobby,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
