class UtilTimeCalc {
  String fromAtNow(DateTime date) {
    final Duration difference = date.difference(DateTime.now());
    final int sec = difference.inSeconds;

    if (sec >= 60 * 60 * 24) {
      return '${difference.inDays.toString()}日後';
    } else if (sec >= 60 * 60) {
      return '${difference.inHours.toString()}時間後';
    } else if (sec >= 60) {
      return '${difference.inMinutes.toString()}分後';
    } else if (sec >= 0) {
      return '$sec秒後';
    } else {
      return "期日切れ";
    }
  }
}
