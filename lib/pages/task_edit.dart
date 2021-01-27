import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskapp2/Util/util_move_page.dart';

import '../home.dart';

class PageTaskEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Stack(
            children: [
              Container(
                color: Colors.lightGreen,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _iconButton(
                              Icons.highlight_off,
                              () => UtilMovePage().normalPush(context,
                                  MyHomePage()) //それともページのレイヤーみたいのを剥がす操作だろうか。そもそもそういうペジ操作についての知識がほしい。
                              ),
                          Icon(Icons.loop),
                          Icon(Icons.play_circle_outline),
                        ],
                      ),
                      _inputTaskName(),
                      Divider(
                        color: Colors.black,
                        height: 1,
                      ),
                      _showDeadline(),
                      Divider(
                        color: Colors.black,
                        height: 1,
                      ),
                      _table(),
                      Divider(
                        color: Colors.black,
                        height: 1,
                      ),
                      _tagSelect(),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment(0, 0.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete),
                      Icon(Icons.check_circle_outline),
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }

  Widget _iconButton(IconData icon, VoidCallback function) {
    return IconButton(
      iconSize: 50,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: function,
    );
  }

  Widget _inputTaskName() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'タスク名を入力...',
        ),
      ),
    );
  }

  // 選択した日時を格納する変数
  var _mydatetime = new DateTime.now();

  Widget _showDeadline() {
    return GestureDetector(
      child: Container(
        color: Color.fromRGBO(190, 200, 210, 1),
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "なんのテキストかな？",
                      style: TextStyle(
                        color: Color.fromRGBO(150, 150, 150, 1),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("３月３１日14時３０分"),
                  ],
                ),
                Text(
                  "森川勉強中",
                  style: TextStyle(
                      color: Color.fromRGBO(150, 150, 150, 1), fontSize: 12),
                ),
              ],
            ),
            Container(
              width: 50,
              child: FlatButton(
                padding: EdgeInsets.zero,
                child: Icon(
                  Icons.clear,
                ),
                onPressed: () {
                  print("==== clear!! ====");
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _table() {
    return Table(
      border: TableBorder(
          horizontalInside: BorderSide(), verticalInside: BorderSide()),
      children: [
//        TableRow(
//            children: [
//              _tableCell("9:20"),
//              _tableCell("12:00"),
//              _tableCell("18:00"),
//              _tableCell("21:30"),
//            ]
//        ),
        TableRow(children: [
          _tableCell("+10分", Duration(minutes: 10)),
          _tableCell("+1時間", Duration(hours: 1)),
          _tableCell("+3時間", Duration(hours: 3)),
          _tableCell("+1日", Duration(days: 1)),
        ]),
        TableRow(children: [
          _tableCell("-10分", Duration(minutes: -10)),
          _tableCell("-1時間", Duration(hours: -1)),
          _tableCell("-3時間", Duration(hours: -3)),
          _tableCell("-1日", Duration(days: -1)),
        ]),
      ],
    );
  }

  Widget _tableCell(String text, Duration duration) {
    return Container(
      height: 40,
      child: RaisedButton(
        padding: EdgeInsets.zero,
        child: Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
        color: Colors.white,
      ),
    );
  }

  Widget _tagSelect() {
    return Container(
      constraints: BoxConstraints.expand(height: 40),
      child: RaisedButton(
        color: Color.fromRGBO(190, 200, 210, 1),
        child: Text("what is it"),
      ),
    );
  }
}
