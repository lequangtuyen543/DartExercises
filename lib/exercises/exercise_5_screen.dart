import 'package:flutter/material.dart';

class Exercise5Screen extends StatelessWidget {
  const Exercise5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.looks_5,
            size: 100,
            color: Colors.red,
          ),
          const SizedBox(height: 20),
          const Text(
            'Bài tập 5',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Thêm code bài tập 5 của bạn vào đây',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}