import 'package:flutter/material.dart';

class Exercise2Screen extends StatelessWidget {
  const Exercise2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Khai báo biến ở đây
    var title = "Núi Phú Sĩ";
    var subTitle = "Ngọn núi cao nhất Nhật Bản";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          // Hàng 1: ảnh
          Expanded(
            child: Container(
              color: Colors.redAccent,
              child: Center(
                child: Image.network(
                  "https://plus.unsplash.com/premium_photo-1661963745503-8b3a86b8c2b1?q=80&w=1631&auto=format&fit=crop&ixlib=rb-4.1.0",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),

          // Hàng 2: tiêu đề + phụ đề
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          subTitle,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                    // Bên phải: ngôi sao + số 41
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.red, size: 24),
                        SizedBox(width: 6),
                        Text(
                          "41",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Hàng 3
          Expanded(
            child: Container(
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone, color: Colors.blue, size: 24),
                        SizedBox(width: 6),
                        Text(
                          "CALL",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.straight, color: Colors.blue, size: 24),
                        SizedBox(width: 6),
                        Text(
                          "ROUTE",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.share, color: Colors.blue, size: 24),
                        SizedBox(width: 6),
                        Text(
                          "SHARE",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Hàng 4: mô tả
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const SingleChildScrollView(
                // tránh tràn chữ
                child: Text(
                  'Núi Phú Sĩ (富士山, Fuji-san) là ngọn núi cao nhất Nhật Bản (3.776 m), '
                  'nằm giữa tỉnh Yamanashi và Shizuoka, cách Tokyo khoảng 100 km. '
                  'Đây là núi lửa đã ngừng phun trào từ năm 1707, có hình chóp nón cân đối, '
                  'phủ tuyết trắng trên đỉnh vào mùa đông. Núi Phú Sĩ không chỉ là biểu tượng '
                  'thiêng liêng trong văn hóa, nghệ thuật Nhật Bản mà còn là điểm du lịch nổi tiếng, '
                  'thu hút hàng triệu du khách và người leo núi mỗi năm.',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}