import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('周', () {
    // 一周的开始从星期一开始计
    int start = 1;
    SolarWeek week = SolarWeek.fromYmd(2019, 5, 1, start);
    expect(week.toString(), '2019.5.1');
    expect(week.toFullString(), '2019年5月第1周');

    // 当月共几周
    expect(
        5, SolarUtil.getWeeksOfMonth(week.getYear(), week.getMonth(), start));

    // 当周第一天
    expect(week.getFirstDay().toString(), '2019-04-29');

    // 当周第一天（本月）
    expect(week.getFirstDayInMonth().toString(), '2019-05-01');
  });

  test('周2', () {
    // 一周的开始从星期日开始计
    int start = 0;
    SolarWeek week = SolarWeek.fromYmd(2019, 5, 1, start);
    expect(week.toString(), '2019.5.1');
    expect(week.toFullString(), '2019年5月第1周');

    // 当月共几周
    expect(
        5, SolarUtil.getWeeksOfMonth(week.getYear(), week.getMonth(), start));

    // 当周第一天
    expect(week.getFirstDay().toString(), '2019-04-28');

    // 当周第一天（本月）
    expect(week.getFirstDayInMonth().toString(), '2019-05-01');
  });

  test('星期三', () {
    Solar solar = Solar.fromYmd(2021, 8, 11);
    expect(solar.getWeek(), 3);
    expect(solar.getWeekInChinese(), '三');
  });

  test('星期日', () {
    Solar solar = Solar.fromYmd(2021, 8, 8);
    expect(solar.getWeek(), 0);
    expect(solar.getWeekInChinese(), '日');
  });

  test('星期六', () {
    Solar solar = Solar.fromYmd(2021, 8, 14);
    expect(solar.getWeek(), 6);
    expect(solar.getWeekInChinese(), '六');
  });

  test('test1', () {
    Solar solar = Solar.fromYmd(1582, 10, 1);
    expect(solar.getWeek(), 1);
  });

  test('test2', () {
    Solar solar = Solar.fromYmd(1582, 10, 15);
    expect(solar.getWeek(), 5);
  });

  test('test3', () {
    expect(Solar.fromYmd(1961, 9, 30).getWeek(), 6);
  });

  test('test4', () {
    expect(Solar.fromYmdHms(1961, 9, 30, 23, 59, 59).getWeek(), 6);
  });

  test('test5', () {
    expect(Solar.fromYmdHms(2021, 9, 15, 0, 0, 0).getWeek(), 3);
  });

  test('test6', () {
    expect(Solar.fromYmdHms(2021, 9, 15, 23, 59, 59).getWeek(), 3);
  });

  test('test7', () {
    expect(Solar.fromYmd(1129, 11, 17).getWeek(), 0);
  });

  test('test8', () {
    expect(Solar.fromYmd(1129, 11, 1).getWeek(), 5);
  });

  test('test9', () {
    expect(Solar.fromYmd(8, 11, 1).getWeek(), 4);
  });

  test('test10', () {
    expect(Solar.fromYmd(1582, 1, 1).getWeek(), 1);
  });

  test('test11', () {
    expect(Solar.fromYmd(1500, 2, 29).getWeek(), 6);
  });

  test('test12', () {
    expect(Solar.fromYmd(9865, 7, 26).getWeek(), 3);
  });

}
