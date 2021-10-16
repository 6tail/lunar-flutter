import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('农历年', () {
    LunarYear year = LunarYear.fromYear(2021);
    expect(year.toString(), '2021');
  });

  test('test1', () {
    LunarYear year = LunarYear.fromYear(2017);
    expect(year.getZhiShui(), '二龙治水');
    expect(year.getFenBing(), '二人分饼');
  });

  test('test2', () {
    LunarYear year = LunarYear.fromYear(2018);
    expect(year.getZhiShui(), '二龙治水');
    expect(year.getFenBing(), '八人分饼');
    expect(year.getDeJin(), '三日得金');
  });

  test('test3', () {
    LunarYear year = LunarYear.fromYear(2021);
    expect(year.getGengTian(), '十一牛耕田');
  });
}
