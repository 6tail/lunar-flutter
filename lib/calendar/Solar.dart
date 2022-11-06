import 'ExactDate.dart';
import 'Holiday.dart';
import 'Lunar.dart';
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

  DateTime? _calendar;

  Solar.fromYmd(int year, int month, int day)
      : this.fromYmdHms(year, month, day, 0, 0, 0);

  Solar.fromYmdHms(
      int year, int month, int day, int hour, int minute, int second) {
    if (year == 1582 && month == 10) {
      if (day >= 15) {
        day -= 10;
      }
    }
    _calendar = ExactDate.fromYmdHms(year, month, day, hour, minute, second);
    _year = year;
    _month = month;
    _day = day;
    _hour = hour;
    _minute = minute;
    _second = second;
  }

  Solar() : this.fromDate(DateTime.now());

  Solar.fromDate(DateTime date) {
    _calendar = ExactDate.fromDate(date);
    _year = _calendar!.year;
    _month = _calendar!.month;
    _day = _calendar!.day;
    _hour = _calendar!.hour;
    _minute = _calendar!.minute;
    _second = _calendar!.second;
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

    _calendar = ExactDate.fromYmdHms(year, month, day, hour, minute, second);
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
    Solar today = Solar();
    Lunar lunar = today.getLunar();

    int offsetYear = LunarUtil.getJiaZiIndex(lunar.getYearInGanZhiExact()) - LunarUtil.getJiaZiIndex(yearGanZhi);
    if (offsetYear < 0) {
      offsetYear = offsetYear + 60;
    }
    int startYear = lunar.getYear() - offsetYear;
    int hour = 0;
    String timeZhi = timeGanZhi.substring(1);
    for (int i = 0, j = LunarUtil.ZHI.length; i < j; i++) {
      if (LunarUtil.ZHI[i] == timeZhi) {
        hour = (i - 1) * 2;
      }
    }
    while (startYear >= baseYear) {
      int year = startYear - 1;
      int counter = 0;
      int month = 12;
      int day;
      bool found = false;
      while (counter < 15) {
        if (year >= baseYear) {
          day = 1;
          Solar solar = Solar.fromYmdHms(year, month, day, hour, 0, 0);
          lunar = solar.getLunar();
          if (lunar.getYearInGanZhiExact() == yearGanZhi && lunar.getMonthInGanZhiExact() == monthGanZhi) {
            found = true;
            break;
          }
        }
        month++;
        if (month > 12) {
          month = 1;
          year++;
        }
        counter++;
      }

      if (found) {
        counter = 0;
        month--;
        if (month < 1) {
          month = 12;
          year--;
        }
        day = 1;
        Solar solar = Solar.fromYmdHms(year, month, day, hour, 0, 0);
        while (counter < 61) {
          lunar = solar.getLunar();
          String dgz = (2 == sect) ? lunar.getDayInGanZhiExact2() : lunar.getDayInGanZhiExact();
          if (lunar.getYearInGanZhiExact() == yearGanZhi && lunar.getMonthInGanZhiExact() == monthGanZhi && dgz == dayGanZhi && lunar.getTimeInGanZhi() == timeGanZhi) {
            l.add(solar);
            break;
          }
          solar = solar.next(1);
          counter ++;
        }
      }
      startYear -= 60;
    }
    return l;
  }

  int getYear() => _year;

  int getMonth() => _month;

  int getDay() => _day;

  int getHour() => _hour;

  int getMinute() => _minute;

  int getSecond() => _second;

  DateTime getCalendar() => _calendar!;

  @override
  String toString() {
    return toYmd();
  }

  bool isLeapYear() {
    return SolarUtil.isLeapYear(_year);
  }

  /// 获取星期，0代表周日，1代表周一
  /// @return 0123456
  int getWeek() {
    int w = _calendar!.weekday;
    if (w == 7) {
      w = 0;
    }
    return w;
  }

  /// 获取星期的中文
  /// @return 日一二三四五六
  String getWeekInChinese() {
    return SolarUtil.WEEK[getWeek()];
  }

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

  /// 获取往后推几天的阳历日期，如果要往前推，则天数用负数
  /// @param days 天数
  /// @param onlyWorkday 是否仅限工作日
  /// @return 阳历日期
  Solar next(int days, [bool onlyWorkday = false]) {
    DateTime c =
        ExactDate.fromYmdHms(_year, _month, _day, _hour, _minute, _second);
    if (0 != days) {
      if (!onlyWorkday) {
        c = c.add(Duration(days: days));
      } else {
        int rest = days.abs();
        int add = days < 1 ? -1 : 1;
        while (rest > 0) {
          c = c.add(Duration(days: add));
          bool work = true;
          Holiday? holiday =
              HolidayUtil.getHolidayByYmd(c.year, c.month, c.day);
          if (null == holiday) {
            int week = c.weekday;
            if (6 == week || 7 == week) {
              work = false;
            }
          } else {
            work = holiday.isWork();
          }
          if (work) {
            rest--;
          }
        }
      }
    }
    return Solar.fromDate(c);
  }

  String toYmd() {
    int d = _day;
    if (_year == 1582 && _month == 10) {
      if (d >= 5) {
        d += 10;
      }
    }
    String y = '$_year';
    while (y.length < 4) {
      y = '0' + y;
    }
    return '$y-${_month < 10 ? '0' : ''}$_month-${d < 10 ? '0' : ''}$d';
  }

  String toYmdHms() {
    return '${toYmd()} ${_hour < 10 ? '0' : ''}$_hour:${_minute < 10 ? '0' : ''}$_minute:${_second < 10 ? '0' : ''}$_second';
  }

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

  Lunar getLunar() {
    return Lunar.fromDate(_calendar!);
  }
}
