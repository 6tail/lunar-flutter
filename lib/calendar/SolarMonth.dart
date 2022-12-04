import 'ExactDate.dart';
import 'Solar.dart';
import 'SolarWeek.dart';
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

  List<SolarWeek> getWeeks(int start) {
    List<SolarWeek> l = <SolarWeek>[];
    SolarWeek week = SolarWeek.fromYmd(_year, _month, 1, start);
    while (true) {
      l.add(week);
      week = week.next(1, false);
      Solar firstDay = week.getFirstDay();
      if (firstDay.getYear() > _year || firstDay.getMonth() > _month) {
        break;
      }
    }
    return l;
  }

  SolarMonth next(int months) {
    if (0 == months) {
      return SolarMonth.fromYm(_year, _month);
    } else {
      int rest = months;
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
      return SolarMonth.fromYm(y, m);
    }
  }

  @override
  String toString() => '$_year-$_month';

  String toFullString() => '$_year年$_month月';
}
