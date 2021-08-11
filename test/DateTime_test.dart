import 'package:flutter_test/flutter_test.dart';

void main() {
  test('DateTime', () {
    DateTime date = DateTime.parse('0320-02-03 08:00:00.000');
    expect(date.year, 320);
  });

  test('DateTime2', () {
    DateTime date = DateTime(1820, 2, 3, 8, 0, 0, 0, 0);
    expect(date.year, 1820);
  });

  test('星期一', () {
    DateTime date = DateTime(2021, 8, 2, 0, 0, 0, 0, 0);
    expect(date.weekday, 1);
  });

  test('星期二', () {
    DateTime date = DateTime(2021, 8, 3, 0, 0, 0, 0, 0);
    expect(date.weekday, 2);
  });

  test('星期三', () {
    DateTime date = DateTime(2021, 8, 4, 0, 0, 0, 0, 0);
    expect(date.weekday, 3);
  });

  test('星期四', () {
    DateTime date = DateTime(2021, 8, 5, 0, 0, 0, 0, 0);
    expect(date.weekday, 4);
  });

  test('星期五', () {
    DateTime date = DateTime(2021, 8, 6, 0, 0, 0, 0, 0);
    expect(date.weekday, 5);
  });

  test('星期六', () {
    DateTime date = DateTime(2021, 8, 7, 0, 0, 0, 0, 0);
    expect(date.weekday, 6);
  });

  test('星期日', () {
    DateTime date = DateTime(2021, 8, 8, 0, 0, 0, 0, 0);
    expect(date.weekday, 7);
  });
}
