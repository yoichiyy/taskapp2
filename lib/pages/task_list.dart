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
          ],
        ),
      ),
    );
  }

  Widget taskItem() {
    return Column(
      children: [
        ListTile(
          title: Text("お茶を飲む"),
          subtitle: Text("1月19日(火)"),
          trailing: Text("1時間後"),
        ),
        Divider(
          color: Colors.grey,
          height: 1,
        ),
      ],
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
