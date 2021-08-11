import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('六曜', () {
    Solar solar = Solar.fromYmd(2020, 4, 23);
    Lunar lunar = solar.getLunar();
    expect(lunar.getLiuYao(), '佛灭');
  });

  test('六曜1', () {
    Solar solar = Solar.fromYmd(2021, 1, 15);
    Lunar lunar = solar.getLunar();
    expect(lunar.getLiuYao(), '友引');
  });

  test('六曜2', () {
    Solar solar = Solar.fromYmd(2017, 1, 5);
    Lunar lunar = solar.getLunar();
    expect(lunar.getLiuYao(), '先胜');
  });

  test('六曜3', () {
    Solar solar = Solar.fromYmd(2020, 4, 10);
    Lunar lunar = solar.getLunar();
    expect(lunar.getLiuYao(), '友引');
  });

  test('六曜4', () {
    Solar solar = Solar.fromYmd(2020, 6, 11);
    Lunar lunar = solar.getLunar();
    expect(lunar.getLiuYao(), '大安');
  });

  test('六曜5', () {
    Solar solar = Solar.fromYmd(2020, 6, 1);
    Lunar lunar = solar.getLunar();
    expect(lunar.getLiuYao(), '先胜');
  });

  test('六曜6', () {
    Solar solar = Solar.fromYmd(2020, 12, 8);
    Lunar lunar = solar.getLunar();
    expect(lunar.getLiuYao(), '先负');
  });

  test('六曜7', () {
    Solar solar = Solar.fromYmd(2020, 12, 11);
    Lunar lunar = solar.getLunar();
    expect(lunar.getLiuYao(), '赤口');
  });
}
