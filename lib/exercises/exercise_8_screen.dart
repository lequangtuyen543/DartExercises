import 'package:flutter/material.dart';

class Exercise8Screen extends StatelessWidget {
  const Exercise8Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.filter_8,
            size: 100,
            color: Colors.indigo,
          ),
          const SizedBox(height: 20),
          const Text(
            'Bài tập 8',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Thêm code bài tập 8 của bạn vào đây',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}