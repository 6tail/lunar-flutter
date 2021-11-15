import 'EightChar.dart';
import 'ExactDate.dart';
import 'Foto.dart';
import 'Fu.dart';
import 'JieQi.dart';
import 'LunarMonth.dart';
import 'LunarTime.dart';
import 'LunarYear.dart';
import 'NineStar.dart';
import 'ShuJiu.dart';
import 'Solar.dart';
import 'util/LunarUtil.dart';
import 'util/SolarUtil.dart';

/// 阴历日期
/// @author 6tail
class Lunar {
  static const List<String> JIE_QI_IN_USE = [
    'DA_XUE',
    '冬至',
    '小寒',
    '大寒',
    '立春',
    '雨水',
    '惊蛰',
    '春分',
    '清明',
    '谷雨',
    '立夏',
    '小满',
    '芒种',
    '夏至',
    '小暑',
    '大暑',
    '立秋',
    '处暑',
    '白露',
    '秋分',
    '寒露',
    '霜降',
    '立冬',
    '小雪',
    '大雪',
    'DONG_ZHI',
    'XIAO_HAN',
    'DA_HAN',
    'LI_CHUN',
    'YU_SHUI',
    'JING_ZHE'
  ];

  int _year = 0;

  int _month = 0;

  int _day = 0;

  int _hour = 0;

  int _minute = 0;

  int _second = 0;

  int _timeGanIndex = 0;
  int _timeZhiIndex = 0;
  int _dayGanIndex = 0;
  int _dayZhiIndex = 0;
  int _dayGanIndexExact = 0;
  int _dayZhiIndexExact = 0;
  int _dayGanIndexExact2 = 0;
  int _dayZhiIndexExact2 = 0;
  int _monthGanIndex = 0;
  int _monthZhiIndex = 0;
  int _monthGanIndexExact = 0;
  int _monthZhiIndexExact = 0;
  int _yearGanIndex = 0;
  int _yearZhiIndex = 0;
  int _yearGanIndexByLiChun = 0;
  int _yearZhiIndexByLiChun = 0;
  int _yearGanIndexExact = 0;
  int _yearZhiIndexExact = 0;
  int _weekIndex = 0;

  Solar? _solar;

  EightChar? _eightChar;

  Map<String, Solar> _jieQi = {};

  Lunar.fromYmd(int lunarYear, int lunarMonth, int lunarDay) {
    LunarYear y = LunarYear.fromYear(lunarYear);
    LunarMonth? m = y.getMonth(lunarMonth);
    if (null == m) {
      throw 'wrong lunar year $lunarYear month $lunarMonth';
    }
    if (lunarDay < 1) {
      throw 'lunar day must bigger than 0';
    }
    int days = m.getDayCount();
    if (lunarDay > days) {
      throw 'only $days days in lunar year $lunarYear month $lunarMonth';
    }
    _year = lunarYear;
    _month = lunarMonth;
    _day = lunarDay;
    _hour = 0;
    _minute = 0;
    _second = 0;
    Solar noon = Solar.fromJulianDay(m.getFirstJulianDay() + lunarDay - 1);
    _solar = Solar.fromYmd(noon.getYear(), noon.getMonth(), noon.getDay());
    _compute(y);
  }

  Lunar.fromYmdHms(int lunarYear, int lunarMonth, int lunarDay, int hour,
      int minute, int second) {
    LunarYear y = LunarYear.fromYear(lunarYear);
    LunarMonth? m = y.getMonth(lunarMonth);
    if (null == m) {
      throw 'wrong lunar year $lunarYear month $lunarMonth';
    }
    if (lunarDay < 1) {
      throw 'lunar day must bigger than 0';
    }
    int days = m.getDayCount();
    if (lunarDay > days) {
      throw 'only $days days in lunar year $lunarYear month $lunarMonth';
    }
    _year = lunarYear;
    _month = lunarMonth;
    _day = lunarDay;
    _hour = hour;
    _minute = minute;
    _second = second;
    Solar noon = Solar.fromJulianDay(m.getFirstJulianDay() + lunarDay - 1);
    _solar = Solar.fromYmdHms(
        noon.getYear(), noon.getMonth(), noon.getDay(), hour, minute, second);
    _compute(y);
  }

  Lunar.fromDate(DateTime date) {
    _solar = Solar.fromDate(date);
    DateTime c = ExactDate.fromYmd(
        _solar!.getYear(), _solar!.getMonth(), _solar!.getDay());
    int y = _solar!.getYear();
    LunarYear ly = LunarYear.fromYear(y);
    for (LunarMonth m in ly.getMonths()) {
      // 初一
      DateTime firstDay =
          Solar.fromJulianDay(m.getFirstJulianDay()).getCalendar();
      firstDay = ExactDate.fromYmd(firstDay.year, firstDay.month, firstDay.day);
      int days = c.difference(firstDay).inDays;
      if (days < m.getDayCount()) {
        _year = m.getYear();
        _month = m.getMonth();
        _day = days + 1;
        break;
      }
    }
    _hour = _solar!.getHour();
    _minute = _solar!.getMinute();
    _second = _solar!.getSecond();
    _compute(ly);
  }

  void _computeJieQi(LunarYear lunarYear) {
    List<double> julianDays = lunarYear.getJieQiJulianDays();
    for (int i = 0, j = JIE_QI_IN_USE.length; i < j; i++) {
      _jieQi[JIE_QI_IN_USE[i]] = Solar.fromJulianDay(julianDays[i]);
    }
  }

