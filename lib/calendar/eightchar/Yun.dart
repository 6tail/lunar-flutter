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

  /// 起运天数
  int _startDay = 0;

  /// 起运小时数
  int _startHour = 0;

  /// 是否顺推
  bool _forward = false;

  /// 阴历
  Lunar? _lunar;

  Yun(EightChar eightChar, int gender, [int sect = 1]) {
    _lunar = eightChar.getLunar();
    _gender = gender;
    // 阳
    bool yang = 0 == _lunar!.getYearGanIndexExact() % 2;
    // 男
    bool man = 1 == gender;
    _forward = (yang && man) || (!yang && !man);
    computeStart(sect);
  }

  void computeStart(int sect) {
    // 上节
    JieQi prev = _lunar!.getPrevJie();
    // 下节
    JieQi next = _lunar!.getNextJie();
    // 出生日期
    Solar current = _lunar!.getSolar();
    // 阳男阴女顺推，阴男阳女逆推
    Solar start = _forward ? current : prev.getSolar();
    Solar end = _forward ? next.getSolar() : current;

    int year;
    int month;
    int day;
    int hour = 0;

    if (2 == sect) {
      int minutes = end.subtractMinute(start);
      year = (minutes / 4320).floor();
      minutes -= year * 4320;
      month = (minutes / 360).floor();
      minutes -= month * 360;
      day = (minutes / 12).floor();
      minutes -= day * 12;
      hour = minutes * 2;
    } else {
      int endTimeZhiIndex = (end.getHour() == 23)
          ? 11
          : LunarUtil.getTimeZhiIndex(end.toYmdHms().substring(11, 16));
      int startTimeZhiIndex = (start.getHour() == 23)
          ? 11
          : LunarUtil.getTimeZhiIndex(start.toYmdHms().substring(11, 16));
      // 时辰差
      int hourDiff = endTimeZhiIndex - startTimeZhiIndex;
      // 天数差
      int dayDiff = end.subtract(start);
      if (hourDiff < 0) {
        hourDiff += 12;
        dayDiff--;
      }
      int monthDiff = (hourDiff * 10 / 30).floor();
      month = dayDiff * 4 + monthDiff;
      day = hourDiff * 10 - monthDiff * 30;
      year = (month / 12).floor();
      month = month - year * 12;
    }
    _startYear = year;
    _startMonth = month;
    _startDay = day;
    _startHour = hour;
  }

  int getGender() => _gender;

  int getStartYear() => _startYear;

  int getStartMonth() => _startMonth;

  int getStartDay() => _startDay;

  int getStartHour() => _startHour;

  bool isForward() => _forward;

  Lunar getLunar() => _lunar!;

  Solar getStartSolar() {
    Solar solar = _lunar!.getSolar();
    solar = solar.nextYear(_startYear);
    solar = solar.nextMonth(_startMonth);
    solar = solar.nextDay(_startDay);
    return solar.nextHour(_startHour);
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
