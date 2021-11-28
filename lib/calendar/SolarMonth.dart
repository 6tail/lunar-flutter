import 'ExactDate.dart';
import 'Solar.dart';
import 'util/SolarUtil.dart';

/// 阳历月
/// @author 6tail
class SolarMonth {
  /// 年
  int _year = 0;

  /// 月
  int _month = 0;

  SolarMonth() : this.fromDate(DateTime.now());

  SolarMonth.fromYm(int year, int month) {
    _year = year;
    _month = month;
  }

  SolarMonth.fromDate(DateTime date) {
    DateTime c = ExactDate.fromDate(date);
    _year = c.year;
    _month = c.month;
  }

  int getYear() => _year;

  int getMonth() => _month;

  List<Solar> getDays() {
    List<Solar> l = <Solar>[];
    Solar d = new Solar.fromYmd(_year, _month, 1);
    l.add(d);
    int days = SolarUtil.getDaysOfMonth(_year, _month);
    for (int i = 1; i < days; i++) {
      l.add(d.next(i));
    }
    return l;
  }

  SolarMonth next(int months) {
    int y = _year;
    int m = _month + months;
    y += (m / 12).floor();
    return SolarMonth.fromYm(y, m % 12);
  }

  @override
  String toString() => '$_year-$_month';

  String toFullString() => '$_year年$_month月';
}
