import 'package:flutter_test/flutter_test.dart';
import 'package:moment/flutter_moment.dart';

void main() {
  test('test if datePushedTo works', () {
    var dt1 = DateTime(2020, 10, 30, 15, 0, 0);

    var dt2 = Moment.datePushedTo(from: dt1, hour: -5);
    expect(Moment.isSameDay(dt1, dt2), true);

    dt2 = Moment.datePushedTo(from: dt1, day: 2);
    expect(Moment.isSameDay(dt1, Moment.datePushedTo(day: 2)), false);
  });

  test('test if formatter works', () {
    var date = DateTime(2022, 10, 11);
    expect(Moment.format(date), '2022-10-11 12:00 AM');
    expect(Moment.format(date, format: 'yyyy/MM/dd'), '2022/10/11');
    expect(Moment.format(date, format: 'MMMM dd, yyyy'), 'October 11, 2022');
    expect(
      Moment.format(
        date,
        format: 'MMMM dd, yyyy',
        removeYearIfPossible: true,
      ),
      'October 11',
    );

    expect(Moment.parse('2020-12-30 10:00 AM'), DateTime(2020, 12, 30, 10));
  });
}
