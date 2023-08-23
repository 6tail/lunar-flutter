import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('阳历', () {
    Solar solar = Solar.fromYmd(2019, 5, 1);
    expect(solar.toString(), '2019-05-01');
    expect(solar.toFullString(), '2019-05-01 00:00:00 星期三 (劳动节) 金牛座');
    expect(solar.getLunar().toString(), '二〇一九年三月廿七');
    expect(solar.getLunar().toFullString(),
        '二〇一九年三月廿七 己亥(猪)年 戊辰(龙)月 戊戌(狗)日 子(鼠)时 纳音[平地木 大林木 平地木 桑柘木] 星期三 西方白虎 星宿[参水猿](吉) 彭祖百忌[戊不受田田主不祥 戌不吃犬作怪上床] 喜神方位[巽](东南) 阳贵神方位[艮](东北) 阴贵神方位[坤](西南) 福神方位[艮](东北) 财神方位[坎](正北) 冲[(壬辰)龙] 煞[北]');
  });

  test('阳历1', () {
    Solar solar = Solar.fromYmd(2020, 1, 23);
    expect(solar.next(1).toString(), '2020-01-24');
  });

  test('1', () {
    Solar solar = Solar.fromYmdHms(2020, 5, 24, 13, 0, 0);
    expect(solar.getLunar().toString(), '二〇二〇年闰四月初二');
  });

  test('6', () {
    Solar solar = Solar.fromYmd(11, 1, 1);
    expect(solar.getLunar().toString(), '一〇年腊月初八');
  });

  test('7', () {
    Solar solar = Solar.fromYmd(11, 3, 1);
    expect(solar.getLunar().toString(), '一一年二月初八');
  });

  test('9', () {
    Solar solar = Solar.fromYmd(26, 4, 13);
    expect(solar.getLunar().toString(), '二六年三月初八');
  });

  test('10', () {
    expect(SolarUtil.isLeapYear(1500), true);
  });

  test('next', () {
    Solar solar = Solar.fromYmd(2020, 1, 23);
    expect(solar.next(1).toString(), '2020-01-24');

    // 仅工作日，跨越春节假期
    expect(solar.next(1, true).toString(), '2020-02-03');

    solar = Solar.fromYmd(2020, 2, 3);
    expect(solar.next(-3).toString(), '2020-01-31');
    // 仅工作日，跨越春节假期
    expect(solar.next(-3, true).toString(), '2020-01-21');

    solar = Solar.fromYmd(2020, 2, 9);
    expect(solar.next(6).toString(), '2020-02-15');
    // 仅工作日，跨越周末
    expect(solar.next(6, true).toString(), '2020-02-17');

    solar = Solar.fromYmd(2020, 1, 17);
    expect(solar.next(1).toString(), '2020-01-18');
    // 仅工作日，周日调休按上班算
    expect(solar.next(1, true).toString(), '2020-01-19');
  });

  test('11', () {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(681231600000, isUtc: true);
    Solar solar = Solar.fromDate(date);
    expect(solar.toYmd(), '1991-08-03');
    expect(solar.getLunar().toString(), '一九九一年六月廿三');
    expect(Lunar.fromDate(date).toString(), '一九九一年六月廿三');
  });

  test('12', () {
    Solar solar = Solar.fromYmd(2022, 3, 28);
    expect(solar.getFestivals(), ['全国中小学生安全教育日']);
  });

  test('test12', () {
    Solar solar = Solar.fromYmd(2022, 1, 1);
    expect(solar.next(1).toYmd(), '2022-01-02');
  });

  test('13', () {
    Solar solar = Solar.fromYmd(2022, 1, 31);
    expect(solar.next(1).toYmd(), '2022-02-01');
  });

  test('14', () {
    Solar solar = Solar.fromYmd(2022, 1, 1);
    expect(solar.next(365).toYmd(), '2023-01-01');
  });

  test('15', () {
    Solar solar = Solar.fromYmd(2023, 1, 1);
    expect(solar.next(-365).toYmd(), '2022-01-01');
  });

  test('16', () {
    Solar solar = Solar.fromYmd(1582, 10, 4);
    expect(solar.next(1).toYmd(), '1582-10-15');
  });

  test('17', () {
    Solar solar = Solar.fromYmd(1582, 10, 4);
    expect(solar.next(18).toYmd(), '1582-11-01');
  });

  test('18', () {
    Solar solar = Solar.fromYmd(1582, 11, 1);
    expect(solar.next(-18).toYmd(), '1582-10-04');
  });

  test('19', () {
    Solar solar = Solar.fromYmd(1582, 11, 1);
    expect(solar.next(-17).toYmd(), '1582-10-15');
  });

  test('20', () {
    int days = SolarUtil.getDaysBetween(1582, 10, 4, 1582, 10, 15);
    expect(days, 1);
  });

  test('21', () {
    int days = SolarUtil.getDaysBetween(1582, 10, 4, 1582, 11, 1);
    expect(days, 18);
  });

  test('22', () {
    int days = SolarUtil.getDaysBetween(1582, 1, 1, 1583, 1, 1);
    expect(days, 355);
  });

  test('23', () {
    Solar solar = Solar.fromYmd(1582, 10, 15);
    expect(solar.next(-5).toYmd(), '1582-09-30');
  });

}
