import 'Holiday.dart';
import 'Lunar.dart';
import 'SolarMonth.dart';
import 'util/HolidayUtil.dart';
import 'util/LunarUtil.dart';
import 'util/SolarUtil.dart';

/// 阳历日期
/// @author 6tail
class Solar {
  static const double J2000 = 2451545;

  int _year = 0;

  int _month = 0;

  int _day = 0;

  int _hour = 0;

  int _minute = 0;

  int _second = 0;

  Solar.fromYmd(int year, int month, int day) : this.fromYmdHms(year, month, day, 0, 0, 0);

  Solar.fromYmdHms(int year, int month, int day, int hour, int minute, int second) {
    if (1582 == year && 10 == month) {
      if (day > 4 && day < 15) {
        throw 'wrong solar year $year month $month day $day';
      }
    }
    if (month < 1 || month > 12) {
      throw 'wrong month $month';
    }
    if (day < 1 || day > 31) {
      throw 'wrong day $day';
    }
    if (hour < 0 || hour > 23) {
      throw 'wrong hour $hour';
    }
    if (minute < 0 || minute > 59) {
      throw 'wrong minute $minute';
    }
    if (second < 0 || second > 59) {
      throw 'wrong second $second';
    }
    _year = year;
    _month = month;
    _day = day;
    _hour = hour;
    _minute = minute;
    _second = second;
  }

  Solar() : this.fromDate(DateTime.now().toLocal());

  Solar.fromDate(DateTime date) {
    _year = date.year;
    _month = date.month;
    _day = date.day;
    _hour = date.hour;
    _minute = date.minute;
    _second = date.second;
  }

  Solar.fromJulianDay(double julianDay) {
    int d = (julianDay + 0.5).floor();
    double f = julianDay + 0.5 - d;
    int c;

    if (d >= 2299161) {
      c = ((d - 1867216.25) / 36524.25).floor();
      d += 1 + c - (c * 1.0 / 4).floor();
    }
    d += 1524;
    int year = ((d - 122.1) / 365.25).floor();
    d -= (365.25 * year).floor();
    int month = (d * 1.0 / 30.601).floor();
    d -= (30.601 * month).floor();
    int day = d;
    if (month > 13) {
      month -= 13;
      year -= 4715;
    } else {
      month -= 1;
      year -= 4716;
    }
    f *= 24;
    int hour = f.floor();

    f -= hour;
    f *= 60;
    int minute = f.floor();

    f -= minute;
    f *= 60;
    int second = f.round();

    if (second > 59) {
      second -= 60;
      minute++;
    }
    if (minute > 59) {
      minute -= 60;
      hour++;
    }
    if (hour > 23) {
      hour -= 24;
      day += 1;
    }

    _year = year;
    _month = month;
    _day = day;
    _hour = hour;
    _minute = minute;
    _second = second;
  }

