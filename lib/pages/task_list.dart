import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            bar("今日のタスク"),
            bar("明日以降のタスク"),
          ],
        ),
      ),
    );
  }

  Widget bar(String title) {
    return Container(
      child: Center(
          child: Text(
        title, //共通化して、関数を利用した
        style: TextStyle(color: Colors.white),
      )),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
      ),
      constraints: BoxConstraints.expand(height: 50),
    );
  }
}
