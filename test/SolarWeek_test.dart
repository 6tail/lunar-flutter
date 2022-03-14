import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('test1', () {
    SolarWeek week = SolarWeek.fromYmd(2021, 5, 1, 0);
    expect(week.getIndex(), 1);
  });

  test('test2', () {
    SolarWeek week = SolarWeek.fromYmd(2021, 5, 4, 2);
    expect(week.getIndex(), 2);
  });

  test('test3', () {
    SolarWeek week = SolarWeek.fromYmd(2022, 5, 1, 0);
    expect(week.getIndex(), 1);
  });

  test('test4', () {
    SolarWeek week = SolarWeek.fromYmd(2022, 5, 1, 1);
    expect(week.getIndex(), 1);
  });

  test('test5', () {
    SolarWeek week = SolarWeek.fromYmd(2022, 3, 6, 0);
    expect(week.getIndexInYear(), 11);
  });
}
