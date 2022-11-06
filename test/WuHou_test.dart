import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('物候', () {
    Solar solar = Solar.fromYmd(2020, 4, 23);
    Lunar lunar = solar.getLunar();
    expect(lunar.getWuHou(), '萍始生');
  });

  test('物候2', () {
    Solar solar = Solar.fromYmd(2021, 1, 15);
    Lunar lunar = solar.getLunar();
    expect(lunar.getWuHou(), '雉始雊');
  });

  test('物候3', () {
    Solar solar = Solar.fromYmd(2017, 1, 5);
    Lunar lunar = solar.getLunar();
    expect(lunar.getWuHou(), '雁北乡');
  });

  test('物候4', () {
    Solar solar = Solar.fromYmd(2020, 4, 10);
    Lunar lunar = solar.getLunar();
    expect(lunar.getWuHou(), '田鼠化为鴽');
  });

  test('物候5', () {
    Solar solar = Solar.fromYmd(2020, 6, 11);
    Lunar lunar = solar.getLunar();
    expect(lunar.getWuHou(), '鵙始鸣');
  });

  test('物候6', () {
    Solar solar = Solar.fromYmd(2020, 6, 1);
    Lunar lunar = solar.getLunar();
    expect(lunar.getWuHou(), '麦秋至');
  });

  test('物候7', () {
    Solar solar = Solar.fromYmd(2020, 12, 8);
    Lunar lunar = solar.getLunar();
    expect(lunar.getWuHou(), '鹖鴠不鸣');
  });

  test('物候8', () {
    Solar solar = Solar.fromYmd(2020, 12, 11);
    Lunar lunar = solar.getLunar();
    expect(lunar.getWuHou(), '鹖鴠不鸣');
  });

  test('物候9', () {
    Solar solar = Solar.fromYmd(1982, 12, 22);
    Lunar lunar = solar.getLunar();
    expect(lunar.getWuHou(), '蚯蚓结');
  });

  test('候1', () {
    Solar solar = Solar.fromYmd(2021, 12, 21);
    Lunar lunar = solar.getLunar();
    expect(lunar.getHou(), '冬至 初候');
  });

  test('候2', () {
    Solar solar = Solar.fromYmd(2021, 12, 26);
    Lunar lunar = solar.getLunar();
    expect(lunar.getHou(), '冬至 二候');
  });

  test('候3', () {
    Solar solar = Solar.fromYmd(2021, 12, 31);
    Lunar lunar = solar.getLunar();
    expect(lunar.getHou(), '冬至 三候');
  });

  test('候4', () {
    Solar solar = Solar.fromYmd(2022, 1, 5);
    Lunar lunar = solar.getLunar();
    expect(lunar.getHou(), '小寒 初候');
  });

  test('物候15', () {
    Solar solar = Solar.fromYmd(2022, 8, 22);
    Lunar lunar = solar.getLunar();
    expect(lunar.getWuHou(), '寒蝉鸣');
  });

  test('物候16', () {
    Solar solar = Solar.fromYmd(2022, 8, 23);
    Lunar lunar = solar.getLunar();
    expect(lunar.getWuHou(), '鹰乃祭鸟');
  });
}
