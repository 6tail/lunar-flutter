import 'ExactDate.dart';
import 'SolarMonth.dart';

/// 阳历年
/// @author 6tail
class SolarYear {
  /// 一年的月数
  static const int MONTH_COUNT = 12;

  /// 年
  int _year = 0;

  SolarYear() {
    SolarYear.fromDate(DateTime.now());
  }

  SolarYear.fromYear(int year) {
    _year = year;
  }

  SolarYear.fromDate(DateTime date) {
    _year = ExactDate.fromDate(date).year;
  }

  int getYear() => _year;

  List<SolarMonth> getMonths() {
    List<SolarMonth> l = <SolarMonth>[];
    SolarMonth m = new SolarMonth.fromYm(_year, 1);
    l.add(m);
    for (int i = 1; i < MONTH_COUNT; i++) {
      l.add(m.next(i));
    }
    return l;
  }

  SolarYear next(int years) => SolarYear.fromYear(_year + years);

  @override
  String toString() => '$_year';

  String toFullString() => '$_year年';
}
