import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModelTask extends ChangeNotifier {
  var db = FirebaseFirestore.instance; //データ保存場所と接続しました

  void saveTask({String name}) {
    //void→関数実行後にdata残さない ⇔  stringとか
    db.collection("task").add({
      "name": name,
    }).then((value) {
      print("タスク保存成功！");
    }).catchError((error) {
      print("タスク保存失敗");
    });
  }
}