  void _computeYear() {
    //以正月初一开始
    int offset = _year - 4;
    _yearGanIndex = offset % 10;
    _yearZhiIndex = offset % 12;

    if (_yearGanIndex < 0) {
      _yearGanIndex += 10;
    }

    if (_yearZhiIndex < 0) {
      _yearZhiIndex += 12;
    }

    //以立春作为新一年的开始的干支纪年
    int g = _yearGanIndex;
    int z = _yearZhiIndex;

    //精确的干支纪年，以立春交接时刻为准
    int gExact = _yearGanIndex;
    int zExact = _yearZhiIndex;

    int solarYear = _solar!.getYear();
    String solarYmd = _solar!.toYmd();
    String solarYmdHms = _solar!.toYmdHms();

    //获取立春的阳历时刻
    Solar liChun = _jieQi['立春']!;
    if (liChun.getYear() != solarYear) {
      liChun = _jieQi['LI_CHUN']!;
    }
    String liChunYmd = liChun.toYmd();
    String liChunYmdHms = liChun.toYmdHms();

    //阳历和阴历年份相同代表正月初一及以后
    if (_year == solarYear) {
      //立春日期判断
      if (solarYmd.compareTo(liChunYmd) < 0) {
        g--;
        z--;
      }
      //立春交接时刻判断
      if (solarYmdHms.compareTo(liChunYmdHms) < 0) {
        gExact--;
        zExact--;
      }
    } else if (_year < solarYear) {
      if (solarYmd.compareTo(liChunYmd) >= 0) {
        g++;
        z++;
      }
      if (solarYmdHms.compareTo(liChunYmdHms) >= 0) {
        gExact++;
        zExact++;
      }
    }

    _yearGanIndexByLiChun = (g < 0 ? g + 10 : g) % 10;
    _yearZhiIndexByLiChun = (z < 0 ? z + 12 : z) % 12;

    _yearGanIndexExact = (gExact < 0 ? gExact + 10 : gExact) % 10;
    _yearZhiIndexExact = (zExact < 0 ? zExact + 12 : zExact) % 12;
  }

  void _computeMonth() {
    Solar? start;
    Solar end;
    String ymd = _solar!.toYmd();
    String time = _solar!.toYmdHms();
    int size = JIE_QI_IN_USE.length;

    //序号：大雪以前-3，大雪到小寒之间-2，小寒到立春之间-1，立春之后0
    int index = -3;
    for (int i = 0; i < size; i += 2) {
      end = _jieQi[JIE_QI_IN_USE[i]]!;
      String symd = null == start ? ymd : start.toYmd();
      if (ymd.compareTo(symd) >= 0 && ymd.compareTo(end.toYmd()) < 0) {
        break;
      }
      start = end;
      index++;
    }

    //干偏移值（以立春当天起算）
    int offset =
        (((_yearGanIndexByLiChun + (index < 0 ? 1 : 0)) % 5 + 1) * 2) % 10;
    _monthGanIndex = ((index < 0 ? index + 10 : index) + offset) % 10;
    _monthZhiIndex =
        ((index < 0 ? index + 12 : index) + LunarUtil.BASE_MONTH_ZHI_INDEX) %
            12;

    start = null;
    index = -3;
    for (int i = 0; i < size; i += 2) {
      end = _jieQi[JIE_QI_IN_USE[i]]!;
      String stime = null == start ? time : start.toYmdHms();
      if (time.compareTo(stime) >= 0 && time.compareTo(end.toYmdHms()) < 0) {
        break;
      }
      start = end;
      index++;
    }

    //干偏移值（以立春交接时刻起算）
    offset = (((_yearGanIndexExact + (index < 0 ? 1 : 0)) % 5 + 1) * 2) % 10;
    _monthGanIndexExact = ((index < 0 ? index + 10 : index) + offset) % 10;
    _monthZhiIndexExact =
        ((index < 0 ? index + 12 : index) + LunarUtil.BASE_MONTH_ZHI_INDEX) %
            12;
  }

  void _computeDay() {
    Solar noon = Solar.fromYmdHms(
        _solar!.getYear(), _solar!.getMonth(), _solar!.getDay(), 12, 0, 0);
    int offset = noon.getJulianDay().floor() - 11;
    _dayGanIndex = offset % 10;
    _dayZhiIndex = offset % 12;

    int dayGanExact = _dayGanIndex;
    int dayZhiExact = _dayZhiIndex;

    // 八字流派2，晚子时（夜子/子夜）日柱算当天
    _dayGanIndexExact2 = dayGanExact;
    _dayZhiIndexExact2 = dayZhiExact;

    // 八字流派1，晚子时（夜子/子夜）日柱算明天
    String hm = (_hour < 10 ? '0' : '') +
        _hour.toString() +
        ':' +
        (_minute < 10 ? '0' : '') +
        _minute.toString();
    if (hm.compareTo('23:00') >= 0 && hm.compareTo('23:59') <= 0) {
      dayGanExact++;
      if (dayGanExact >= 10) {
        dayGanExact -= 10;
      }
      dayZhiExact++;
      if (dayZhiExact >= 12) {
        dayZhiExact -= 12;
      }
    }

    _dayGanIndexExact = dayGanExact;
    _dayZhiIndexExact = dayZhiExact;
  }

  void _computeTime() {
    String hm = (_hour < 10 ? '0' : '') +
        _hour.toString() +
        ':' +
        (_minute < 10 ? '0' : '') +
        _minute.toString();
    _timeZhiIndex = LunarUtil.getTimeZhiIndex(hm);
    _timeGanIndex = (_dayGanIndexExact % 5 * 2 + _timeZhiIndex) % 10;
  }

  void _computeWeek() {
    _weekIndex = _solar!.getWeek();
  }

  void _compute(LunarYear lunarYear) {
    _computeJieQi(lunarYear);
    _computeYear();
    _computeMonth();
    _computeDay();
    _computeTime();
    _computeWeek();
  }

  int getYear() => _year;

  int getMonth() => _month;

  int getDay() => _day;

  int getHour() => _hour;

