//import 'package:flutter/material.dart';
//import 'package:task_app/Util/util_dialog.dart';
//import 'package:task_app/Util/util_shareprefs.dart';
//
//class ModelTask extends ChangeNotifier {
//  String name;
//  ModelTask({this.name});
//
//  var db = FirebaseFirestore.instance;
//  bool isLoading = false;
//
//  startLoading() {
//    isLoading = true;
//    notifyListeners();
//  }
//
//  endLoading() {
//    isLoading = false;
//    notifyListeners();
//  }
//
//  void saveTask(BuildContext context, String documentID) {
//    if (documentID == null) {
//      // 新規追加
//      db.collection("Task").add({
//        "name": this.name,
//        "deadline": this.deadline,
//        "repeat": this.repeat,
//        "tag": this.tag,
//        "dairyDate": this.dairyDate,
//        "complete": this.complete,
//        "createdAt": DateTime.now(),
//        "updatedAt": DateTime.now(),
//        "deviceID": UtilSharePrefs.getDeviceId()
//      }).then((value) {
//        print("==== タスク保存　成功 ====");
//        if (this.repeat["durationDays"] != null) {
//          DateTime _deadline = this.deadline;
//          DateTime _deadlineAfterYear = this.deadline.add(Duration(days: 30));
//
//          while (_deadline.millisecondsSinceEpoch <
//              _deadlineAfterYear.millisecondsSinceEpoch) {
//            _deadline =
//                _deadline.add(Duration(days: this.repeat["durationDays"]));
//
//            if (_deadline.millisecondsSinceEpoch <
//                _deadlineAfterYear.millisecondsSinceEpoch) {
//              db.collection("Task").add({
//                "originalID": value.id,
//                "name": this.name,
//                "deadline": _deadline,
//                "repeat": this.repeat,
//                "tag": this.tag,
//                "dairyDate": this.dairyDate,
//                "complete": this.complete,
//                "createdAt": DateTime.now(),
//                "updatedAt": DateTime.now(),
//                "deviceID": UtilSharePrefs.getDeviceId()
//              }).then((value) {
//                print("==== リピートタスク保存　成功 ====");
//              });
//            }
//          }
//        }
//        Navigator.pop(context);
//      }).catchError((error) {
//        print("==== タスク保存　失敗 ====");
//        print("==== エラー=> $error ====");
//      });
//    } else {
//      db.collection("Task").doc(documentID).update({
//        "name": this.name,
//        "deadline": this.deadline,
//        "repeat": this.repeat,
//        "tag": this.tag,
//        "dairyDate": this.dairyDate,
//        "complete": this.complete,
//        "updatedAt": DateTime.now(),
//        "deviceID": UtilSharePrefs.getDeviceId()
//      }).then((value) {
//        print("==== タスク保存　成功 ====");
//        Navigator.pop(context);
//        if (this.complete) {
//          UtilDialog().okDialog(context, "完了", "「${this.name}」を完了しました。");
//        }
//      }).catchError((error) {
//        print("==== タスク保存　失敗 ====");
//        print("==== エラー=> $error ====");
//      });
//    }
//  }
//
//  Stream indexTasks() {
//    return db
//        .collection("Task")
//        .where("deviceID", isEqualTo: UtilSharePrefs.getDeviceId())
//        .where("complete", isEqualTo: false)
//        .orderBy("deadline")
//        .snapshots();
//  }
//
//  void deleteData(String documentId) {
//    db.collection("Task").doc(documentId).delete();
//  }
//}
