import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum Product { dart, flutter, firebase }

extension ProductInfo on Product {
  String get title {
    switch (this) {
      case Product.dart:
        return 'Dart';
      case Product.flutter:
        return 'Flutter';
      case Product.firebase:
        return 'Firebase';
    }
  }

  String get description {
    switch (this) {
      case Product.dart:
        return 'The best object language';
      case Product.flutter:
        return 'The best mobile widget library';
      case Product.firebase:
        return 'The best cloud database';
    }
  }

  String get imagePath {
    switch (this) {
      case Product.dart:
        return 'assets/dart.png';
      case Product.flutter:
        return 'assets/flutter.png';
      case Product.firebase:
        return 'assets/firebase.png';
    }
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.imagePath, height: 80, fit: BoxFit.contain),
            const SizedBox(height: 10),
            Text(
              product.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              product.description,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    );
  }
}
