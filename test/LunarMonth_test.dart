import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('农历月', () {
    LunarMonth month = LunarMonth.fromYm(2023, 1)!;
    expect(month.getIndex(), 1);
    expect(month.getGanZhi(), '甲寅');
  });

  test('农历月1', () {
    LunarMonth month = LunarMonth.fromYm(2023, -2)!;
    expect(month.getIndex(), 3);
    expect(month.getGanZhi(), '乙卯');
  });

  test('农历月2', () {
    LunarMonth month = LunarMonth.fromYm(2023, 3)!;
    expect(month.getIndex(), 4);
    expect(month.getGanZhi(), '丙辰');
  });

  test('农历月3', () {
    LunarMonth month = LunarMonth.fromYm(2024, 1)!;
    expect(month.getIndex(), 1);
    expect(month.getGanZhi(), '丙寅');
  });

  test('农历月4', () {
    LunarMonth month = LunarMonth.fromYm(2023, 12)!;
    expect(month.getIndex(), 13);
    expect(month.getGanZhi(), '乙丑');
  });

  test('农历月5', () {
    LunarMonth month = LunarMonth.fromYm(2022, 1)!;
    expect(month.getIndex(), 1);
    expect(month.getGanZhi(), '壬寅');
  });

}
