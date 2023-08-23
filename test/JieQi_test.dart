import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('节气', () {
    Solar solar = Solar.fromYmd(1986, 1, 5);
    Lunar lunar = solar.getLunar();
    expect(lunar.getJie(), '小寒');
    expect(lunar.getJieQi(), '小寒');
    expect(lunar.getCurrentJie()!.getName(), '小寒');
    expect(lunar.getCurrentJieQi()!.getName(), '小寒');
    expect(lunar.getCurrentQi(), null);
    expect(lunar.getQi(), '');
    expect(lunar.getPrevJie().getName(), '大雪');
    expect(lunar.getPrevQi().getName(), '冬至');
    expect(lunar.getPrevJieQi().getName(), '冬至');
  });

  test('节气2', () {
    Solar solar = Solar.fromYmdHms(1986, 1, 20, 17, 0, 0);
    Lunar lunar = solar.getLunar();
    expect(lunar.getJie(), '');
    expect(lunar.getJieQi(), '大寒');
    expect(lunar.getCurrentJie(), null);
    expect(lunar.getCurrentJieQi()!.getName(), '大寒');
    expect(lunar.getCurrentJie(), null);
    expect(lunar.getQi(), '大寒');
    expect(lunar.getNextJie().getName(), '立春');
    expect(lunar.getNextQi().getName(), '雨水');
    expect(lunar.getNextJieQi().getName(), '立春');
  });

  test('节气3', () {
    Solar solar = Solar.fromYmdHms(1986, 1, 20, 14, 0, 0);
    Lunar lunar = solar.getLunar();
    expect(lunar.getPrevJie().getName(), '小寒');
    expect(lunar.getPrevQi().getName(), '冬至');
    expect(lunar.getPrevJieQi().getName(), '小寒');
  });

  test('节气4', () {
    Solar solar = Solar.fromYmd(1986, 12, 7);
    Lunar lunar = solar.getLunar();
    expect(lunar.getJie(), '大雪');
    expect(lunar.getJieQi(), '大雪');
    expect(lunar.getCurrentJie()!.getName(), '大雪');
    expect(lunar.getCurrentJieQi()!.getName(), '大雪');
    expect(lunar.getCurrentQi(), null);
    expect(lunar.getQi(), '');
    expect(lunar.getNextJie().getName(), '大雪');
    expect(lunar.getNextQi().getName(), '冬至');
    expect(lunar.getNextJieQi().getName(), '大雪');
  });

  test('节气5', () {
    Solar solar = Solar.fromYmd(1986, 1, 1);
    Lunar lunar = solar.getLunar();
    expect(lunar.getJie(), '');
    expect(lunar.getJieQi(), '');
    expect(lunar.getCurrentJie(), null);
    expect(lunar.getCurrentJieQi(), null);
    expect(lunar.getCurrentQi(), null);
    expect(lunar.getQi(), '');
    expect(lunar.getPrevJie().getName(), '大雪');
    expect(lunar.getPrevQi().getName(), '冬至');
    expect(lunar.getPrevJieQi().getName(), '冬至');
    expect(lunar.getNextJie().getName(), '小寒');
    expect(lunar.getNextQi().getName(), '大寒');
    expect(lunar.getNextJieQi().getName(), '小寒');
  });

  test('节气6', () {
    Solar solar = Solar.fromYmd(2012, 12, 25);
    Lunar lunar = solar.getLunar();
    expect(lunar.getJie(), '');
    expect(lunar.getJieQi(), '');
    expect(lunar.getCurrentJie(), null);
    expect(lunar.getCurrentJieQi(), null);
    expect(lunar.getCurrentQi(), null);
    expect(lunar.getQi(), '');
    expect(lunar.getPrevJie().getName(), '大雪');
    expect(lunar.getPrevQi().getName(), '冬至');
    expect(lunar.getPrevJieQi().getName(), '冬至');
    expect(lunar.getNextJie().getName(), '小寒');
    expect(lunar.getNextQi().getName(), '大寒');
    expect(lunar.getNextJieQi().getName(), '小寒');
  });

  test('节气7', () {
    Map<String, String> map = {
      '冬至': '2021-12-21 23:59:18',
      '小寒': '2022-01-05 17:14:03',
      '大寒': '2022-01-20 10:39:05',
      '立春': '2022-02-04 04:50:45',
      '雨水': '2022-02-19 00:43:00',
      '惊蛰': '2022-03-05 22:43:43',
      '春分': '2022-03-20 23:33:24',
      '清明': '2022-04-05 03:20:13',
      '谷雨': '2022-04-20 10:24:16',
      '立夏': '2022-05-05 20:25:56',
      '小满': '2022-05-21 09:22:35',
      '芒种': '2022-06-06 00:25:47',
      '夏至': '2022-06-21 17:13:50',
      '小暑': '2022-07-07 10:37:59',
      '大暑': '2022-07-23 04:06:58',
      '立秋': '2022-08-07 20:29:07',
      '处暑': '2022-08-23 11:16:09',
      '白露': '2022-09-07 23:32:17',
      '秋分': '2022-09-23 09:03:41',
      '寒露': '2022-10-08 15:22:26',
      '霜降': '2022-10-23 18:35:41',
      '立冬': '2022-11-07 18:45:28',
      '小雪': '2022-11-22 16:20:28',
      '大雪': '2022-12-07 11:46:15'
    };

    Solar solar = Solar.fromYmd(2022, 7, 15);
    Map<String, Solar> result = solar.getLunar().getJieQiTable();
    for (MapEntry<String, String> entry in map.entries) {
      String name = entry.key;
      expect(result[name]!.toYmdHms(), entry.value);
    }
  });

  test('节气8', () {
    Map<String, String> map = {
      '冬至': '1985-12-22 06:07:40',
      '小寒': '1986-01-05 23:28:02',
      '大寒': '1986-01-20 16:46:12',
      '立春': '1986-02-04 11:07:42',
      '雨水': '1986-02-19 06:57:31',
      '惊蛰': '1986-03-06 05:12:08',
      '春分': '1986-03-21 06:02:41',
      '清明': '1986-04-05 10:06:07',
      '谷雨': '1986-04-20 17:12:08',
      '立夏': '1986-05-06 03:30:36',
      '小满': '1986-05-21 16:27:55',
      '芒种': '1986-06-06 07:44:23',
      '夏至': '1986-06-22 00:29:57',
      '小暑': '1986-07-07 18:00:45',
      '大暑': '1986-07-23 11:24:23',
      '立秋': '1986-08-08 03:45:36',
      '处暑': '1986-08-23 18:25:47',
      '白露': '1986-09-08 06:34:37',
      '秋分': '1986-09-23 15:58:52',
      '寒露': '1986-10-08 22:06:45',
      '霜降': '1986-10-24 01:14:11',
      '立冬': '1986-11-08 01:12:49',
      '小雪': '1986-11-22 22:44:20',
      '大雪': '1986-12-07 18:00:56'
    };

    Solar solar = Solar.fromYmd(1986, 7, 15);
    Map<String, Solar> result = solar.getLunar().getJieQiTable();
    for (MapEntry<String, String> entry in map.entries) {
      String name = entry.key;
      expect(result[name]!.toYmdHms(), entry.value);
    }
  });

  test('test7', () {
    Lunar lunar = Lunar.fromYmd(2012, 9, 1);
    expect(lunar.getJieQiTable()['白露']!.toYmdHms(), '2012-09-07 13:29:01');
  });

  test('test8', () {
    Lunar lunar = Lunar.fromYmd(2050, 12, 1);
    expect(lunar.getJieQiTable()['DA_XUE']!.toYmdHms(), '2050-12-07 06:41:13');
  });

  test('test9', () {
    Solar solar = Solar.fromYmd(2021, 12, 21);
    Lunar lunar = solar.getLunar();
    expect(lunar.getJieQi(), '冬至');
    expect(lunar.getJie(), '');
    expect(lunar.getQi(), '冬至');
  });
}
