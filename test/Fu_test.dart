import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('伏', () {
    Solar solar = Solar.fromYmd(2011, 7, 14);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu.toString(), '初伏');
    expect(fu!.toFullString(), '初伏第1天');
  });

  test('伏2', () {
    Solar solar = Solar.fromYmd(2011, 7, 23);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu.toString(), '初伏');
    expect(fu!.toFullString(), '初伏第10天');
  });

  test('伏3', () {
    Solar solar = Solar.fromYmd(2011, 7, 24);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu.toString(), '中伏');
    expect(fu!.toFullString(), '中伏第1天');
  });

  test('伏4', () {
    Solar solar = Solar.fromYmd(2011, 8, 12);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu.toString(), '中伏');
    expect(fu!.toFullString(), '中伏第20天');
  });

  test('伏5', () {
    Solar solar = Solar.fromYmd(2011, 8, 13);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu.toString(), '末伏');
    expect(fu!.toFullString(), '末伏第1天');
  });

  test('伏6', () {
    Solar solar = Solar.fromYmd(2011, 8, 22);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu.toString(), '末伏');
    expect(fu!.toFullString(), '末伏第10天');
  });

  test('伏7', () {
    Solar solar = Solar.fromYmd(2011, 7, 13);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu, null);
  });

  test('伏8', () {
    Solar solar = Solar.fromYmd(2011, 8, 23);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu, null);
  });

  test('伏9', () {
    Solar solar = Solar.fromYmd(2012, 7, 18);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu.toString(), '初伏');
    expect(fu!.toFullString(), '初伏第1天');
  });

  test('伏10', () {
    Solar solar = Solar.fromYmd(2012, 8, 5);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu.toString(), '中伏');
    expect(fu!.toFullString(), '中伏第9天');
  });

  test('伏11', () {
    Solar solar = Solar.fromYmd(2012, 8, 8);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu.toString(), '末伏');
    expect(fu!.toFullString(), '末伏第2天');
  });

  test('伏12', () {
    Solar solar = Solar.fromYmd(2020, 7, 17);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu.toString(), '初伏');
    expect(fu!.toFullString(), '初伏第2天');
  });

  test('伏13', () {
    Solar solar = Solar.fromYmd(2020, 7, 26);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu.toString(), '中伏');
    expect(fu!.toFullString(), '中伏第1天');
  });

  test('伏14', () {
    Solar solar = Solar.fromYmd(2020, 8, 24);
    Lunar lunar = solar.getLunar();
    Fu? fu = lunar.getFu();
    expect(fu.toString(), '末伏');
    expect(fu!.toFullString(), '末伏第10天');
  });
}
