import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(height: 50),
          child: Center(
            child: Text(
              "今日のタスク",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