  static List<Solar> fromBaZi(String yearGanZhi, String monthGanZhi, String dayGanZhi, String timeGanZhi, {int sect = 2, int baseYear = 1900}) {
    sect = (1 == sect) ? 1 : 2;
    List<Solar> l = [];
    // 月地支距寅月的偏移值
    int m = LunarUtil.find(monthGanZhi.substring(1), LunarUtil.ZHI, -1) - 2;
    if (m < 0) {
      m += 12;
    }
    // 月天干要一致
    if (((LunarUtil.find(yearGanZhi.substring(0, 1), LunarUtil.GAN, -1) + 1) * 2 + m) % 10 != LunarUtil.find(monthGanZhi.substring(0, 1), LunarUtil.GAN, -1)) {
      return l;
    }
    // 1年的立春是辛酉，序号57
    int y = LunarUtil.getJiaZiIndex(yearGanZhi) - 57;
    if (y < 0) {
      y += 60;
    }
    y++;
    // 节令偏移值
    m *= 2;
    // 时辰地支转时刻，子时按零点算
    int h = LunarUtil.find(timeGanZhi.substring(1), LunarUtil.ZHI, -1) * 2;
    List<int> hours = [h];
    if (0 == h && 2 == sect) {
      hours.add(23);
    }
    int startYear = baseYear - 1;

    // 结束年
    int endYear = DateTime.now().toLocal().year;

    while (y <= endYear) {
      if (y >= startYear) {
        // 立春为寅月的开始
        // 节令推移，年干支和月干支就都匹配上了
        Solar solarTime = Lunar.fromYmd(y, 1, 1).getJieQiTable()[Lunar.JIE_QI_IN_USE[4 + m]]!;
        if (solarTime.getYear() >= baseYear) {
          // 日干支和节令干支的偏移值
          int d = LunarUtil.getJiaZiIndex(dayGanZhi) - LunarUtil.getJiaZiIndex(solarTime.getLunar().getDayInGanZhiExact2());
          if (d < 0) {
            d += 60;
          }
          if (d > 0) {
            // 从节令推移天数
            solarTime = solarTime.next(d);
          }
          for (int hour in hours) {
            int mi = 0;
            int s = 0;
            if (d == 0 && hour == solarTime.getHour()) {
              // 如果正好是节令当天，且小时和节令的小时数相等的极端情况，把分钟和秒钟带上
              mi = solarTime.getMinute();
              s = solarTime.getSecond();
            }
            // 验证一下
            Solar solar = Solar.fromYmdHms(solarTime.getYear(), solarTime.getMonth(), solarTime.getDay(), hour, mi, s);
            Lunar lunar = solar.getLunar();
            String dgz = (2 == sect) ? lunar.getDayInGanZhiExact2() : lunar.getDayInGanZhiExact();
            if (lunar.getYearInGanZhiExact() == yearGanZhi && lunar.getMonthInGanZhiExact() == monthGanZhi && dgz == dayGanZhi && lunar.getTimeInGanZhi() == timeGanZhi) {
              l.add(solar);
            }
          }
        }
      }
      y += 60;
    }
    return l;
  }

  int getYear() => _year;

  int getMonth() => _month;

  int getDay() => _day;

  int getHour() => _hour;

  int getMinute() => _minute;

  int getSecond() => _second;

  @override
  String toString() => toYmd();

  bool isLeapYear() => SolarUtil.isLeapYear(_year);

  /// 获取星期，0代表周日，1代表周一
  /// @return 0123456
  int getWeek() => ((getJulianDay() + 0.5).floor() + 7000001) % 7;

  /// 获取星期的中文
  /// @return 日一二三四五六
  String getWeekInChinese() => SolarUtil.WEEK[getWeek()];

  /// 获取星座
  /// @return 星座
  String getXingZuo() {
    int index = 11;
    int y = _month * 100 + _day;
    if (y >= 321 && y <= 419) {
      index = 0;
    } else if (y >= 420 && y <= 520) {
      index = 1;
    } else if (y >= 521 && y <= 621) {
      index = 2;
    } else if (y >= 622 && y <= 722) {
      index = 3;
    } else if (y >= 723 && y <= 822) {
      index = 4;
    } else if (y >= 823 && y <= 922) {
      index = 5;
    } else if (y >= 923 && y <= 1023) {
      index = 6;
    } else if (y >= 1024 && y <= 1122) {
      index = 7;
    } else if (y >= 1123 && y <= 1221) {
      index = 8;
    } else if (y >= 1222 || y <= 119) {
      index = 9;
    } else if (y <= 218) {
      index = 10;
    }
    return SolarUtil.XING_ZUO[index];
  }

  /// 获取儒略日
  /// @return 儒略日
  double getJulianDay() {
    int y = _year;
    int m = _month;
    double d = _day + ((_second * 1.0 / 60 + _minute) / 60 + _hour) / 24;
    int n = 0;
    bool g = false;
    if (y * 372 + m * 31 + d.floor() >= 588829) {
      g = true;
    }
    if (m <= 2) {
      m += 12;
      y--;
    }
    if (g) {
      n = (y * 1.0 / 100).floor();
      n = 2 - n + (n * 1.0 / 4).floor();
    }
    return ((365.25 * (y + 4716)).floor()) +
        ((30.6001 * (m + 1)).floor()) +
        d +
        n -
        1524.5;
  }

