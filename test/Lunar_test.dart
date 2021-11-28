import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('test', () {
    Lunar lunar = Lunar.fromYmdHms(2019, 3, 27, 0, 0, 0);
    expect(lunar.toString(), '二〇一九年三月廿七');
    expect(lunar.toFullString(),
        '二〇一九年三月廿七 己亥(猪)年 戊辰(龙)月 戊戌(狗)日 子(鼠)时 纳音[平地木 大林木 平地木 桑柘木] 星期三 西方白虎 星宿[参水猿](吉) 彭祖百忌[戊不受田田主不祥 戌不吃犬作怪上床] 喜神方位[巽](东南) 阳贵神方位[艮](东北) 阴贵神方位[坤](西南) 福神方位[艮](东北) 财神方位[坎](正北) 冲[(壬辰)龙] 煞[北]');
    expect(lunar.getSolar().toString(), '2019-05-01');
    expect(
        lunar.getSolar().toFullString(), '2019-05-01 00:00:00 星期三 (劳动节) 金牛座');
  });

  test('test1', () {
    Solar solar = Solar.fromYmdHms(1, 1, 1, 12, 0, 0);
    expect(solar.getLunar().toString(), '〇年冬月十八');
  });

  test('test2', () {
    Solar solar = Solar.fromYmdHms(9999, 12, 31, 12, 0, 0);
    expect(solar.getLunar().toString(), '九九九九年腊月初二');
  });

  test('test3', () {
    Lunar lunar = Lunar.fromYmdHms(0, 11, 18, 12, 0, 0);
    expect(lunar.getSolar().toString(), '0001-01-01');
  });

  test('test4', () {
    Lunar lunar = Lunar.fromYmdHms(9999, 12, 2, 12, 0, 0);
    expect(lunar.getSolar().toString(), '9999-12-31');
  });

  test('test5', () {
    Lunar lunar = Lunar.fromYmdHms(1905, 1, 1, 12, 0, 0);
    expect(lunar.getSolar().toString(), '1905-02-04');
  });

  test('test6', () {
    Lunar lunar = Lunar.fromYmdHms(2038, 12, 29, 12, 0, 0);
    expect(lunar.getSolar().toString(), '2039-01-23');
  });

  test('test7', () {
    Lunar lunar = Lunar.fromYmdHms(2020, -4, 2, 13, 0, 0);
    expect(lunar.toString(), '二〇二〇年闰四月初二');
    expect(lunar.getSolar().toString(), '2020-05-24');
  });

  test('test8', () {
    Lunar lunar = Lunar.fromYmdHms(2020, 12, 10, 13, 0, 0);
    expect(lunar.toString(), '二〇二〇年腊月初十');
    expect(lunar.getSolar().toString(), '2021-01-22');
  });

  test('test9', () {
    Lunar lunar = Lunar.fromYmdHms(1500, 1, 1, 12, 0, 0);
    expect(lunar.getSolar().toString(), '1500-01-31');
  });

  test('test10', () {
    Lunar lunar = Lunar.fromYmdHms(1500, 12, 29, 12, 0, 0);
    expect(lunar.getSolar().toString(), '1501-01-18');
  });

  test('test11', () {
    Solar solar = Solar.fromYmdHms(1500, 1, 1, 12, 0, 0);
    expect(solar.getLunar().toString(), '一四九九年腊月初一');
  });

  test('test12', () {
    Solar solar = Solar.fromYmdHms(1500, 12, 31, 12, 0, 0);
    expect(solar.getLunar().toString(), '一五〇〇年腊月十一');
  });

  test('test13', () {
    Solar solar = Solar.fromYmdHms(1582, 10, 4, 12, 0, 0);
    expect(solar.getLunar().toString(), '一五八二年九月十八');
  });

  test('test14', () {
    Solar solar = Solar.fromYmdHms(1582, 10, 15, 12, 0, 0);
    expect(solar.getLunar().toString(), '一五八二年九月十九');
  });

  test('test15', () {
    Lunar lunar = Lunar.fromYmdHms(1582, 9, 18, 12, 0, 0);
    expect(lunar.getSolar().toString(), '1582-10-04');
  });

  test('test16', () {
    Lunar lunar = Lunar.fromYmdHms(1582, 9, 19, 12, 0, 0);
    expect(lunar.getSolar().toString(), '1582-10-15');
  });

  test('test17', () {
    Lunar lunar = Lunar.fromYmdHms(2019, 12, 12, 11, 22, 0);
    expect(lunar.getSolar().toString(), '2020-01-06');
  });

  test('test18', () {
    Lunar lunar = Lunar.fromYmd(2021, 12, 29);
    expect(lunar.getFestivals()[0], '除夕');
  });

  test('test19', () {
    Lunar lunar = Lunar.fromYmd(2020, 12, 30);
    expect(lunar.getFestivals()[0], '除夕');
  });

  test('test20', () {
    Lunar lunar = Lunar.fromYmd(2020, 12, 29);
    expect(lunar.getFestivals().length, 0);
  });

  test('test21', () {
    Solar solar = Solar.fromYmd(2022, 1, 31);
    Lunar lunar = solar.getLunar();
    expect(lunar.getFestivals()[0], '除夕');
  });

  test('test22', () {
    Lunar lunar = Lunar.fromYmd(2033, -11, 1);
    expect(lunar.getSolar().toYmd(), '2033-12-22');
  });

  test('test23', () {
    Lunar lunar = Lunar.fromYmd(2022, 1, 1);
    expect(lunar.getYearNineStar().toString(), '五黄土玉衡');
  });

  test('test24', () {
    Lunar lunar = Lunar.fromYmd(2033, 1, 1);
    expect(lunar.getYearNineStar().toString(), '三碧木天玑');
  });

  test('test25', () {
    Solar solar = Solar.fromYmdHms(2021, 6, 7, 21, 18, 0);
    Lunar lunar = solar.getLunar();
    expect(lunar.toString(), '二〇二一年四月廿七');
  });

  test('test26', () {
    Lunar lunar = Lunar.fromYmdHms(2021, 6, 7, 21, 18, 0);
    Solar solar = lunar.getSolar();
    expect(solar.toString(), '2021-07-16');
  });

  test('testNext', () {
    Solar solar = Solar.fromYmdHms(2020, 1, 10, 12, 0, 0);
    Lunar lunar = solar.getLunar();
    for (int i = -50; i < 50; i++) {
      expect(lunar.next(i).toFullString(),
          solar.next(i).getLunar().toFullString());
    }
  });

  test('test27', () {
    Solar solar = Solar.fromYmd(1989, 4, 28);
    Lunar lunar = solar.getLunar();
    expect(lunar.getDay(), 23);
  });

  test('test28', () {
    Solar solar = Solar.fromYmd(1990, 10, 8);
    Lunar lunar = solar.getLunar();
    expect(lunar.getMonthInGanZhiExact(), '乙酉');
  });

  test('test29', () {
    Solar solar = Solar.fromYmd(1990, 10, 9);
    Lunar lunar = solar.getLunar();
    expect(lunar.getMonthInGanZhiExact(), '丙戌');
  });

  test('test30', () {
    Solar solar = Solar.fromYmd(1990, 10, 8);
    Lunar lunar = solar.getLunar();
    expect(lunar.getMonthInGanZhi(), '丙戌');
  });

  test('test31', () {
    Solar solar = Solar.fromYmdHms(1987, 4, 17, 9, 0, 0);
    Lunar lunar = solar.getLunar();
    expect(lunar.toString(), '一九八七年三月二十');
  });

  test('test32', () {
    Lunar lunar = Lunar.fromYmd(2034, 1, 1);
    expect(lunar.getSolar().toYmd(), '2034-02-19');
  });

  test('test33', () {
    Lunar lunar = Lunar.fromYmd(2033, 12, 1);
    expect(lunar.getSolar().toYmd(), '2034-01-20');
  });

  test('test34', () {
    Lunar lunar = Lunar.fromYmd(37, -12, 1);
    expect(lunar.getMonthInChinese(), '闰腊');
  });

  test('test35', () {
    Lunar lunar = Lunar.fromYmd(56, -12, 1);
    expect(lunar.getMonthInChinese(), '闰腊');

    lunar = Lunar.fromYmd(75, -11, 1);
    expect(lunar.getMonthInChinese(), '闰冬');

    lunar = Lunar.fromYmd(94, -11, 1);
    expect(lunar.getMonthInChinese(), '闰冬');

    lunar = Lunar.fromYmd(94, 12, 1);
    expect(lunar.getMonthInChinese(), '腊');

    lunar = Lunar.fromYmd(113, 12, 1);
    expect(lunar.getMonthInChinese(), '腊');

    lunar = Lunar.fromYmd(113, -12, 1);
    expect(lunar.getMonthInChinese(), '闰腊');

    lunar = Lunar.fromYmd(5552, -12, 1);
    expect(lunar.getMonthInChinese(), '闰腊');
  });

  test('test36', () {
    Solar solar = Solar.fromYmd(5553, 1, 22);
    Lunar lunar = solar.getLunar();
    expect(lunar.toString(), '五五五二年闰腊月初二');
  });

  test('test37', () {
    Solar solar = Solar.fromYmd(7013, 12, 24);
    Lunar lunar = solar.getLunar();
    expect(lunar.toString(), '七〇一三年闰冬月初四');
  });

  test('test38', () {
    Lunar lunar = Lunar.fromYmd(7013, -11, 4);
    Solar solar = lunar.getSolar();
    expect(solar.toString(), '7013-12-24');
  });

  test('test39', () {
    Solar solar = Solar.fromYmd(1987, 4, 12);
    Lunar lunar = solar.getLunar();
    expect(lunar.toString(), '一九八七年三月十五');
  });

  test('test40', () {
    Solar solar = Solar.fromYmd(1987, 4, 13);
    Lunar lunar = solar.getLunar();
    expect(lunar.toString(), '一九八七年三月十六');
  });

  test('test41', () {
    Solar solar = Solar.fromYmd(4, 2, 10);
    Lunar lunar = solar.getLunar();
    expect(lunar.getYearShengXiao(), '鼠');
  });

  test('test42', () {
    Solar solar = Solar.fromYmd(4, 2, 9);
    Lunar lunar = solar.getLunar();
    expect(lunar.getYearShengXiao(), '猪');
  });

  test('test43', () {
    Solar solar = Solar.fromYmd(1, 2, 12);
    Lunar lunar = solar.getLunar();
    expect(lunar.getYearShengXiao(), '鸡');
  });

  test('test44', () {
    Solar solar = Solar.fromYmd(1, 1, 1);
    Lunar lunar = solar.getLunar();
    expect(lunar.getYearShengXiao(), '猴');
  });

  test('test45', () {
    Solar solar = Solar.fromYmd(2017, 2, 15);
    Lunar lunar = solar.getLunar();
    expect(lunar.getDayLu(), '子命互禄 辛命进禄');
  });
}
