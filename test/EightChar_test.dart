import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('八字1', () {
    Solar solar = Solar.fromYmdHms(2005, 12, 23, 8, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYear(), '乙酉');
    expect(eightChar.getMonth(), '戊子');
    expect(eightChar.getDay(), '辛巳');
    expect(eightChar.getTime(), '壬辰');
  });

  test('八字2', () {
    Solar solar = Solar.fromYmdHms(1988, 2, 15, 23, 30, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYear(), '戊辰');
    expect(eightChar.getMonth(), '甲寅');
    expect(eightChar.getDay(), '庚子');
    expect(eightChar.getTime(), '戊子');

    eightChar.setSect(1);
    expect(eightChar.getYear(), '戊辰');
    expect(eightChar.getMonth(), '甲寅');
    expect(eightChar.getDay(), '辛丑');
    expect(eightChar.getTime(), '戊子');
  });

  test('八字3', () {
    Solar solar = Solar.fromYmdHms(1988, 2, 15, 22, 30, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYear(), '戊辰');
    expect(eightChar.getMonth(), '甲寅');
    expect(eightChar.getDay(), '庚子');
    expect(eightChar.getTime(), '丁亥');
  });

  test('八字4', () {
    Solar solar = Solar.fromYmdHms(1988, 2, 2, 22, 30, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYear(), '丁卯');
    expect(eightChar.getMonth(), '癸丑');
    expect(eightChar.getDay(), '丁亥');
    expect(eightChar.getTime(), '辛亥');
  });

  test('八字5', () {
    Lunar lunar = Lunar.fromYmdHms(2019, 12, 12, 11, 22, 0);
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYear(), '己亥');
    expect(eightChar.getMonth(), '丁丑');
    expect(eightChar.getDay(), '戊申');
    expect(eightChar.getTime(), '戊午');
  });

  test('八字6', () {
    Solar solar = Solar.fromYmdHms(2005, 12, 23, 8, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearHideGan().toString(), '[辛]');
    expect(eightChar.getMonthHideGan().toString(), '[癸]');
    expect(eightChar.getDayHideGan().toString(), '[丙, 庚, 戊]');
    expect(eightChar.getTimeHideGan().toString(), '[戊, 乙, 癸]');
  });

  test('八字7', () {
    Solar solar = Solar.fromYmdHms(2005, 12, 23, 8, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearShiShenGan(), '偏财');
    expect(eightChar.getMonthShiShenGan(), '正印');
    expect(eightChar.getDayShiShenGan(), '日主');
    expect(eightChar.getTimeShiShenGan(), '伤官');
  });

  test('八字8', () {
    Solar solar = Solar.fromYmdHms(2005, 12, 23, 8, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearShiShenZhi().toString(), '[比肩]');
    expect(eightChar.getMonthShiShenZhi().toString(), '[食神]');
    expect(eightChar.getDayShiShenZhi().toString(), '[正官, 劫财, 正印]');
    expect(eightChar.getTimeShiShenZhi().toString(), '[正印, 偏财, 食神]');
  });

  test('八字9', () {
    Solar solar = Solar.fromYmdHms(2005, 12, 23, 8, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearDiShi(), '临官');
    expect(eightChar.getMonthDiShi(), '长生');
    expect(eightChar.getDayDiShi(), '死');
    expect(eightChar.getTimeDiShi(), '墓');
  });

  test('八字10', () {
    Solar solar = Solar.fromYmdHms(2020, 11, 18, 17, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearDiShi(), '病');
    expect(eightChar.getMonthDiShi(), '死');
    expect(eightChar.getDayDiShi(), '衰');
    expect(eightChar.getTimeDiShi(), '绝');
  });

  test('八字11', () {
    Solar solar = Solar.fromYmdHms(2020, 11, 19, 17, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearDiShi(), '胎');
    expect(eightChar.getMonthDiShi(), '绝');
    expect(eightChar.getDayDiShi(), '长生');
    expect(eightChar.getTimeDiShi(), '死');
  });

  test('八字12', () {
    Solar solar = Solar.fromYmdHms(2020, 11, 20, 17, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearDiShi(), '绝');
    expect(eightChar.getMonthDiShi(), '胎');
    expect(eightChar.getDayDiShi(), '病');
    expect(eightChar.getTimeDiShi(), '长生');
  });

  test('八字13', () {
    Solar solar = Solar.fromYmdHms(2020, 11, 21, 17, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearDiShi(), '胎');
    expect(eightChar.getMonthDiShi(), '绝');
    expect(eightChar.getDayDiShi(), '冠带');
    expect(eightChar.getTimeDiShi(), '死');
  });

  test('八字14', () {
    Solar solar = Solar.fromYmdHms(2020, 11, 22, 17, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearDiShi(), '绝');
    expect(eightChar.getMonthDiShi(), '胎');
    expect(eightChar.getDayDiShi(), '帝旺');
    expect(eightChar.getTimeDiShi(), '长生');
  });

  test('八字15', () {
    Solar solar = Solar.fromYmdHms(2020, 11, 23, 17, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearDiShi(), '死');
    expect(eightChar.getMonthDiShi(), '病');
    expect(eightChar.getDayDiShi(), '沐浴');
    expect(eightChar.getTimeDiShi(), '帝旺');
  });

  test('八字16', () {
    Solar solar = Solar.fromYmdHms(2020, 11, 24, 17, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearDiShi(), '长生');
    expect(eightChar.getMonthDiShi(), '沐浴');
    expect(eightChar.getDayDiShi(), '衰');
    expect(eightChar.getTimeDiShi(), '临官');
  });

  test('八字17', () {
    Solar solar = Solar.fromYmdHms(2020, 11, 25, 17, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearDiShi(), '帝旺');
    expect(eightChar.getMonthDiShi(), '临官');
    expect(eightChar.getDayDiShi(), '长生');
    expect(eightChar.getTimeDiShi(), '沐浴');
  });

  test('八字18', () {
    Solar solar = Solar.fromYmdHms(2020, 11, 26, 17, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearDiShi(), '临官');
    expect(eightChar.getMonthDiShi(), '帝旺');
    expect(eightChar.getDayDiShi(), '病');
    expect(eightChar.getTimeDiShi(), '病');
  });

  test('八字19', () {
    Solar solar = Solar.fromYmdHms(2020, 11, 27, 17, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearDiShi(), '沐浴');
    expect(eightChar.getMonthDiShi(), '长生');
    expect(eightChar.getDayDiShi(), '养');
    expect(eightChar.getTimeDiShi(), '胎');
  });

  test('纳音', () {
    Solar solar = Solar.fromYmdHms(2005, 12, 23, 8, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getYearNaYin(), '泉中水');
    expect(eightChar.getMonthNaYin(), '霹雳火');
    expect(eightChar.getDayNaYin(), '白蜡金');
    expect(eightChar.getTimeNaYin(), '长流水');
  });

  test('胎元', () {
    Solar solar = Solar.fromYmdHms(2005, 12, 23, 8, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getTaiYuan(), '己卯');
  });

  test('胎元2', () {
    Solar solar = Solar.fromYmdHms(1995, 12, 18, 10, 28, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getTaiYuan(), '己卯');
  });

  test('命宫', () {
    Solar solar = Solar.fromYmdHms(2005, 12, 23, 8, 37, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getMingGong(), '己丑');
  });

  test('命宫2', () {
    Solar solar = Solar.fromYmdHms(1998, 6, 11, 4, 28, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getMingGong(), '辛酉');
  });

  test('命宫3', () {
    Solar solar = Solar.fromYmdHms(1995, 12, 18, 10, 28, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getMingGong(), '戊子');
  });

  test('身宫', () {
    Solar solar = Solar.fromYmdHms(1995, 12, 18, 10, 28, 0);
    Lunar lunar = solar.getLunar();
    EightChar eightChar = lunar.getEightChar();
    expect(eightChar.getShenGong(), '壬午');
  });

  test('身宫2', () {
    Lunar lunar = Solar.fromYmdHms(1994, 12, 6, 2, 0, 0).getLunar();
    expect(
        lunar.getEightChar().getShenGong(), '丁丑');
  });

  test('身宫3', () {
    Lunar lunar = Solar.fromYmdHms(1990, 12, 11, 6, 0, 0).getLunar();
    expect(
        lunar.getEightChar().getShenGong(), '庚辰');
  });

  test('身宫4', () {
    Lunar lunar = Solar.fromYmdHms(1993, 5, 23, 4, 0, 0).getLunar();
    expect(
        lunar.getEightChar().getShenGong(), '庚申');
  });

  test('4', () {
    Lunar lunar = Lunar.fromYmd(1985, 12, 27);
    expect(
        lunar.getEightChar().getYun(1).getStartSolar().toYmd(), '1995-11-05');
  });

  test('5', () {
    Lunar lunar = Lunar.fromYmd(1985, 1, 27);
    expect(
        lunar.getEightChar().getYun(1).getStartSolar().toYmd(), '1989-03-28');
  });

  test('6', () {
    Lunar lunar = Lunar.fromYmd(1986, 12, 27);
    expect(
        lunar.getEightChar().getYun(1).getStartSolar().toYmd(), '1990-04-15');
  });

}
