import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_datetime_handler/flutter_datetime_handler.dart';

void main() {
  test('test if datePushedTo works', () {
    final handler = DateTimeHandler();
    var dt1 = DateTime(2020, 10, 30, 15, 0, 0);

    var dt2 = handler.datePushedTo(from: dt1, hour: -5);
    expect(handler.isSameDay(dt1, dt2), true);

    dt2 = handler.datePushedTo(from: dt1, day: 2);
    expect(handler.isSameDay(dt1, handler.datePushedTo(day: 2)), false);
  });
}