  int getMinute() => _minute;

  int getSecond() => _second;

  String getGan() => getYearGan();

  String getYearGan() => LunarUtil.GAN[_yearGanIndex + 1];

  String getYearGanByLiChun() => LunarUtil.GAN[_yearGanIndexByLiChun + 1];

  String getYearGanExact() => LunarUtil.GAN[_yearGanIndexExact + 1];

  String getZhi() => getYearZhi();

  String getYearZhi() => LunarUtil.ZHI[_yearZhiIndex + 1];

  String getYearZhiByLiChun() => LunarUtil.ZHI[_yearZhiIndexByLiChun + 1];

  String getYearZhiExact() => LunarUtil.ZHI[_yearZhiIndexExact + 1];

  String getYearInGanZhi() => '${getYearGan()}${getYearZhi()}';

  String getYearInGanZhiByLiChun() =>
      '${getYearGanByLiChun()}${getYearZhiByLiChun()}';

  String getYearInGanZhiExact() => '${getYearGanExact()}${getYearZhiExact()}';

  String getMonthInGanZhi() => '${getMonthGan()}${getMonthZhi()}';

  String getMonthInGanZhiExact() =>
      '${getMonthGanExact()}${getMonthZhiExact()}';

  String getMonthGan() => LunarUtil.GAN[_monthGanIndex + 1];

  String getMonthGanExact() => LunarUtil.GAN[_monthGanIndexExact + 1];

  String getMonthZhi() => LunarUtil.ZHI[_monthZhiIndex + 1];

  String getMonthZhiExact() => LunarUtil.ZHI[_monthZhiIndexExact + 1];

  String getDayInGanZhi() => '${getDayGan()}${getDayZhi()}';

  String getDayInGanZhiExact() => '${getDayGanExact()}${getDayZhiExact()}';

  String getDayInGanZhiExact2() => '${getDayGanExact2()}${getDayZhiExact2()}';

  String getDayGan() => LunarUtil.GAN[_dayGanIndex + 1];

  String getDayGanExact() => LunarUtil.GAN[_dayGanIndexExact + 1];

  String getDayGanExact2() => LunarUtil.GAN[_dayGanIndexExact2 + 1];

  String getDayZhi() => LunarUtil.ZHI[_dayZhiIndex + 1];

  String getDayZhiExact() => LunarUtil.ZHI[_dayZhiIndexExact + 1];

  String getDayZhiExact2() => LunarUtil.ZHI[_dayZhiIndexExact2 + 1];

  @deprecated
  String getShengxiao() => getYearShengXiao();

  String getYearShengXiao() => LunarUtil.SHENGXIAO[_yearZhiIndex + 1];

  String getYearShengXiaoByLiChun() =>
      LunarUtil.SHENGXIAO[_yearZhiIndexByLiChun + 1];

  String getYearShengXiaoExact() => LunarUtil.SHENGXIAO[_yearZhiIndexExact + 1];

  String getMonthShengXiao() => LunarUtil.SHENGXIAO[_monthZhiIndex + 1];

  String getDayShengXiao() => LunarUtil.SHENGXIAO[_dayZhiIndex + 1];

  String getTimeShengXiao() => LunarUtil.SHENGXIAO[_timeZhiIndex + 1];

  String getYearInChinese() {
    String y = _year.toString();
    String s = '';
    for (int i = 0, j = y.length; i < j; i++) {
      s += LunarUtil.NUMBER[y.codeUnitAt(i) - 48];
    }
    return s;
  }

  String getMonthInChinese() =>
      (_month < 0 ? '闰' : '') + LunarUtil.MONTH[_month.abs()];

  String getDayInChinese() => LunarUtil.DAY[_day];

  String getTimeZhi() => LunarUtil.ZHI[_timeZhiIndex + 1];

  String getTimeGan() => LunarUtil.GAN[_timeGanIndex + 1];

  String getTimeInGanZhi() => '${getTimeGan()}${getTimeZhi()}';

  String getSeason() => LunarUtil.SEASON[_month.abs()];

  String _convertJieQi(String name) {
    String jq = name;
    if ('DONG_ZHI' == jq) {
      jq = '冬至';
    } else if ('DA_HAN' == jq) {
      jq = '大寒';
    } else if ('XIAO_HAN' == jq) {
      jq = '小寒';
    } else if ('LI_CHUN' == jq) {
      jq = '立春';
    } else if ('DA_XUE' == jq) {
      jq = '大雪';
    } else if ('YU_SHUI' == jq) {
      jq = '雨水';
    } else if ('JING_ZHE' == jq) {
      jq = '惊蛰';
    }
    return jq;
  }

  String getJie() {
    String jie = '';
    for (int i = 1, j = JieQi.JIE_QI.length; i < j; i += 2) {
      String key = JieQi.JIE_QI[i];
      Solar? d = _jieQi[key];
      if (d!.getYear() == _solar!.getYear() &&
          d.getMonth() == _solar!.getMonth() &&
          d.getDay() == _solar!.getDay()) {
        jie = key;
        break;
      }
    }
    return _convertJieQi(jie);
  }

  String getQi() {
    String qi = '';
    for (int i = 0, j = JieQi.JIE_QI.length; i < j; i += 2) {
      String key = JieQi.JIE_QI[i];
      Solar? d = _jieQi[key];
      if (d!.getYear() == _solar!.getYear() &&
          d.getMonth() == _solar!.getMonth() &&
          d.getDay() == _solar!.getDay()) {
        qi = key;
        break;
      }
    }
    return _convertJieQi(qi);
  }

  int getWeek() => _weekIndex;

  String getWeekInChinese() => SolarUtil.WEEK[getWeek()];

  String getXiu() => LunarUtil.XIU['${getDayZhi()}${getWeek()}']!;

