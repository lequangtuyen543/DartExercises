import 'package:flutter/material.dart';
import '../models/exercise.dart';

class DrawerMenu extends StatelessWidget {
  final List<Exercise> exercises;
  final int selectedIndex;
  final Function(int) onExerciseSelected;

  const DrawerMenu({
    super.key,
    required this.exercises,
    required this.selectedIndex,
    required this.onExerciseSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school,
                  size: 60,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  'Lập trình Mobile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Tạo menu item cho từng bài tập
          ...exercises.asMap().entries.map((entry) {
            int index = entry.key;
            Exercise exercise = entry.value;
            return ListTile(
              leading: Icon(exercise.icon),
              title: Text(exercise.title),
              selected: selectedIndex == index,
              selectedTileColor: Colors.blue.withOpacity(0.1),
              onTap: () {
                onExerciseSelected(index);
                Navigator.pop(context); // Đóng drawer
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}