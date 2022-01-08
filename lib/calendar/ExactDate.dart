import 'util/SolarUtil.dart';

/// 精确日期
/// @author 6tail
class ExactDate {
  static DateTime fromYmd(int year, int month, int day) {
    return fromYmdHms(year, month, day, 0, 0, 0);
  }

  static DateTime fromYmdHms(
      int year, int month, int day, int hour, int minute, int second) {
    return DateTime(year, month, day, hour, minute, second, 0, 0).toLocal();
  }

  static DateTime fromDate(DateTime date) {
    return fromYmdHms(
        date.year, date.month, date.day, date.hour, date.minute, date.second);
  }

  /// 获取两个日期之间相差的天数（如果日期a比日期b小，天数为正，如果日期a比日期b大，天数为负）
  ///
  /// @param ay 年a
  /// @param am 月a
  /// @param ad 日a
  /// @param by 年b
  /// @param bm 月b
  /// @param bd 日b
  /// @return 天数
  static int getDaysBetween(int ay, int am, int ad, int by, int bm, int bd) {
    int n;
    int days;
    int i;
    if (ay == by) {
      n = SolarUtil.getDaysInYear(by, bm, bd) -
          SolarUtil.getDaysInYear(ay, am, ad);
    } else if (ay > by) {
      days = SolarUtil.getDaysOfYear(by) - SolarUtil.getDaysInYear(by, bm, bd);
      for (i = by + 1; i < ay; i++) {
        days += SolarUtil.getDaysOfYear(i);
      }
      days += SolarUtil.getDaysInYear(ay, am, ad);
      n = -days;
    } else {
      days = SolarUtil.getDaysOfYear(ay) - SolarUtil.getDaysInYear(ay, am, ad);
      for (i = ay + 1; i < by; i++) {
        days += SolarUtil.getDaysOfYear(i);
      }
      days += SolarUtil.getDaysInYear(by, bm, bd);
      n = days;
    }
    return n;
  }

  /// 获取两个日期之间相差的天数（如果日期a比日期b小，天数为正，如果日期a比日期b大，天数为负）
  ///
  /// @param calendar0 日期a
  /// @param calendar1 日期b
  /// @return 天数
  static int getDaysBetweenDate(DateTime date0, DateTime date1) {
    return getDaysBetween(
        date0.year, date0.month, date0.day, date1.year, date1.month, date1.day);
  }
}
