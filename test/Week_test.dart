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
}
