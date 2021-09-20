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
}
