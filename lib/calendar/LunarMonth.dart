import 'LunarYear.dart';
import 'util/LunarUtil.dart';

/// 农历月
/// @author 6tail
class LunarMonth {
  /// 农历年
  int _year = 0;

  /// 农历月：1-12，闰月为负数，如闰2月为-2
  int _month = 0;

  /// 天数，大月30天，小月29天
  int _dayCount = 0;

  /// 初一的儒略日
  double _firstJulianDay = 0;

  LunarMonth(this._year, this._month, this._dayCount, this._firstJulianDay);

  LunarMonth.fromYm(int lunarYear, int lunarMonth) {
    return LunarYear.fromYear(lunarYear).getMonth(lunarMonth);
  }

  int getYear() => _year;

  int getMonth() => _month;

  int getDayCount() => _dayCount;

  double getFirstJulianDay() => _firstJulianDay;

  bool isLeap() => _month < 0;

  @override
  String toString() {
    String month = LunarUtil.MONTH[_month.abs()];
    return '$_year年${isLeap() ? '闰' : ''}$month月($_dayCount)天';
  }
}
