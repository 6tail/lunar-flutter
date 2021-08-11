import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('旬', () {
    Solar solar = Solar.fromYmdHms(2020, 11, 19, 0, 0, 0);
    Lunar lunar = solar.getLunar();
    expect(lunar.getYearXun(), '甲午');
  });

  test('旬空', () {
    Solar solar = Solar.fromYmdHms(2020, 11, 19, 0, 0, 0);
    Lunar lunar = solar.getLunar();
    expect(lunar.getYearXunKong(), '辰巳');
    expect(lunar.getMonthXunKong(), '午未');
    expect(lunar.getDayXunKong(), '戌亥');
  });

  test('旬空2', () {
    Solar solar = Solar.fromYmdHms(1990, 12, 23, 8, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getDayXunKong(), '子丑');
  });
}
