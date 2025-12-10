import 'package:flutter/material.dart';

class Exercise1Screen extends StatelessWidget {
  const Exercise1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.looks_one,
            size: 100,
            color: Colors.blue,
          ),
          const SizedBox(height: 20),
          const Text(
            'Bài tập 1',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Thêm code bài tập 1 của bạn vào đây',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}