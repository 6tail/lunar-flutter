import 'ExactDate.dart';
import 'Solar.dart';
import 'util/SolarUtil.dart';

/// 阳历周
/// @author 6tail
class SolarWeek {
  /// 年
  int _year = 0;

  /// 月
  int _month = 0;

  /// 日
  int _day = 0;

  /// 星期几作为一周的开始，1234560分别代表星期一至星期天
  int _start = 0;

  SolarWeek(int start) : this.fromDate(DateTime.now(), start);

  SolarWeek.fromYmd(int year, int month, int day, start) {
    _year = year;
    _month = month;
    _day = day;
    _start = start;
  }

  SolarWeek.fromDate(DateTime date, int start) {
    DateTime c = ExactDate.fromDate(date);
    _year = c.year;
    _month = c.month;
    _day = c.day;
    _start = start;
  }

  int getYear() => _year;

  int getMonth() => _month;

  int getDay() => _day;

  int getStart() => _start;

  SolarWeek next(int weeks, bool separateMonth) {
    if (0 == weeks) {
      return SolarWeek.fromYmd(_year, _month, _day, _start);
    }
    if (separateMonth) {
      int n = weeks;
      DateTime c = ExactDate.fromYmd(_year, _month, _day);
      SolarWeek week = SolarWeek.fromDate(c, _start);
      int month = _month;
      bool plus = n > 0;
      while (0 != n) {
        c = c.add(new Duration(days: plus ? 7 : -7));
        week = SolarWeek.fromDate(c, _start);
        int weekMonth = week.getMonth();
        if (month != weekMonth) {
          int index = week.getIndex();
          if (plus) {
            if (1 == index) {
              Solar firstDay = week.getFirstDay();
              week = SolarWeek.fromYmd(firstDay.getYear(), firstDay.getMonth(),
                  firstDay.getDay(), _start);
              weekMonth = week.getMonth();
            } else {
              c = ExactDate.fromYmd(week.getYear(), week.getMonth(), 1);
              week = SolarWeek.fromDate(c, _start);
            }
          } else {
            int size = SolarUtil.getWeeksOfMonth(
                week.getYear(), week.getMonth(), _start);
            if (size == index) {
              Solar firstDay = week.getFirstDay();
              Solar lastDay = firstDay.next(6);
              week = SolarWeek.fromYmd(lastDay.getYear(), lastDay.getMonth(),
                  lastDay.getDay(), _start);
              weekMonth = week.getMonth();
            } else {
              c = ExactDate.fromYmd(week.getYear(), week.getMonth(),
                  SolarUtil.getDaysOfMonth(week.getYear(), week.getMonth()));
              week = SolarWeek.fromDate(c, _start);
            }
          }
          month = weekMonth;
        }
        n -= plus ? 1 : -1;
      }
      return week;
    } else {
      DateTime c = ExactDate.fromYmd(_year, _month, _day);
      c = c.add(new Duration(days: weeks * 7));
      return SolarWeek.fromDate(c, _start);
    }
  }

  Solar getFirstDay() {
    DateTime c = ExactDate.fromYmd(_year, _month, _day);
    int week = c.weekday;
    if (week == 7) {
      week = 0;
    }
    int prev = week - _start;
    if (prev < 0) {
      prev += 7;
    }
    c = c.add(new Duration(days: -prev));
    return Solar.fromDate(c);
  }

  Solar? getFirstDayInMonth() {
    List<Solar> days = getDays();
    for (Solar day in days) {
      if (_month == day.getMonth()) {
        return day;
      }
    }
    return null;
  }

  List<Solar> getDays() {
    Solar firstDay = getFirstDay();
    List<Solar> l = <Solar>[];
    l.add(firstDay);
    for (int i = 1; i < 7; i++) {
      l.add(firstDay.next(i));
    }
    return l;
  }

  List<Solar> getDaysInMonth() {
    List<Solar> days = this.getDays();
    List<Solar> l = <Solar>[];
    for (Solar day in days) {
      if (_month != day.getMonth()) {
        continue;
      }
      l.add(day);
    }
    return l;
  }

  int getIndex() {
    DateTime c = ExactDate.fromYmd(_year, _month, 1);
    int firstDayWeek = c.weekday;
    int offset = firstDayWeek - _start;
    if (offset < 0) {
      offset += 7;
    }
    return ((_day + offset) / 7.0).ceil();
  }

  @override
  String toString() => '$_year.$_month.${getIndex()}';

  String toFullString() => '$_year年$_month月第${getIndex()}周';
}
