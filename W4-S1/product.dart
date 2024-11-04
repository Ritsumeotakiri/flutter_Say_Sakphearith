import 'package:flutter/material.dart';

// Part 2: Create an Enum for Products
enum Product {
  dart,
  flutter,
  firebase,
}

// Part 3: Create a Stateless Widget for the Product Card
class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    String title;
    String description;
    String imagePath;

    switch (product) {
      case Product.dart:
        title = 'Dart';
        description = 'the best object language';
        imagePath = 'assets/dart.png'; 
        break;
      case Product.flutter:
        title = 'Flutter';
        description = 'the best mobile widget library';
        imagePath = 'assets/flutter.png'; 
        break;
      case Product.firebase:
        title = 'Firebase';
        description = 'the best cloud database';
        imagePath = 'assets/firebase.png'; 
        break;
    }

    return Card(
      elevation: 4, // Shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), 
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Image.asset(imagePath, height: 100), 
            SizedBox(height: 10), 
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5), 
            Text(description),
          ],
        ),
      ),
    );
  }
}
