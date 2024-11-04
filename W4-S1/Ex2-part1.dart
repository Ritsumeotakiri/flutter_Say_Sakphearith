import 'package:flutter/material.dart';
import 'product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Cards',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductCard(product: Product.dart),
              SizedBox(height: 10), // Space between cards
              ProductCard(product: Product.flutter),
              SizedBox(height: 10), // Space between cards
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    );
  }
}
