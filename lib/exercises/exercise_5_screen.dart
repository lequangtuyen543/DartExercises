import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class Exercise5Screen extends StatefulWidget {
  const Exercise5Screen({super.key});

  @override
  State<Exercise5Screen> createState() => _Exercise5ScreenState();
}

class _Exercise5ScreenState extends State<Exercise5Screen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          ColorChangerTab(),
          CounterTab(),
          TimerTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (i) {
          setState(() => _selectedTab = i);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.color_lens), label: "Đổi màu"),
          BottomNavigationBarItem(
              icon: Icon(Icons.exposure), label: "Đếm số"),
          BottomNavigationBarItem(
              icon: Icon(Icons.timer), label: "Hẹn giờ"),
        ],
      ),
    );
  }
}

//
// ----------------------------------------------------------
//  TAB 1: ĐỔI MÀU NỀN (CARD + UI GỌN ĐẸP)
// ----------------------------------------------------------
class ColorChangerTab extends StatefulWidget {
  const ColorChangerTab({super.key});

  @override
  State<ColorChangerTab> createState() => _ColorChangerTabState();
}

class _ColorChangerTabState extends State<ColorChangerTab> {
  Color _backgroundColor = Colors.purple;
  final Random _random = Random();

  void _changeColor() {
    setState(() {
      _backgroundColor = Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  void _resetColor() {
    setState(() {
      _backgroundColor = Colors.purple;
    });
  }

  String get colorName {
    if (_backgroundColor == Colors.purple) return 'Tím';
    return '#${_backgroundColor.value.toRadixString(16).substring(2).toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Center(
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Màu hiện tại",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                Text(
                  colorName,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _changeColor,
                      icon: const Icon(Icons.color_lens),
                      label: const Text("Đổi màu"),
                    ),
                    const SizedBox(width: 15),
                    ElevatedButton.icon(
                      onPressed: _resetColor,
                      icon: const Icon(Icons.refresh),
                      label: const Text("Đặt lại"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// ----------------------------------------------------------
//  TAB 2: ĐẾM SỐ (CARD + MÀU THEO GIÁ TRỊ)
// ----------------------------------------------------------
class CounterTab extends StatefulWidget {
  const CounterTab({super.key});

  @override
  State<CounterTab> createState() => _CounterTabState();
}

class _CounterTabState extends State<CounterTab> {
  int _counter = 0;

  Color _getColor() {
    if (_counter > 0) return Colors.green;
    if (_counter < 0) return Colors.red;
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Giá trị hiện tại:", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              Text(
                '$_counter',
                style: TextStyle(
                    fontSize: 60, fontWeight: FontWeight.bold, color: _getColor()),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() => _counter--),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text("− Giảm"),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () => setState(() => _counter = 0),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    child: const Text("⟳ Đặt lại"),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () => setState(() => _counter++),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text("+ Tăng"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
// ----------------------------------------------------------
//  TAB 3: BỘ ĐẾM THỜI GIAN (COUNTDOWN + CARD)
// ----------------------------------------------------------
class TimerTab extends StatefulWidget {
  const TimerTab({super.key});

  @override
  State<TimerTab> createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  TextEditingController secondsController = TextEditingController();
  Timer? timer;
  int remainingSeconds = 0;
  bool isCounting = false;

  void start() {
    if (secondsController.text.isEmpty) return;

    setState(() {
      remainingSeconds = int.tryParse(secondsController.text) ?? 0;
      isCounting = true;
    });

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingSeconds > 0) {
        setState(() => remainingSeconds--);
      } else {
        t.cancel();
        setState(() => isCounting = false);
      }
    });
  }

  void reset() {
    timer?.cancel();
    setState(() {
      remainingSeconds = 0;
      isCounting = false;
      secondsController.clear();
    });
  }

  String format(int sec) {
    int m = sec ~/ 60;
    int s = sec % 60;
    return "${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Nhập số giây cần đếm:", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              SizedBox(
                width: 150,
                child: TextField(
                  controller: secondsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "VD: 30",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                format(remainingSeconds),
                style: const TextStyle(
                    fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: isCounting ? null : start,
                      child: const Text("Bắt đầu")),
                  const SizedBox(width: 15),
                  ElevatedButton(
                      onPressed: reset,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text("Đặt lại")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
