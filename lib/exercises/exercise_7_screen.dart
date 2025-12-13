import 'package:flutter/material.dart';
import '../exercise7/product_screen.dart';

class Exercise7Screen extends StatelessWidget {
  const Exercise7Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 7 – Fake Store API'),
      ),
      body: const MyProduct(),
    );
  }
}
