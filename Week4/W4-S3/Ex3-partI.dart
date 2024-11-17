import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  List<String> imagePaths = ['assets/image.png', 'assets/q.png'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Gallery'),
          actions: [
            IconButton(
              icon: Text('<', style: TextStyle(fontSize: 24.0)),
              onPressed: previousImage,
            ),
            SizedBox(width: 8.0),
            IconButton(
              icon: Text('>', style: TextStyle(fontSize: 24.0)),
              onPressed: nextImage,
            ),
          ],
        ),
        body: Center(
          child: Image.asset(imagePaths[currentIndex]),
        ),
      ),
    );
  }

  void previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + imagePaths.length) % imagePaths.length;
    });
  }

  void nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imagePaths.length;
    });
  }
}
