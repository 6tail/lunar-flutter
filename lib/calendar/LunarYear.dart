import 'Lunar.dart';
import 'LunarMonth.dart';
import 'Solar.dart';
import 'util/ShouXingUtil.dart';

/// 农历年
/// @author 6tail
class LunarYear {
  /// 农历年
  int _year = 0;

  /// 农历月们
  List<LunarMonth> _months = <LunarMonth>[];

  /// 节气儒略日们
  List<double> _jieQiJulianDays = <double>[];

  LunarYear(int lunarYear) {
    _year = lunarYear;
    _compute();
  }

  LunarYear.fromYear(int lunarYear) {
    _year = lunarYear;
    _compute();
  }

  void _compute() {
    // 节气(中午12点)，长度25
    List<double> jq = <double>[];
    // 合朔，即每月初一(中午12点)，长度16
    List<double> hs = <double>[];
    // 每月天数，长度15
    List<int> dayCounts = <int>[];

    int year = _year - 2000;
    // 从上年的大雪到下年的立春
    for (int i = 0, j = Lunar.JIE_QI_IN_USE.length; i < j; i++) {
      // 精确的节气
      double t = 36525 *
          ShouXingUtil.saLonT(
              (year + (17 + i) * 15.0 / 360) * ShouXingUtil.PI_2);
      t += ShouXingUtil.ONE_THIRD - ShouXingUtil.dtT(t);
      _jieQiJulianDays.add(t + Solar.J2000);
      // 按中午12点算的节气
      if (i > 0 && i < 26) {
        jq.add(t.roundToDouble());
      }
    }

    // 冬至前的初一
    double w = ShouXingUtil.calcShuo(jq[0]);
    if (w > jq[0]) {
      w -= 29.5306;
    }
    // 递推每月初一
    for (int i = 0; i < 16; i++) {
      hs.add(ShouXingUtil.calcShuo(w + 29.5306 * i));
    }
    // 每月天数
    for (int i = 0; i < 15; i++) {
      dayCounts.add((hs[i + 1] - hs[i]).floor());
    }

    int leap = -1;
    if (hs[13] <= jq[24]) {
      int i = 1;
      while (hs[i + 1] > jq[2 * i] && i < 13) {
        i++;
      }
      leap = i;
    }

    int y = _year - 1;
    int m = 11;
    for (int i = 0, j = dayCounts.length; i < j; i++) {
      bool isLeap = false;
      if (i == leap) {
        isLeap = true;
        m--;
      }
      _months.add(new LunarMonth(
          y, isLeap ? -m : m, dayCounts[i], hs[i] + Solar.J2000));
      m++;
      if (m == 13) {
        m = 1;
        y++;
      }
    }
  }

  int getYear() => _year;

  List<LunarMonth> getMonths() => _months;

  List<double> getJieQiJulianDays() => _jieQiJulianDays;

  LunarMonth? getMonth(int lunarMonth) {
    for (LunarMonth m in _months) {
      if (m.getYear() == _year && m.getMonth() == lunarMonth) {
        return m;
      }
    }
    return null;
  }

  int getLeapMonth() {
    for (LunarMonth m in _months) {
      if (m.getYear() == _year && m.isLeap()) {
        return m.getMonth().abs();
      }
    }
    return 0;
  }

  @override
  String toString() {
    return '$_year';
  }

  String toFullString() {
    return '$_year年';
  }
}