  /// 获取节日，有可能一天会有多个节日
  /// @return 劳动节等
  List<String> getFestivals() {
    List<String> l = <String>[];
    //获取几月几日对应的节日
    String? f = SolarUtil.FESTIVAL['$_month-$_day'];
    if (null != f) {
      l.add(f);
    }
    //计算几月第几个星期几对应的节日
    int weeks = (_day / 7.0).ceil();
    //星期几，0代表星期天
    int week = getWeek();
    f = SolarUtil.WEEK_FESTIVAL['$_month-$weeks-$week'];
    if (null != f) {
      l.add(f);
    }
    if (_day + 7 > SolarUtil.getDaysOfMonth(_year, _month)) {
      f = SolarUtil.WEEK_FESTIVAL['$_month-0-$week'];
      if (null != f) {
        l.add(f);
      }
    }
    return l;
  }

  /// 获取非正式的节日，有可能一天会有多个节日
  /// @return 非正式的节日列表，如中元节
  List<String> getOtherFestivals() {
    List<String> l = <String>[];
    List<String>? fs = SolarUtil.OTHER_FESTIVAL['$_month-$_day'];
    if (null != fs) {
      l.addAll(fs);
    }
    return l;
  }

  int subtract(Solar solar) => SolarUtil.getDaysBetween(solar.getYear(), solar.getMonth(), solar.getDay(), _year, _month, _day);

  int subtractMinute(Solar solar) {
    int days = subtract(solar);
    int cm = _hour * 60 + _minute;
    int sm = solar.getHour() * 60 + solar.getMinute();
    int m = cm - sm;
    if (m < 0) {
      m += 1440;
      days--;
    }
    m += days * 1440;
    return m;
  }

  bool isAfter(Solar solar) {
    if (_year > solar.getYear()) {
      return true;
    }
    if (_year < solar.getYear()) {
      return false;
    }
    if (_month > solar.getMonth()) {
      return true;
    }
    if (_month < solar.getMonth()) {
      return false;
    }
    if (_day > solar.getDay()) {
      return true;
    }
    if (_day < solar.getDay()) {
      return false;
    }
    if (_hour > solar.getHour()) {
      return true;
    }
    if (_hour < solar.getHour()) {
      return false;
    }
    if (_minute > solar.getMinute()) {
      return true;
    }
    if (_minute < solar.getMinute()) {
      return false;
    }
    return _second > solar.getSecond();
  }

  bool isBefore(Solar solar) {
    if (_year > solar.getYear()) {
      return false;
    }
    if (_year < solar.getYear()) {
      return true;
    }
    if (_month > solar.getMonth()) {
      return false;
    }
    if (_month < solar.getMonth()) {
      return true;
    }
    if (_day > solar.getDay()) {
      return false;
    }
    if (_day < solar.getDay()) {
      return true;
    }
    if (_hour > solar.getHour()) {
      return false;
    }
    if (_hour < solar.getHour()) {
      return true;
    }
    if (_minute > solar.getMinute()) {
      return false;
    }
    if (_minute < solar.getMinute()) {
      return true;
    }
    return _second < solar.getSecond();
  }

  Solar nextYear(int years) {
    int y = _year + years;
    int m = _month;
    int d = _day;
    if (1582 == y && 10 == m) {
      if (d > 4 && d < 15) {
        d += 10;
      }
    } else if (2 == m) {
      if (d > 28) {
        if (!SolarUtil.isLeapYear(y)) {
          d = 28;
        }
      }
    }
    return Solar.fromYmdHms(y, m, d, _hour, _minute, _second);
  }

  Solar nextMonth(int months) {
    SolarMonth month = SolarMonth.fromYm(_year, _month).next(months);
    int y = month.getYear();
    int m = month.getMonth();
    int d = _day;
    if (1582 == y && 10 == m) {
      if (d > 4 && d < 15) {
        d += 10;
      }
    }  else {
      int maxDay = SolarUtil.getDaysOfMonth(y, m);
      if (d > maxDay) {
        d = maxDay;
      }
    }
    return Solar.fromYmdHms(y, m, d, _hour, _minute, _second);
  }

