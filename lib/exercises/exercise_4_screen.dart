import 'package:flutter/material.dart';

class Exercise4Screen extends StatelessWidget {
  const Exercise4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.looks_4,
            size: 100,
            color: Colors.purple,
          ),
          const SizedBox(height: 20),
          const Text(
            'Bài tập 4',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Thêm code bài tập 4 của bạn vào đây',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}