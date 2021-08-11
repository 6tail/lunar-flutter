import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('数九', () {
    Solar solar = Solar.fromYmd(2020, 12, 21);
    Lunar lunar = solar.getLunar();
    ShuJiu? shuJiu = lunar.getShuJiu();
    expect(shuJiu.toString(), '一九');
    expect(shuJiu!.toFullString(), '一九第1天');
  });

  test('数九2', () {
    Solar solar = Solar.fromYmd(2020, 12, 22);
    Lunar lunar = solar.getLunar();
    ShuJiu? shuJiu = lunar.getShuJiu();
    expect(shuJiu.toString(), '一九');
    expect(shuJiu!.toFullString(), '一九第2天');
  });

  test('数九3', () {
    Solar solar = Solar.fromYmd(2020, 1, 7);
    Lunar lunar = solar.getLunar();
    ShuJiu? shuJiu = lunar.getShuJiu();
    expect(shuJiu.toString(), '二九');
    expect(shuJiu!.toFullString(), '二九第8天');
  });

  test('数九4', () {
    Solar solar = Solar.fromYmd(2021, 1, 6);
    Lunar lunar = solar.getLunar();
    ShuJiu? shuJiu = lunar.getShuJiu();
    expect(shuJiu.toString(), '二九');
    expect(shuJiu!.toFullString(), '二九第8天');
  });

  test('数九5', () {
    Solar solar = Solar.fromYmd(2021, 1, 8);
    Lunar lunar = solar.getLunar();
    ShuJiu? shuJiu = lunar.getShuJiu();
    expect(shuJiu.toString(), '三九');
    expect(shuJiu!.toFullString(), '三九第1天');
  });

  test('数九6', () {
    Solar solar = Solar.fromYmd(2021, 3, 5);
    Lunar lunar = solar.getLunar();
    ShuJiu? shuJiu = lunar.getShuJiu();
    expect(shuJiu.toString(), '九九');
    expect(shuJiu!.toFullString(), '九九第3天');
  });

  test('数九7', () {
    Solar solar = Solar.fromYmd(2021, 7, 5);
    Lunar lunar = solar.getLunar();
    ShuJiu? shuJiu = lunar.getShuJiu();
    expect(shuJiu, null);
  });
}