  String getXiuLuck() => LunarUtil.XIU_LUCK[getXiu()]!;

  String getXiuSong() => LunarUtil.XIU_SONG[getXiu()]!;

  String getZheng() => LunarUtil.ZHENG[getXiu()]!;

  String getAnimal() => LunarUtil.ANIMAL[getXiu()]!;

  String getGong() => LunarUtil.GONG[getXiu()]!;

  String getShou() => LunarUtil.SHOU[getGong()]!;

  List<String> getFestivals() {
    List<String> l = <String>[];
    String? f = LunarUtil.FESTIVAL['$_month-$_day'];
    if (null != f) {
      l.add(f);
    }
    if (_month.abs() == 12 && _day >= 29 && _year != next(1).getYear()) {
      l.add('除夕');
    }
    return l;
  }

  List<String> getOtherFestivals() {
    List<String> l = <String>[];
    List<String>? fs = LunarUtil.OTHER_FESTIVAL['$_month-$_day'];
    if (null != fs) {
      l.addAll(fs);
    }
    if (_solar!.toYmd() == _jieQi['清明']!.next(-1).toYmd()) {
      l.add('寒食节');
    }
    return l;
  }

  String getPengZuGan() => LunarUtil.PENGZU_GAN[_dayGanIndex + 1];

  String getPengZuZhi() => LunarUtil.PENGZU_ZHI[_dayZhiIndex + 1];

  String getPositionXi() => getDayPositionXi();

  String getPositionXiDesc() => getDayPositionXiDesc();

  String getPositionYangGui() => getDayPositionYangGui();

  String getPositionYangGuiDesc() => getDayPositionYangGuiDesc();

  String getPositionYinGui() => getDayPositionYinGui();

  String getPositionYinGuiDesc() => getDayPositionYinGuiDesc();

  String getPositionFu() => getDayPositionFu();

  String getPositionFuDesc() => getDayPositionFuDesc();

  String getPositionCai() => getDayPositionCai();

  String getPositionCaiDesc() => getDayPositionCaiDesc();

  String getDayPositionXi() => LunarUtil.POSITION_XI[_dayGanIndex + 1];

  String getDayPositionXiDesc() => LunarUtil.POSITION_DESC[getDayPositionXi()]!;

  String getDayPositionYangGui() =>
      LunarUtil.POSITION_YANG_GUI[_dayGanIndex + 1];

  String getDayPositionYangGuiDesc() =>
      LunarUtil.POSITION_DESC[getDayPositionYangGui()]!;

  String getDayPositionYinGui() => LunarUtil.POSITION_YIN_GUI[_dayGanIndex + 1];

  String getDayPositionYinGuiDesc() =>
      LunarUtil.POSITION_DESC[getDayPositionYinGui()]!;

  String getDayPositionFu([int sect = 2]) => (1 == sect
      ? LunarUtil.POSITION_FU
      : LunarUtil.POSITION_FU_2)[_dayGanIndex + 1];

  String getDayPositionFuDesc([int sect = 2]) =>
      LunarUtil.POSITION_DESC[getDayPositionFu(sect)]!;

  String getDayPositionCai() => LunarUtil.POSITION_CAI[_dayGanIndex + 1];

  String getDayPositionCaiDesc() =>
      LunarUtil.POSITION_DESC[getDayPositionCai()]!;

  String getTimePositionXi() => LunarUtil.POSITION_XI[_timeGanIndex + 1];

  String getTimePositionXiDesc() =>
      LunarUtil.POSITION_DESC[getTimePositionXi()]!;

  String getTimePositionYangGui() =>
      LunarUtil.POSITION_YANG_GUI[_timeGanIndex + 1];

  String getTimePositionYangGuiDesc() =>
      LunarUtil.POSITION_DESC[getTimePositionYangGui()]!;

  String getTimePositionYinGui() =>
      LunarUtil.POSITION_YIN_GUI[_timeGanIndex + 1];

  String getTimePositionYinGuiDesc() =>
      LunarUtil.POSITION_DESC[getTimePositionYinGui()]!;

  String getTimePositionFu([int sect = 2]) => (1 == sect
      ? LunarUtil.POSITION_FU
      : LunarUtil.POSITION_FU_2)[_timeGanIndex + 1];

  String getTimePositionFuDesc([int sect = 2]) =>
      LunarUtil.POSITION_DESC[getTimePositionFu(sect)]!;

  String getTimePositionCai() => LunarUtil.POSITION_CAI[_timeGanIndex + 1];

  String getTimePositionCaiDesc() =>
      LunarUtil.POSITION_DESC[getTimePositionCai()]!;

  @deprecated
  String getChong() => getDayChong();

  @deprecated
  String getChongGan() => getDayChongGan();

  @deprecated
  String getChongGanTie() => getDayChongGanTie();

  @deprecated
  String getChongShengXiao() => getDayChongShengXiao();

  @deprecated
  String getChongDesc() => getDayChongDesc();

  @deprecated
  String getSha() => getDaySha();

  String getYearNaYin() => LunarUtil.NAYIN[getYearInGanZhi()]!;

  String getMonthNaYin() => LunarUtil.NAYIN[getMonthInGanZhi()]!;

  String getDayNaYin() => LunarUtil.NAYIN[getDayInGanZhi()]!;

  String getTimeNaYin() => LunarUtil.NAYIN[getTimeInGanZhi()]!;

  List<String> getBaZi() {
    List<String> l = <String>[];
    EightChar eightChar = getEightChar();
    l.add(eightChar.getYear());
    l.add(eightChar.getMonth());
    l.add(eightChar.getDay());
    l.add(eightChar.getTime());
    return l;
  }

