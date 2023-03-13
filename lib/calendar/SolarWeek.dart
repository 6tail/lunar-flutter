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

  SolarWeek(int start) : this.fromDate(DateTime.now().toLocal(), start);

  SolarWeek.fromYmd(int year, int month, int day, start) {
    _year = year;
    _month = month;
    _day = day;
    _start = start;
  }

  SolarWeek.fromDate(DateTime date, int start) {
    _year = date.year;
    _month = date.month;
    _day = date.day;
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
    Solar solar  = Solar.fromYmd(_year, _month, _day);
    if (separateMonth) {
      int n = weeks;
      SolarWeek week = SolarWeek.fromYmd(solar.getYear(), solar.getMonth(), solar.getDay(), _start);
      int month = _month;
      bool plus = n > 0;
      while (0 != n) {
        solar = solar.next(plus ? 7 : -7);
        week = SolarWeek.fromYmd(solar.getYear(), solar.getMonth(), solar.getDay(), _start);
        int weekMonth = week.getMonth();
        if (month != weekMonth) {
          int index = week.getIndex();
          if (plus) {
            if (1 == index) {
              Solar firstDay = week.getFirstDay();
              week = SolarWeek.fromYmd(firstDay.getYear(), firstDay.getMonth(), firstDay.getDay(), _start);
              weekMonth = week.getMonth();
            } else {
              solar = Solar.fromYmd(week.getYear(), week.getMonth(), 1);
              week = SolarWeek.fromYmd(solar.getYear(), solar.getMonth(), solar.getDay(), _start);
            }
          } else {
            if (SolarUtil.getWeeksOfMonth(week.getYear(), week.getMonth(), _start) == index) {
              Solar lastDay = week.getFirstDay().next(6);
              week = SolarWeek.fromYmd(lastDay.getYear(), lastDay.getMonth(), lastDay.getDay(), _start);
              weekMonth = week.getMonth();
            } else {
              solar = Solar.fromYmd(week.getYear(), week.getMonth(), SolarUtil.getDaysOfMonth(week.getYear(), week.getMonth()));
              week = SolarWeek.fromYmd(solar.getYear(), solar.getMonth(), solar.getDay(), _start);
            }
          }
          month = weekMonth;
        }
        n -= plus ? 1 : -1;
      }
      return week;
    } else {
      solar = solar.next(weeks * 7);
      return SolarWeek.fromYmd(solar.getYear(), solar.getMonth(), solar.getDay(), _start);
    }
  }

  Solar getFirstDay() {
    Solar solar = Solar.fromYmd(_year, _month, _day);
    int prev = solar.getWeek() - _start;
    if (prev < 0) {
      prev += 7;
    }
    return solar.next(-prev);
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
    int offset = Solar.fromYmd(_year, _month, 1).getWeek() - _start;
    if (offset < 0) {
      offset += 7;
    }
    return ((_day + offset) / 7.0).ceil();
  }

  int getIndexInYear() {
    int offset = Solar.fromYmd(_year, 1, 1).getWeek() - _start;
    if (offset < 0) {
      offset += 7;
    }
    return ((SolarUtil.getDaysInYear(_year, _month, _day) + offset) / 7.0).ceil();
  }

  @override
  String toString() => '$_year.$_month.${getIndex()}';

  String toFullString() => '$_year年$_month月第${getIndex()}周';
}
