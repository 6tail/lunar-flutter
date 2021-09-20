import '../../lunar.dart';

/// 运
/// @author 6tail
class Yun {
  /// 性别(1男，0女)
  int _gender = 0;

  /// 起运年数
  int _startYear = 0;

  /// 起运月数
  int _startMonth = 0;

  /// 是否顺推
  int _startDay = 0;

  /// 序数，0-9
  bool _forward = false;

  /// 阴历
  Lunar? _lunar;

  Yun(EightChar eightChar, int gender) {
    _lunar = eightChar.getLunar();
    _gender = gender;
    // 阳
    bool yang = 0 == _lunar!.getYearGanIndexExact() % 2;
    // 男
    bool man = 1 == gender;
    _forward = (yang && man) || (!yang && !man);
    computeStart();
  }

  void computeStart() {
    // 上节
    JieQi prev = _lunar!.getPrevJie();
    // 下节
    JieQi next = _lunar!.getNextJie();
    // 出生日期
    Solar current = _lunar!.getSolar();
    // 阳男阴女顺推，阴男阳女逆推
    Solar start = _forward ? current : prev.getSolar();
    Solar end = _forward ? next.getSolar() : current;
    int endTimeZhiIndex = (end.getHour() == 23)
        ? 11
        : LunarUtil.getTimeZhiIndex(end.toYmdHms().substring(11, 16));
    int startTimeZhiIndex = (start.getHour() == 23)
        ? 11
        : LunarUtil.getTimeZhiIndex(start.toYmdHms().substring(11, 16));
    // 时辰差
    int hourDiff = endTimeZhiIndex - startTimeZhiIndex;
    DateTime endCalendar =
        ExactDate.fromYmd(end.getYear(), end.getMonth(), end.getDay());
    DateTime startCalendar =
        ExactDate.fromYmd(start.getYear(), start.getMonth(), start.getDay());
    // 天数差
    int dayDiff = endCalendar.difference(startCalendar).inDays;
    if (hourDiff < 0) {
      hourDiff += 12;
      dayDiff--;
    }
    int monthDiff = (hourDiff * 10 / 30).floor();
    int month = dayDiff * 4 + monthDiff;
    int day = hourDiff * 10 - monthDiff * 30;
    int year = (month / 12).floor();
    month = month - year * 12;
    _startYear = year;
    _startMonth = month;
    _startDay = day;
  }

  int getGender() => _gender;

  int getStartYear() => _startYear;

  int getStartMonth() => _startMonth;

  int getStartDay() => _startDay;

  bool isForward() => _forward;

  Lunar getLunar() => _lunar!;

  Solar getStartSolar() {
    Solar birth = _lunar!.getSolar();
    int year = birth.getYear() + _startYear;
    int month = birth.getMonth() + _startMonth;
    if (month > 12) {
      month -= 12;
      year++;
    }
    int day = birth.getDay() + _startDay;
    int days = SolarUtil.getDaysOfMonth(year, month);
    if (day > days) {
      day -= days;
      month++;
      if (month > 12) {
        month -= 12;
        year++;
      }
    }
    DateTime c = ExactDate.fromYmd(year, month, day);
    return Solar.fromDate(c);
  }

  /// 获取10轮大运
  List<DaYun> getDaYun() {
    return getDaYunBy(10);
  }

  /// 获取大运
  /// [n] 轮数
  List<DaYun> getDaYunBy(int n) {
    List<DaYun> l = <DaYun>[];
    for (int i = 0; i < n; i++) {
      l.add(DaYun(this, i));
    }
    return l;
  }
}
