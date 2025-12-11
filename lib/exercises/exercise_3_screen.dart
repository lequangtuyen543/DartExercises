import 'package:flutter/material.dart';

class Exercise3Screen extends StatelessWidget {
  const Exercise3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Các môn học"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        children: [
          CourseCard(
            title: "XML và ứng dụng - Nhóm 1",
            code: "2025-2026.1.TIN4583.001",
            students: 58,
            imageUrl:
                "https://plus.unsplash.com/premium_photo-1661964177687-57387c2cbd14?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          CourseCard(
            title: "Lập trình ứng dụng cho các t... (Nhóm 006)",
            code: "2025-2026.1.TIN4403.006",
            students: 55,
            imageUrl: "https://picsum.photos/400/200",
          ),
          CourseCard(
            title: "Lập trình ứng dụng cho các t... (Nhóm 006)",
            code: "2025-2026.1.TIN4403.006",
            students: 55,
            imageUrl: "https://picsum.photos/400/200",
          ),
          CourseCard(
            title: "Lập trình ứng dụng cho các t... (Nhóm 006)",
            code: "2025-2026.1.TIN4403.006",
            students: 55,
            imageUrl: "https://picsum.photos/400/200",
          ),
          CourseCard(
            title: "Lập trình ứng dụng cho các t... (Nhóm 006)",
            code: "2025-2026.1.TIN4403.006",
            students: 55,
            imageUrl: "https://picsum.photos/400/200",
          ),
        ],
      ),
    );
  }
}

// Widget CourseCard - tách riêng trong cùng file
class CourseCard extends StatelessWidget {
  final String title;
  final String code;
  final int students;
  final String imageUrl;

  const CourseCard({
    super.key,
    required this.title,
    required this.code,
    required this.students,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          // lớp phủ màu tối để chữ nổi bật
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black.withOpacity(0.3),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _leftChild(),
              _rightChild(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _leftChild() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(
          code,
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
        ),
        const SizedBox(height: 6),
        Text(
          "$students học viên",
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
        ),
      ],
    );
  }

  Widget _rightChild() {
    return Icon(Icons.more_horiz, color: Colors.white.withOpacity(0.9));
  }
}