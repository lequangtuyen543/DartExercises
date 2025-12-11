import 'package:flutter/material.dart';

class Exercise1Screen extends StatelessWidget {
  const Exercise1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Home Page"),
        actions: const [
          // Icon ở góc phải AppBar
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.favorite, color: Colors.pink),
          ),
        ],
      ),
      body: const MyHomeBody(),
    );
  }
}

// Tách body ra thành 1 widget riêng
class MyHomeBody extends StatelessWidget {
  const MyHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hello, this is MyHomePage!",
            style: TextStyle(
              fontSize: 24,
              color: Colors.red,
            ),
          ),
          Icon(
            Icons.favorite,
            size: 150,
            color: Colors.yellow,
          ),
          Text(
            "Hello, this is MyHomePage!",
            style: TextStyle(
              fontSize: 24,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}