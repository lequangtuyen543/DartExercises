import 'package:flutter/material.dart';

class Exercise6Screen extends StatelessWidget {
  const Exercise6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.looks_6,
            size: 100,
            color: Colors.teal,
          ),
          const SizedBox(height: 20),
          const Text(
            'Bài tập 6',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Thêm code bài tập 6 của bạn vào đây',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}