  List<String> getBaZiWuXing() {
    List<String> l = <String>[];
    EightChar eightChar = getEightChar();
    l.add(eightChar.getYearWuXing());
    l.add(eightChar.getMonthWuXing());
    l.add(eightChar.getDayWuXing());
    l.add(eightChar.getTimeWuXing());
    return l;
  }

  List<String> getBaZiNaYin() {
    List<String> l = <String>[];
    EightChar eightChar = getEightChar();
    l.add(eightChar.getYearNaYin());
    l.add(eightChar.getMonthNaYin());
    l.add(eightChar.getDayNaYin());
    l.add(eightChar.getTimeNaYin());
    return l;
  }

  List<String> getBaZiShiShenGan() {
    List<String> l = <String>[];
    EightChar eightChar = getEightChar();
    l.add(eightChar.getYearShiShenGan());
    l.add(eightChar.getMonthShiShenGan());
    l.add(eightChar.getDayShiShenGan());
    l.add(eightChar.getTimeShiShenGan());
    return l;
  }

  List<String> getBaZiShiShenZhi() {
    List<String> l = <String>[];
    EightChar eightChar = getEightChar();
    l.add(eightChar.getYearShiShenZhi()[0]);
    l.add(eightChar.getMonthShiShenZhi()[0]);
    l.add(eightChar.getDayShiShenZhi()[0]);
    l.add(eightChar.getTimeShiShenZhi()[0]);
    return l;
  }

  List<String> getBaZiShiShenYearZhi() => getEightChar().getYearShiShenZhi();

  List<String> getBaZiShiShenMonthZhi() => getEightChar().getMonthShiShenZhi();

  List<String> getBaZiShiShenDayZhi() => getEightChar().getDayShiShenZhi();

  List<String> getBaZiShiShenTimeZhi() => getEightChar().getTimeShiShenZhi();

  String getZhiXing() {
    int offset = _dayZhiIndex - _monthZhiIndex;
    if (offset < 0) {
      offset += 12;
    }
    return LunarUtil.ZHI_XING[offset + 1];
  }

  String getDayTianShen() {
    String monthZhi = getMonthZhi();
    int offset = LunarUtil.ZHI_TIAN_SHEN_OFFSET[monthZhi]!;
    return LunarUtil.TIAN_SHEN[(_dayZhiIndex + offset) % 12 + 1];
  }

  String getTimeTianShen() {
    String dayZhi = getDayZhiExact();
    int offset = LunarUtil.ZHI_TIAN_SHEN_OFFSET[dayZhi]!;
    return LunarUtil.TIAN_SHEN[(_timeZhiIndex + offset) % 12 + 1];
  }

  String getDayTianShenType() => LunarUtil.TIAN_SHEN_TYPE[getDayTianShen()]!;

  String getTimeTianShenType() => LunarUtil.TIAN_SHEN_TYPE[getTimeTianShen()]!;

  String getDayTianShenLuck() =>
      LunarUtil.TIAN_SHEN_TYPE_LUCK[getDayTianShenType()]!;

  String getTimeTianShenLuck() =>
      LunarUtil.TIAN_SHEN_TYPE_LUCK[getTimeTianShenType()]!;

  String getDayPositionTai() {
    return LunarUtil
        .POSITION_TAI_DAY[LunarUtil.getJiaZiIndex(getDayInGanZhi())];
  }

  String getMonthPositionTai() =>
      _month < 0 ? '' : LunarUtil.POSITION_TAI_MONTH[_month - 1];

  List<String> getDayYi() =>
      LunarUtil.getDayYi(getMonthInGanZhiExact(), getDayInGanZhi());

  List<String> getDayJi() =>
      LunarUtil.getDayJi(getMonthInGanZhiExact(), getDayInGanZhi());

  List<String> getDayJiShen() =>
      LunarUtil.getDayJiShen(getMonth(), getDayInGanZhi());

  List<String> getDayXiongSha() =>
      LunarUtil.getDayXiongSha(getMonth(), getDayInGanZhi());

  String getDayChong() => LunarUtil.CHONG[_dayZhiIndex + 1];

  String getDaySha() => LunarUtil.SHA[getDayZhi()]!;

  String getDayChongDesc() =>
      '(${getDayChongGan()}${getDayChong()})${getDayChongShengXiao()}';

  String getDayChongShengXiao() {
    String chong = getDayChong();
    for (int i = 0, j = LunarUtil.ZHI.length; i < j; i++) {
      if (LunarUtil.ZHI[i] == chong) {
        return LunarUtil.SHENGXIAO[i];
      }
    }
    return '';
  }

  String getDayChongGan() => LunarUtil.CHONG_GAN[_dayGanIndex + 1];

  String getDayChongGanTie() => LunarUtil.CHONG_GAN_TIE[_dayGanIndex + 1];

  String getTimeChong() => LunarUtil.CHONG[_timeZhiIndex + 1];

  String getTimeSha() => LunarUtil.SHA[getTimeZhi()]!;

  String getTimeChongShengXiao() {
    String chong = getTimeChong();
    for (int i = 0, j = LunarUtil.ZHI.length; i < j; i++) {
      if (LunarUtil.ZHI[i] == chong) {
        return LunarUtil.SHENGXIAO[i];
      }
    }
    return '';
  }

  String getTimeChongDesc() =>
      '(${getTimeChongGan()}${getTimeChong()})${getTimeChongShengXiao()}';

  String getTimeChongGan() => LunarUtil.CHONG_GAN[_timeGanIndex + 1];

  String getTimeChongGanTie() => LunarUtil.CHONG_GAN_TIE[_timeGanIndex + 1];

  List<String> getTimeYi() =>
      LunarUtil.getTimeYi(getDayInGanZhiExact(), getTimeInGanZhi());

  List<String> getTimeJi() =>
      LunarUtil.getTimeJi(getDayInGanZhiExact(), getTimeInGanZhi());

