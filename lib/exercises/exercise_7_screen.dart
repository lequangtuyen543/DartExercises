import 'package:flutter/material.dart';

class Exercise7Screen extends StatelessWidget {
  const Exercise7Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.filter_7,
            size: 100,
            color: Colors.pink,
          ),
          const SizedBox(height: 20),
          const Text(
            'Bài tập 7',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Thêm code bài tập 7 của bạn vào đây',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}