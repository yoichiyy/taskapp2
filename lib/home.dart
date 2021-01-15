import 'package:flutter/material.dart';
import 'package:taskapp2/pages/diary.dart';
import 'package:taskapp2/pages/goal.dart';
import 'package:taskapp2/pages/task_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  List pages = [TaskList(), Goal(), Diary()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.grey[850], //プロパティ
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "タスク"),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "長目"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "日誌"),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//home.dartにテスト記入
//もう一行記入。ターミナルからは、pushできているようだ。
//勝利の瞬間まであと１分
