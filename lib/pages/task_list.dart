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
}
