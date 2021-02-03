import 'package:flutter/material.dart';
import 'package:taskapp2/pages/goal.dart';
import 'package:taskapp2/pages/task_list.dart';
import 'package:taskapp2/Util/util_move_page.dart';
import 'package:taskapp2/pages/task_edit.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  List pages = [TaskList(), Goal()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          UtilMovePage().normalPush(context, PageTaskEdit());
        },
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
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "task"),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "A"),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//home.dartにテスト記入
//もう一行記入。ターミナルからは、pushできているようだ。
//勝利の瞬間まであと１分
