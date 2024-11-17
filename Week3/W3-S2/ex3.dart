import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(9),
              margin: EdgeInsets.all(10), 
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple], // Define gradient colors here
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    "rith",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(9),
              margin: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    "rith",
                    style: TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(9),
              margin: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    "rith",
                    style: TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}