  String getYueXiang() => LunarUtil.YUE_XIANG[_day];

  NineStar getYearNineStar() {
    int index = -(_year - 1900) % 9;
    if (index < 0) {
      index += 9;
    }
    return new NineStar(index);
  }

  NineStar getMonthNineStar() {
    int start = 2;
    String yearZhi = getYearZhi();
    if ('子午卯酉'.contains(yearZhi)) {
      start = 8;
    } else if ('辰戌丑未'.contains(yearZhi)) {
      start = 5;
    }
    // 寅月起，所以需要-2
    int monthIndex = _monthZhiIndex - 2;
    if (monthIndex < 0) {
      monthIndex += 12;
    }
    int index = start - monthIndex - 1;
    while (index < 0) {
      index += 9;
    }
    return new NineStar(index);
  }

  NineStar getDayNineStar() {
    //顺逆
    String solarYmd = _solar!.toYmd();
    String dongZhi = _jieQi['冬至']!.toYmd();
    String yuShui = _jieQi['雨水']!.toYmd();
    String guYu = _jieQi['谷雨']!.toYmd();
    String xiaZhi = _jieQi['夏至']!.toYmd();
    String chuShu = _jieQi['处暑']!.toYmd();
    String shuangJiang = _jieQi['霜降']!.toYmd();

    int start = 6;
    bool asc = false;
    if (solarYmd.compareTo(dongZhi) >= 0 && solarYmd.compareTo(yuShui) < 0) {
      asc = true;
      start = 1;
    } else if (solarYmd.compareTo(yuShui) >= 0 &&
        solarYmd.compareTo(guYu) < 0) {
      asc = true;
      start = 7;
    } else if (solarYmd.compareTo(guYu) >= 0 &&
        solarYmd.compareTo(xiaZhi) < 0) {
      asc = true;
      start = 4;
    } else if (solarYmd.compareTo(xiaZhi) >= 0 &&
        solarYmd.compareTo(chuShu) < 0) {
      start = 9;
    } else if (solarYmd.compareTo(chuShu) >= 0 &&
        solarYmd.compareTo(shuangJiang) < 0) {
      start = 3;
    }
    int ganZhiIndex = LunarUtil.getJiaZiIndex(getDayInGanZhi()) % 9;
    int index = asc ? start + ganZhiIndex - 1 : start - ganZhiIndex - 1;
    if (index > 8) {
      index -= 9;
    }
    if (index < 0) {
      index += 9;
    }
    return NineStar(index);
  }

  NineStar getTimeNineStar() {
    //顺逆
    String solarYmd = _solar!.toYmd();
    bool asc = false;
    if (solarYmd.compareTo(_jieQi['冬至']!.toYmd()) >= 0 &&
        solarYmd.compareTo(_jieQi['夏至']!.toYmd()) < 0) {
      asc = true;
    }
    int start = asc ? 7 : 3;
    String dayZhi = getDayZhi();
    if ('子午卯酉'.contains(dayZhi)) {
      start = asc ? 1 : 9;
    } else if ('辰戌丑未'.contains(dayZhi)) {
      start = asc ? 4 : 6;
    }
    int index = asc ? start + _timeZhiIndex - 1 : start - _timeZhiIndex - 1;
    if (index > 8) {
      index -= 9;
    }
    if (index < 0) {
      index += 9;
    }
    return NineStar(index);
  }

  Map<String, Solar> getJieQiTable() {
    return _jieQi;
  }

  JieQi getNextJie() {
    int l = (JIE_QI_IN_USE.length / 2).floor();
    List<String> conditions = <String>[];
    for (int i = 0; i < l; i++) {
      conditions.add(JIE_QI_IN_USE[i * 2]);
    }
    return _getNearJieQi(true, conditions)!;
  }

  JieQi getPrevJie() {
    int l = (JIE_QI_IN_USE.length / 2).floor();
    List<String> conditions = <String>[];
    for (int i = 0; i < l; i++) {
      conditions.add(JIE_QI_IN_USE[i * 2]);
    }
    return _getNearJieQi(false, conditions)!;
  }

  JieQi getNextQi() {
    int l = (JIE_QI_IN_USE.length / 2).floor();
    List<String> conditions = <String>[];
    for (int i = 0; i < l; i++) {
      conditions.add(JIE_QI_IN_USE[i * 2 + 1]);
    }
    return _getNearJieQi(true, conditions)!;
  }

  JieQi getPrevQi() {
    int l = (JIE_QI_IN_USE.length / 2).floor();
    List<String> conditions = <String>[];
    for (int i = 0; i < l; i++) {
      conditions.add(JIE_QI_IN_USE[i * 2 + 1]);
    }
    return _getNearJieQi(false, conditions)!;
  }

  JieQi getNextJieQi() => _getNearJieQi(true, null)!;

  JieQi getPrevJieQi() => _getNearJieQi(false, null)!;

  JieQi? _getNearJieQi(bool forward, List<String>? conditions) {
    String? name;
    Solar? near;
    Set<String> filters = new Set<String>();
    if (null != conditions) {
      filters.addAll(conditions);
    }
    bool filter = filters.isNotEmpty;
    String today = _solar!.toYmdHms();
    for (MapEntry<String, Solar> entry in _jieQi.entries) {
      String jq = _convertJieQi(entry.key);
      if (filter) {
        if (!filters.contains(jq)) {
          continue;
        }
      }
      Solar solar = entry.value;
      String day = solar.toYmdHms();
      if (forward) {
        if (day.compareTo(today) < 0) {
          continue;
        }
        if (null == near || day.compareTo(near.toYmdHms()) < 0) {
          name = jq;
          near = solar;
        }
      } else {
        if (day.compareTo(today) > 0) {
          continue;
        }
        if (null == near || day.compareTo(near.toYmdHms()) > 0) {
          name = jq;
          near = solar;
        }
      }
    }
    if (null == near) {
      return null;
    }
    return JieQi(name!, near);
  }

