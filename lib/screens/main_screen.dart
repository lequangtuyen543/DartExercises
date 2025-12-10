import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../widgets/drawer_menu.dart';
import '/exercises/exercise_1_screen.dart';
import '/exercises/exercise_2_screen.dart';
import '/exercises/exercise_3_screen.dart';
import '/exercises/exercise_4_screen.dart';
import '/exercises/exercise_5_screen.dart';
import '/exercises/exercise_6_screen.dart';
import '/exercises/exercise_7_screen.dart';
import '/exercises/exercise_8_screen.dart';
import '/exercises/exercise_9_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Danh sách các bài tập - Thêm bài tập mới vào đây
  final List<Exercise> _exercises = [
    Exercise(id: 1, title: 'Bài tập 1', icon: Icons.looks_one),
    Exercise(id: 2, title: 'Bài tập 2', icon: Icons.looks_two),
    Exercise(id: 3, title: 'Bài tập 3', icon: Icons.looks_3),
    Exercise(id: 4, title: 'Bài tập 4', icon: Icons.looks_4),
    Exercise(id: 5, title: 'Bài tập 5', icon: Icons.looks_5),
    Exercise(id: 6, title: 'Bài tập 6', icon: Icons.looks_6),
    Exercise(id: 7, title: 'Bài tập 7', icon: Icons.filter_7),
    Exercise(id: 8, title: 'Bài tập 8', icon: Icons.filter_8),
    Exercise(id: 9, title: 'Bài tập 9', icon: Icons.filter_9),
  ];

  // Hàm trả về widget tương ứng với bài tập được chọn
  Widget _getExerciseScreen(int index) {
    switch (index) {
      case 0:
        return const Exercise1Screen();
      case 1:
        return const Exercise2Screen();
      case 2:
        return const Exercise3Screen();
      case 3:
        return const Exercise4Screen();
      case 4:
        return const Exercise5Screen();
      case 5:
        return const Exercise6Screen();
      case 6:
        return const Exercise7Screen();
      case 7:
        return const Exercise8Screen();
      case 8:
        return const Exercise9Screen();
      default:
        return const Center(child: Text('Chọn một bài tập từ menu'));
    }
  }

  void _onExerciseSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_exercises[_selectedIndex].title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: DrawerMenu(
        exercises: _exercises,
        selectedIndex: _selectedIndex,
        onExerciseSelected: _onExerciseSelected,
      ),
      body: _getExerciseScreen(_selectedIndex),
    );
  }
}
