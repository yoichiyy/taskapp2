import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:taskapp2/Util/util_dialog.dart';
import 'package:taskapp2/Util/util_time_calc.dart';

class PageTaskEdit extends StatefulWidget {
  @override
  _PageTaskEditState createState() => _PageTaskEditState();
}

class _PageTaskEditState extends State<PageTaskEdit> {
  Color bgColor = Color.fromRGBO(3, 7, 47, 1);
  DateTime taskDeadline;

//  @override
//  void initState() {
//    // タスク編集時 各項目を反映
//    super.initState();
//  } // initStateここまで

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomPadding:
              false, //キーボードを要素の上に表示。trueなら要素を上に押し出してくれる。
          body: Stack(
            children: [
              Container(
                color: Colors.lightGreen,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30), //四角の右と左に広がらぬよう
                  child: Column(
                    mainAxisSize: MainAxisSize.min, //カラム内で中央に配置
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _iconButton(
                            Icons.highlight_off,
                            () => Navigator.pop(context),
//                                  UtilMovePage().normalPush(context,
//                                  MyHomePage()) //それともページのレイヤーみたいのを剥がす操作だろうか。そもそもそういうペジ操作についての知識がほしい。
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
  // 日時を指定したフォーマットで指定するためのフォーマッター
  var dateTimeFormatter = DateFormat('MM月dd日(E) HH:mm', "ja_JP");
  var timeFormatter = DateFormat('HH:mm', "ja_JP");

  Widget _showDeadline() {
    return GestureDetector(
      onTap: () {
        // 期日を設けることのできるタグの時のみ、showDateTimePickerを呼び出す
        DatePicker.showDateTimePicker(context, showTitleActions: true,
            // onChanged内の処理はDatepickerの選択に応じて毎回呼び出される
            onChanged: (date) {
          // print('change $date');
        },
            // onConfirm内の処理はDatepickerで選択完了後に呼び出される
            onConfirm: (date) {
          if (DateTime.now().millisecondsSinceEpoch <
              date.millisecondsSinceEpoch) {
            // 現在より後の日時は設定可能
            setState(() {
              _mydatetime = date;
              taskDeadline = _mydatetime;
            });
          }
        },
            // Datepickerのデフォルトで表示する日時
            currentTime: _mydatetime,
            // localによって色々な言語に対応
            //  locale: LocaleType.en
            locale: LocaleType.jp);
      },
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
                      dateTimeFormatter.format(_mydatetime),
                      style: TextStyle(
                        color: Color.fromRGBO(150, 150, 150, 1),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      (DateTime.now().millisecondsSinceEpoch <
                              _mydatetime.millisecondsSinceEpoch)
                          ? UtilTimeCalc().fromAtNow(_mydatetime)
                          : "",
                    ),
                  ],
                ),
                Text(
                  "繰り返し処理のことだろう",
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
                  setState(() {
                    taskDeadline = null;
                  });
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
        onPressed: () {
          print("==== table cell tap!! ====");
          if (DateTime.now().millisecondsSinceEpoch <
              _mydatetime.add(duration).millisecondsSinceEpoch) {
            setState(() {
              _mydatetime = _mydatetime.add(duration);
              taskDeadline = _mydatetime;
            });
          } else {
            UtilDialog()
                .okDialog(context, "過去の日時になります", "現在より後の日時となるようにしてください。");
          }
        },
      ),
    );
  }

  Widget _tagSelect() {
    return Container(
      constraints: BoxConstraints.expand(height: 40),
      child: RaisedButton(
        color: Color.fromRGBO(190, 200, 210, 1),
        child: Text("もとはタグ選択"),
      ),
    );
  }
}
