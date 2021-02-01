import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            bar("task！！"),
            taskItem(),
            taskItem(),
            taskItem(),
            taskItem(),
            taskItem(),
            taskItem(),
            taskItem(),
            taskItem(),
            taskItem(),
            taskItem(),
            taskItem(),
            taskItem(),
            taskItem(),
            taskItem(),
            bar("tomorrow"),
          ],
        ),
      ),
    );
  }

  Widget taskItem() {
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints.expand(width: 10),
                color: Colors.blue,
              ),
              Expanded(
                child: ListTile(
                  //デフォルトで横幅いっぱいという設定。
                  title: Text("drink tea"),
                  subtitle: Text("1/19(Tue)"),
                  trailing: Text("1hour later"),
                ),
              ),
            ],
          ),
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
