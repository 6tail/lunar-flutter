import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('时辰', () {
    I18n.init();
    Map<String, String> map = {
      '23:00': '子',
      '00:59': '子',
      '23:30': '子',
      '01:00': '丑',
      '02:59': '丑',
      '01:30': '丑',
      '03:00': '寅',
      '04:59': '寅',
      '03:30': '寅',
      '05:00': '卯',
      '06:59': '卯',
      '05:30': '卯',
      '07:00': '辰',
      '08:59': '辰',
      '07:30': '辰',
      '09:00': '巳',
      '10:59': '巳',
      '09:30': '巳',
      '11:00': '午',
      '12:59': '午',
      '11:30': '午',
      '13:00': '未',
      '14:59': '未',
      '13:30': '未',
      '15:00': '申',
      '16:59': '申',
      '15:30': '申',
      '17:00': '酉',
      '18:59': '酉',
      '17:30': '酉',
      '19:00': '戌',
      '20:59': '戌',
      '19:30': '戌',
      '21:00': '亥',
      '22:59': '亥',
      '21:30': '亥',
      '': '子',
      '23:01:01': '子',
      '其他': '子',
      '21:01:01': '亥'
    };
    for (MapEntry<String, String> entry in map.entries) {
      String hm = entry.key;
      String zhi = entry.value;
      expect(LunarUtil.convertTime(hm), zhi);
    }
  });

  test('时辰1', () {
    Map<String, String> map = {
      //晚子时
      '2020-4,5,23:00': '戊',
      //早子时
      '2020-4,5,00:59': '丙',
      //晚子时
      '2020-4,5,23:30': '戊',

      '2020-4,5,01:00': '丁',
      '2020-4,5,02:59': '丁',
      '2020-4,5,01:30': '丁',

      '2020-4,5,03:00': '戊',
      '2020-4,5,04:59': '戊',
      '2020-4,5,03:30': '戊',

      '2020-4,5,05:00': '己',
      '2020-4,5,06:59': '己',
      '2020-4,5,05:30': '己',

      '2020-4,5,07:00': '庚',
      '2020-4,5,08:59': '庚',
      '2020-4,5,07:30': '庚',

      '2020-4,5,09:00': '辛',
      '2020-4,5,10:59': '辛',
      '2020-4,5,09:30': '辛',

      '2020-4,5,11:00': '壬',
      '2020-4,5,12:59': '壬',
      '2020-4,5,11:30': '壬',

      '2020-4,5,13:00': '癸',
      '2020-4,5,14:59': '癸',
      '2020-4,5,13:30': '癸',

      '2020-4,5,15:00': '甲',
      '2020-4,5,16:59': '甲',
      '2020-4,5,15:30': '甲',

      '2020-4,5,17:00': '乙',
      '2020-4,5,18:59': '乙',
      '2020-4,5,17:30': '乙',

      '2020-4,5,19:00': '丙',
      '2020-4,5,20:59': '丙',
      '2020-4,5,19:30': '丙',

      '2020-4,5,21:00': '丁',
      '2020-4,5,22:59': '丁',
      '2020-4,5,21:30': '丁',

      '2020-4,5,null': '丙',

      '2020-4,5,': '丙',
      '2020-4,5,23:01:01': '戊',
      '2020-4,5,其他': '丙',
      '2020-4,5,0:90': '丙',

      '2020-4,5,21:01:01': '丁',

      '2020-4,2,23:00': '壬',
      '2020-4,2,11:20': '丙'
    };
    for (MapEntry<String, String> entry in map.entries) {
      int hour = 0, minute = 0;
      String time = entry.key;
      int year = int.parse(time.substring(0, 4));
      int month = int.parse(time.substring(4, time.indexOf(",")));
      int day = int.parse(
          time.substring(time.indexOf(",") + 1, time.lastIndexOf(",")));
      String hm = time.substring(time.lastIndexOf(",") + 1);
      if (hm.length >= 5) {
        hour = int.parse(hm.substring(0, 2), radix: 10);
        minute = int.parse(hm.substring(3, 5), radix: 10);
      }
      Lunar lunar = Lunar.fromYmdHms(year, month, day, hour, minute, 0);
      expect(lunar.getTimeGan(), entry.value);
    }
  });

  test('时辰2', () {
    Map<String, String> map = {
      //晚子时
      '2020-4,5,23:00': '戊子',
      //早子时
      '2020-4,5,00:59': '丙子',
      //晚子时
      '2020-4,5,23:30': '戊子',

      '2020-4,5,01:00': '丁丑',
      '2020-4,5,02:59': '丁丑',
      '2020-4,5,01:30': '丁丑',

      '2020-4,5,03:00': '戊寅',
      '2020-4,5,04:59': '戊寅',
      '2020-4,5,03:30': '戊寅',

      '2020-4,5,05:00': '己卯',
      '2020-4,5,06:59': '己卯',
      '2020-4,5,05:30': '己卯',

      '2020-4,5,07:00': '庚辰',
      '2020-4,5,08:59': '庚辰',
      '2020-4,5,07:30': '庚辰',

      '2020-4,5,09:00': '辛巳',
      '2020-4,5,10:59': '辛巳',
      '2020-4,5,09:30': '辛巳',

      '2020-4,5,11:00': '壬午',
      '2020-4,5,12:59': '壬午',
      '2020-4,5,11:30': '壬午',

      '2020-4,5,13:00': '癸未',
      '2020-4,5,14:59': '癸未',
      '2020-4,5,13:30': '癸未',

      '2020-4,5,15:00': '甲申',
      '2020-4,5,16:59': '甲申',
      '2020-4,5,15:30': '甲申',

      '2020-4,5,17:00': '乙酉',
      '2020-4,5,18:59': '乙酉',
      '2020-4,5,17:30': '乙酉',

      '2020-4,5,19:00': '丙戌',
      '2020-4,5,20:59': '丙戌',
      '2020-4,5,19:30': '丙戌',

      '2020-4,5,21:00': '丁亥',
      '2020-4,5,22:59': '丁亥',
      '2020-4,5,21:30': '丁亥',

      '2020-4,5,null': '丙子',

      '2020-4,5,': '丙子',
      '2020-4,5,23:01:01': '戊子',
      '2020-4,5,其他': '丙子',
      '2020-4,5,0:90': '丙子',

      '2020-4,5,20:21:01': '丙戌',
      '2020-4,5,21:01:01': '丁亥',
      '2020-4,5,01:21:01': '丁丑',

      '2020-4,2,23:00': '壬子',
      '2020-4,2,11:20': '丙午',
      '20204,28,23:20': '甲子',
      '20204,29,00:20': '甲子',
    };
    for (MapEntry<String, String> entry in map.entries) {
      int hour = 0, minute = 0;
      String time = entry.key;
      int year = int.parse(time.substring(0, 4));
      int month = int.parse(time.substring(4, time.indexOf(",")));
      int day = int.parse(
          time.substring(time.indexOf(",") + 1, time.lastIndexOf(",")));
      String hm = time.substring(time.lastIndexOf(",") + 1);
      if (hm.length >= 5) {
        hour = int.parse(hm.substring(0, 2), radix: 10);
        minute = int.parse(hm.substring(3, 5), radix: 10);
      }
      Lunar lunar = Lunar.fromYmdHms(year, month, day, hour, minute, 0);
      expect(lunar.getTimeInGanZhi(), entry.value);
    }
  });

  test('LunarTime', () {
    LunarTime time = LunarTime.fromYmdHms(2020, 1, 1, 12, 0, 0);
    expect(time.getZhi(), '午');
    expect(time.getMaxHm(), '12:59');
  });
}
