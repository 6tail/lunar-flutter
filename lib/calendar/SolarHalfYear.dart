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

  SolarHalfYear next(int months) {
    int y = _year;
    int m = _month + MONTH_COUNT;
    y += (m / 12).floor();
    return SolarHalfYear.fromYm(y, m % 12);
  }

  @override
  String toString() {
    return '$_year.${getIndex()}';
  }

  String toFullString() {
    return '$_year年${getIndex() == 1 ? '上' : '下'}半年';
  }
}
