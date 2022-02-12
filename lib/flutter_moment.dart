library moment;

import 'package:intl/intl.dart';

class Moment {
  DateTime _clone(DateTime from) {
    return DateTime.fromMillisecondsSinceEpoch(from.millisecondsSinceEpoch);
  }

  bool isSameDay(DateTime dt1, DateTime dt2) {
    return dt1.year == dt2.year && dt1.month == dt2.month && dt1.day == dt2.day;
  }

  String format(
    DateTime? dt, {
    String format = 'yyyy-MM-dd hh:mm a',
    bool removeYearIfPossible = false,
  }) {
    if (dt == null) {
      return '';
    } else {
      if (removeYearIfPossible) {
        DateTime now = DateTime.now();
        if (now.year == dt.year) {
          format = format.replaceFirst(RegExp(r'\W*yyyy\W*'), '');
        }
      }
      DateFormat formatter = DateFormat(format);
      return formatter.format(dt);
    }
  }

  datePushedTo({
    DateTime? from,
    int day = 0,
    int hour = 0,
    int minute = 0,
    int second = 0,
    bool floor = false, // set time to 00:00:00 if true
    bool ceil = false, // set time to 23:59:59 if true
  }) {
    from = from ?? DateTime.now();

    var to = _clone(from);
    to = DateTime(
      to.year,
      to.month,
      to.day + day,
      floor
          ? 0
          : ceil
              ? 23
              : to.hour + hour,
      floor
          ? 0
          : ceil
              ? 59
              : to.minute + minute,
      floor
          ? 0
          : ceil
              ? 59
              : to.second + second,
    );

    return to;
  }
}
