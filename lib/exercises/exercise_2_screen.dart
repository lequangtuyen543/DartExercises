import 'package:flutter/material.dart';

class Exercise2Screen extends StatelessWidget {
  const Exercise2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.looks_two,
            size: 100,
            color: Colors.green,
          ),
          const SizedBox(height: 20),
          const Text(
            'Bài tập 2',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Thêm code bài tập 2 của bạn vào đây',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}