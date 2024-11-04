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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            HobbyCard(hobby: 'Travelling', icon: Icons.travel_explore),
            SizedBox(height: 10),
            HobbyCard(hobby: 'Skating', icon: Icons.sports_hockey), // Updated icon
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
  final Color backgroundColor; // Optional background color

  const HobbyCard({
    required this.hobby,
    required this.icon,
    this.backgroundColor = Colors.blue, // Default value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: backgroundColor, // Use the passed background color
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            SizedBox(width: 30),
            Icon(icon, color: Colors.white, size: 40),
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