  Solar nextDay(int days) {
    int y = _year;
    int m = _month;
    int d = _day;
    if (1582 == y && 10 == m) {
      if (d > 4) {
        d -= 10;
      }
    }
    if (days > 0) {
      d += days;
      int daysInMonth = SolarUtil.getDaysOfMonth(y, m);
      while (d > daysInMonth) {
        d -= daysInMonth;
        m++;
        if (m > 12) {
          m = 1;
          y++;
        }
        daysInMonth = SolarUtil.getDaysOfMonth(y, m);
      }
    } else if (days < 0) {
      while (d + days <= 0) {
        m--;
        if (m < 1) {
          m = 12;
          y--;
        }
        d += SolarUtil.getDaysOfMonth(y, m);
      }
      d += days;
    }
    if (1582 == y && 10 == m) {
      if (d > 4) {
        d += 10;
      }
    }
    return Solar.fromYmdHms(y, m, d, _hour, _minute, _second);
  }

  /// 获取往后推几天的阳历日期，如果要往前推，则天数用负数
  /// @param days 天数
  /// @param onlyWorkday 是否仅限工作日
  /// @return 阳历日期
  Solar next(int days, [bool onlyWorkday = false]) {
    if(!onlyWorkday) {
      return nextDay(days);
    }
    Solar solar = Solar.fromYmdHms(_year, _month, _day, _hour, _minute, _second);
    if (days != 0) {
      int rest = days.abs();
      int add = days < 0 ? -1 : 1;
      while (rest > 0) {
        solar = solar.nextDay(add);
        bool work = true;
        Holiday? holiday = HolidayUtil.getHolidayByYmd(solar.getYear(), solar.getMonth(), solar.getDay());
        if (null == holiday) {
          int week = solar.getWeek();
          if (0 == week || 6 == week) {
            work = false;
          }
        } else {
          work = holiday.isWork();
        }
        if (work) {
          rest -= 1;
        }
      }
    }
    return solar;
  }

  Solar nextHour(int hours) {
    int h = _hour + hours;
    int n = h < 0 ? -1 : 1;
    int hour = h.abs();
    int days = (hour / 24).floor() * n;
    hour = (hour % 24) * n;
    if (hour < 0) {
      hour += 24;
      days--;
    }
    Solar solar = next(days);
    return Solar.fromYmdHms(solar.getYear(), solar.getMonth(), solar.getDay(), hour, solar.getMinute(), solar.getSecond());
  }

  String toYmd() {
    String y = '$_year';
    while (y.length < 4) {
      y = '0' + y;
    }
    return '$y-${_month < 10 ? '0' : ''}$_month-${_day < 10 ? '0' : ''}$_day';
  }

  String toYmdHms() => '${toYmd()} ${_hour < 10 ? '0' : ''}$_hour:${_minute < 10 ? '0' : ''}$_minute:${_second < 10 ? '0' : ''}$_second';

  String toFullString() {
    String s = toYmdHms();
    if (isLeapYear()) {
      s += ' 闰年';
    }
    s += ' 星期' + getWeekInChinese();
    List<String> festivals = getFestivals();
    for (int i = 0, j = festivals.length; i < j; i++) {
      s += ' (' + festivals[i] + ')';
    }
    s += ' ' + getXingZuo() + '座';
    return s;
  }

  Lunar getLunar() => Lunar.fromSolar(this);

  int getSalaryRate() {
    // 元旦节
    if (_month == 1 && _day == 1) {
      return 3;
    }
    // 劳动节
    if (_month == 5 && _day == 1) {
      return 3;
    }
    // 国庆
    if (_month == 10 && _day >= 1 && _day <= 3) {
      return 3;
    }
    Lunar lunar = getLunar();
    // 春节
    if (lunar.getMonth() == 1 && lunar.getDay() >= 1 && lunar.getDay() <= 3) {
      return 3;
    }
    // 端午
    if (lunar.getMonth() == 5 && lunar.getDay() == 5) {
      return 3;
    }
    // 中秋
    if (lunar.getMonth() == 8 && lunar.getDay() == 15) {
      return 3;
    }
    // 清明
    if ('清明' == lunar.getJieQi()) {
      return 3;
    }
    Holiday? holiday = HolidayUtil.getHolidayByYmd(_year, _month, _day);
    if (null != holiday) {
      // 法定假日非上班
      if (!holiday.isWork()) {
        return 2;
      }
    } else {
      // 周末
      int week = getWeek();
      if (week == 6 || week == 0) {
        return 2;
      }
    }
    // 工作日
    return 1;
  }
}
