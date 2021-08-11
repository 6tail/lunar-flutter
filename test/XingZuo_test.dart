import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('星座', () {
    Solar solar = Solar.fromYmd(2020, 3, 21);
    expect(solar.getXingZuo(), '白羊');
  });

  test('星座1', () {
    Solar solar = Solar.fromYmd(2020, 4, 19);
    expect(solar.getXingZuo(), '白羊');
  });

  test('星座2', () {
    Solar solar = Solar.fromYmd(2020, 4, 20);
    expect(solar.getXingZuo(), '金牛');
  });

  test('星座3', () {
    Solar solar = Solar.fromYmd(2020, 5, 20);
    expect(solar.getXingZuo(), '金牛');
  });

  test('星座4', () {
    Solar solar = Solar.fromYmd(2020, 5, 21);
    expect(solar.getXingZuo(), '双子');
  });

  test('星座5', () {
    Solar solar = Solar.fromYmd(2020, 6, 21);
    expect(solar.getXingZuo(), '双子');
  });

  test('星座6', () {
    Solar solar = Solar.fromYmd(2020, 6, 22);
    expect(solar.getXingZuo(), '巨蟹');
  });

  test('星座7', () {
    Solar solar = Solar.fromYmd(2020, 7, 22);
    expect(solar.getXingZuo(), '巨蟹');
  });

  test('星座8', () {
    Solar solar = Solar.fromYmd(2020, 7, 23);
    expect(solar.getXingZuo(), '狮子');
  });

  test('星座9', () {
    Solar solar = Solar.fromYmd(2020, 8, 22);
    expect(solar.getXingZuo(), '狮子');
  });

  test('星座10', () {
    Solar solar = Solar.fromYmd(2020, 8, 23);
    expect(solar.getXingZuo(), '处女');
  });

  test('星座11', () {
    Solar solar = Solar.fromYmd(2020, 9, 22);
    expect(solar.getXingZuo(), '处女');
  });

  test('星座12', () {
    Solar solar = Solar.fromYmd(2020, 9, 23);
    expect(solar.getXingZuo(), '天秤');
  });

  test('星座13', () {
    Solar solar = Solar.fromYmd(2020, 10, 23);
    expect(solar.getXingZuo(), '天秤');
  });

  test('星座14', () {
    Solar solar = Solar.fromYmd(2020, 10, 24);
    expect(solar.getXingZuo(), '天蝎');
  });

  test('星座15', () {
    Solar solar = Solar.fromYmd(2020, 11, 22);
    expect(solar.getXingZuo(), '天蝎');
  });

  test('星座16', () {
    Solar solar = Solar.fromYmd(2020, 11, 23);
    expect(solar.getXingZuo(), '射手');
  });

  test('星座17', () {
    Solar solar = Solar.fromYmd(2020, 12, 21);
    expect(solar.getXingZuo(), '射手');
  });

  test('星座18', () {
    Solar solar = Solar.fromYmd(2020, 12, 22);
    expect(solar.getXingZuo(), '摩羯');
  });

  test('星座19', () {
    Solar solar = Solar.fromYmd(2021, 1, 19);
    expect(solar.getXingZuo(), '摩羯');
  });

  test('星座20', () {
    Solar solar = Solar.fromYmd(2021, 1, 20);
    expect(solar.getXingZuo(), '水瓶');
  });

  test('星座21', () {
    Solar solar = Solar.fromYmd(2021, 2, 18);
    expect(solar.getXingZuo(), '水瓶');
  });

  test('星座22', () {
    Solar solar = Solar.fromYmd(2021, 2, 19);
    expect(solar.getXingZuo(), '双鱼');
  });

  test('星座23', () {
    Solar solar = Solar.fromYmd(2021, 3, 20);
    expect(solar.getXingZuo(), '双鱼');
  });
}
