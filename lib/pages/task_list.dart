import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            bar("今日のタスク"),
            taskItem(),
            taskItem(),
            bar("明日以降のタスク"),
            taskItem(),
            taskItem(),
          ],
        ),
      ),
    );
  }

  Widget bar(String title) {
    return Container(
      constraints: BoxConstraints.expand(height: 50),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget taskItem() {
    return ListTile(
      title: Text("お茶を飲む"),
      subtitle: Text("01月01日(金) 00:00"),
      trailing: Text("1時間後"),
    );
  }
}