  String getJieQi() {
    String name = '';
    for (MapEntry<String, Solar> jq in _jieQi.entries) {
      Solar d = jq.value;
      if (d.getYear() == _solar!.getYear() &&
          d.getMonth() == _solar!.getMonth() &&
          d.getDay() == _solar!.getDay()) {
        name = jq.key;
        break;
      }
    }
    return _convertJieQi(name);
  }

  JieQi? getCurrentJieQi() {
    String name = getJieQi();
    return name.length > 0 ? new JieQi(name, _solar!) : null;
  }

  JieQi? getCurrentJie() {
    String name = getJie();
    return name.length > 0 ? new JieQi(name, _solar!) : null;
  }

  JieQi? getCurrentQi() {
    String name = getQi();
    return name.length > 0 ? JieQi(name, _solar!) : null;
  }

  String toFullString() {
    String s = '';
    s += toString();
    s += ' ';
    s += getYearInGanZhi();
    s += '(';
    s += getYearShengXiao();
    s += ')年 ';
    s += getMonthInGanZhi();
    s += '(';
    s += getMonthShengXiao();
    s += ')月 ';
    s += getDayInGanZhi();
    s += '(';
    s += getDayShengXiao();
    s += ')日 ';
    s += getTimeZhi();
    s += '(';
    s += getTimeShengXiao();
    s += ')时 纳音[';
    s += getYearNaYin();
    s += ' ';
    s += getMonthNaYin();
    s += ' ';
    s += getDayNaYin();
    s += ' ';
    s += getTimeNaYin();
    s += '] 星期';
    s += getWeekInChinese();
    for (String f in getFestivals()) {
      s += ' (';
      s += f;
      s += ')';
    }
    for (String f in getOtherFestivals()) {
      s += ' (';
      s += f;
      s += ')';
    }
    String jq = getJieQi();
    if (jq.length > 0) {
      s += ' [';
      s += jq;
      s += ']';
    }
    s += ' ';
    s += getGong();
    s += '方';
    s += getShou();
    s += ' 星宿[';
    s += getXiu();
    s += getZheng();
    s += getAnimal();
    s += '](';
    s += getXiuLuck();
    s += ') 彭祖百忌[';
    s += getPengZuGan();
    s += ' ';
    s += getPengZuZhi();
    s += '] 喜神方位[';
    s += getDayPositionXi();
    s += '](';
    s += getDayPositionXiDesc();
    s += ') 阳贵神方位[';
    s += getDayPositionYangGui();
    s += '](';
    s += getDayPositionYangGuiDesc();
    s += ') 阴贵神方位[';
    s += getDayPositionYinGui();
    s += '](';
    s += getDayPositionYinGuiDesc();
    s += ') 福神方位[';
    s += getDayPositionFu();
    s += '](';
    s += getDayPositionFuDesc();
    s += ') 财神方位[';
    s += getDayPositionCai();
    s += '](';
    s += getDayPositionCaiDesc();
    s += ') 冲[';
    s += getDayChongDesc();
    s += '] 煞[';
    s += getDaySha();
    s += ']';
    return s;
  }

  @override
  String toString() =>
      '${getYearInChinese()}年${getMonthInChinese()}月${getDayInChinese()}';

  int getTimeGanIndex() => _timeGanIndex;

  int getTimeZhiIndex() => _timeZhiIndex;

  int getDayGanIndex() => _dayGanIndex;

  int getDayZhiIndex() => _dayZhiIndex;

  int getMonthGanIndex() => _monthGanIndex;

  int getMonthZhiIndex() => _monthZhiIndex;

  int getYearGanIndex() => _yearGanIndex;

  int getYearZhiIndex() => _yearZhiIndex;

  int getYearGanIndexByLiChun() => _yearGanIndexByLiChun;

  int getYearZhiIndexByLiChun() => _yearZhiIndexByLiChun;

  int getDayGanIndexExact() => _dayGanIndexExact;

  int getDayGanIndexExact2() => _dayGanIndexExact2;

  int getDayZhiIndexExact() => _dayZhiIndexExact;

  int getDayZhiIndexExact2() => _dayZhiIndexExact2;

  int getMonthGanIndexExact() => _monthGanIndexExact;

  int getMonthZhiIndexExact() => _monthZhiIndexExact;

  int getYearGanIndexExact() => _yearGanIndexExact;

  int getYearZhiIndexExact() => _yearZhiIndexExact;

  Solar getSolar() => _solar!;

  EightChar getEightChar() {
    if (null == _eightChar) {
      _eightChar = new EightChar(this);
    }
    return _eightChar!;
  }

  Lunar next(int days) => _solar!.next(days).getLunar();

  String getYearXun() => LunarUtil.getXun(getYearInGanZhi());

  String getYearXunByLiChun() => LunarUtil.getXun(getYearInGanZhiByLiChun());

  String getYearXunExact() => LunarUtil.getXun(getYearInGanZhiExact());

  String getYearXunKong() => LunarUtil.getXunKong(getYearInGanZhi());

  String getYearXunKongByLiChun() =>
      LunarUtil.getXunKong(getYearInGanZhiByLiChun());

  String getYearXunKongExact() => LunarUtil.getXunKong(getYearInGanZhiExact());

  String getMonthXun() => LunarUtil.getXun(getMonthInGanZhi());

  String getMonthXunExact() => LunarUtil.getXun(getMonthInGanZhiExact());

  String getMonthXunKong() => LunarUtil.getXunKong(getMonthInGanZhi());

  String getMonthXunKongExact() =>
      LunarUtil.getXunKong(getMonthInGanZhiExact());

