import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
              child: Text(
            "今日のタスク",
            style: TextStyle(color: Colors.white),
          )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
          constraints: BoxConstraints.expand(height: 50),
        ),
      ),
    );
  }
}
