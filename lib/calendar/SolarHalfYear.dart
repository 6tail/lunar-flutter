import 'ExactDate.dart';
import 'SolarMonth.dart';

/// 阳历半年
/// @author 6tail
class SolarHalfYear {
  /// 半年的月数
  static const int MONTH_COUNT = 6;

  /// 年
  int _year = 0;

  /// 月
  int _month = 0;

  SolarHalfYear() : this.fromDate(DateTime.now());

  SolarHalfYear.fromYm(int year, int month) {
    _year = year;
    _month = month;
  }

  SolarHalfYear.fromDate(DateTime date) {
    DateTime c = ExactDate.fromDate(date);
    _year = c.year;
    _month = c.month;
  }

  int getYear() => _year;

  int getMonth() => _month;

  int getIndex() => (_month * 1.0 / MONTH_COUNT).ceil();

  List<SolarMonth> getMonths() {
    List<SolarMonth> l = <SolarMonth>[];
    int index = getIndex() - 1;
    for (int i = 0; i < MONTH_COUNT; i++) {
      l.add(SolarMonth.fromYm(_year, MONTH_COUNT * index + i + 1));
    }
    return l;
  }

  SolarHalfYear next(int halfYears) {
    if (0 == halfYears) {
      return SolarHalfYear.fromYm(_year, _month);
    } else {
      int rest = halfYears * MONTH_COUNT;
      int y = _year;
      y += (rest / 12).floor();
      rest = rest % 12;
      int m = _month + rest;
      if (m > 12) {
        y += 1;
        m -= 12;
      } else if (m < 1) {
        y -= 1;
        m += 12;
      }
      return SolarHalfYear.fromYm(y, m);
    }
  }

  @override
  String toString() {
    return '$_year.${getIndex()}';
  }

  String toFullString() {
    return '$_year年${getIndex() == 1 ? '上' : '下'}半年';
  }
}