  String getDayXun() => LunarUtil.getXun(getDayInGanZhi());

  String getDayXunExact() => LunarUtil.getXun(getDayInGanZhiExact());

  String getDayXunExact2() => LunarUtil.getXun(getDayInGanZhiExact2());

  String getDayXunKong() => LunarUtil.getXunKong(getDayInGanZhi());

  String getDayXunKongExact() => LunarUtil.getXunKong(getDayInGanZhiExact());

  String getDayXunKongExact2() => LunarUtil.getXunKong(getDayInGanZhiExact2());

  String getTimeXun() => LunarUtil.getXun(getTimeInGanZhi());

  String getTimeXunKong() => LunarUtil.getXunKong(getTimeInGanZhi());

  ShuJiu? getShuJiu() {
    DateTime currentCalendar = ExactDate.fromYmd(
        _solar!.getYear(), _solar!.getMonth(), _solar!.getDay());
    Solar start = _jieQi['DONG_ZHI']!;
    DateTime startCalendar =
        ExactDate.fromYmd(start.getYear(), start.getMonth(), start.getDay());

    if (currentCalendar.compareTo(startCalendar) < 0) {
      start = _jieQi['冬至']!;
      startCalendar =
          ExactDate.fromYmd(start.getYear(), start.getMonth(), start.getDay());
    }

    DateTime endCalendar =
        ExactDate.fromYmd(start.getYear(), start.getMonth(), start.getDay());
    endCalendar = endCalendar.add(Duration(days: 81));

    if (currentCalendar.compareTo(startCalendar) < 0 ||
        currentCalendar.compareTo(endCalendar) >= 0) {
      return null;
    }

    int days = currentCalendar.difference(startCalendar).inDays;
    return ShuJiu(LunarUtil.NUMBER[(days / 9).floor() + 1] + '九', days % 9 + 1);
  }

  Fu? getFu() {
    DateTime currentCalendar = ExactDate.fromYmd(
        _solar!.getYear(), _solar!.getMonth(), _solar!.getDay());
    Solar xiaZhi = _jieQi['夏至']!;
    Solar liQiu = _jieQi['立秋']!;
    DateTime startCalendar =
        ExactDate.fromYmd(xiaZhi.getYear(), xiaZhi.getMonth(), xiaZhi.getDay());
    // 第1个庚日
    int add = 6 - xiaZhi.getLunar().getDayGanIndex();
    if (add < 0) {
      add += 10;
    }
    // 第3个庚日，即初伏第1天
    add += 20;
    startCalendar = startCalendar.add(Duration(days: add));

    // 初伏以前
    if (currentCalendar.compareTo(startCalendar) < 0) {
      return null;
    }

    int days = currentCalendar.difference(startCalendar).inDays;
    if (days < 10) {
      return new Fu('初伏', days + 1);
    }

    // 第4个庚日，中伏第1天
    startCalendar = startCalendar.add(Duration(days: 10));

    days = currentCalendar.difference(startCalendar).inDays;
    if (days < 10) {
      return new Fu('中伏', days + 1);
    }

    // 第5个庚日，中伏第11天或末伏第1天
    startCalendar = startCalendar.add(Duration(days: 10));

    DateTime liQiuCalendar =
        ExactDate.fromYmd(liQiu.getYear(), liQiu.getMonth(), liQiu.getDay());
    days = currentCalendar.difference(startCalendar).inDays;
    // 末伏
    if (liQiuCalendar.compareTo(startCalendar) <= 0) {
      if (days < 10) {
        return Fu('末伏', days + 1);
      }
    } else {
      // 中伏
      if (days < 10) {
        return Fu('中伏', days + 11);
      }
      // 末伏第1天
      startCalendar = startCalendar.add(Duration(days: 10));
      days = currentCalendar.difference(startCalendar).inDays;
      if (days < 10) {
        return Fu('末伏', days + 1);
      }
    }
    return null;
  }

  String getLiuYao() => LunarUtil.LIU_YAO[(_month.abs() - 1 + _day - 1) % 6];

  String getWuHou() {
    JieQi jieQi = getPrevJieQi();
    String? name = jieQi.getName();
    int offset = 0;
    for (int i = 0, j = JieQi.JIE_QI.length; i < j; i++) {
      if (name == JieQi.JIE_QI[i]) {
        offset = i;
        break;
      }
    }
    DateTime currentCalendar = ExactDate.fromYmd(
        _solar!.getYear(), _solar!.getMonth(), _solar!.getDay());

    Solar startSolar = jieQi.getSolar();
    DateTime startCalendar = ExactDate.fromYmd(
        startSolar.getYear(), startSolar.getMonth(), startSolar.getDay());

    int days = currentCalendar.difference(startCalendar).inDays;
    return LunarUtil
        .WU_HOU[(offset * 3 + (days / 5).floor()) % LunarUtil.WU_HOU.length];
  }

  String getDayLu() {
    String gan = LunarUtil.LU[getDayGan()]!;
    String? zhi = LunarUtil.LU[getDayZhi()];
    String lu = gan + '命互禄';
    if (null != zhi) {
      lu += ' ' + zhi + '命进禄';
    }
    return lu;
  }

  LunarTime getTime() {
    return LunarTime.fromYmdHms(_year, _month, _day, _hour, _minute, _second);
  }

  List<LunarTime> getTimes() {
    List<LunarTime> l = <LunarTime>[];
    l.add(LunarTime.fromYmdHms(_year, _month, _day, 0, 0, 0));
    for (int i = 0; i < 12; i++) {
      l.add(LunarTime.fromYmdHms(_year, _month, _day, (i + 1) * 2 - 1, 0, 0));
    }
    return l;
  }

  Foto getFoto() {
    return Foto.fromLunar(this);
  }
}
