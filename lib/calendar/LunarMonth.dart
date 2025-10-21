import 'LunarYear.dart';
import 'NineStar.dart';
import 'Solar.dart';
import 'util/LunarUtil.dart';

/// 农历月
/// @author 6tail
class LunarMonth {
  /// 农历年
  int _year = 0;

  /// 农历月：1-12，闰月为负数，如闰2月为-2
  int _month = 0;

  /// 天数，大月30天，小月29天
  int _dayCount = 0;

  /// 初一的儒略日
  double _firstJulianDay = 0;

  int _index = 0;

  int _zhiIndex = 0;

  LunarMonth(int year, int month, int dayCount, double firstJulianDay, int index) {
    _year = year;
    _month = month;
    _dayCount = dayCount;
    _firstJulianDay = firstJulianDay;
    _index = index;
    _zhiIndex = (month.abs() - 1 + LunarUtil.BASE_MONTH_ZHI_INDEX) % 12;
  }

  static LunarMonth? fromYm(int lunarYear, int lunarMonth) {
    return LunarYear.fromYear(lunarYear).getMonth(lunarMonth);
  }

  int getYear() => _year;

  int getMonth() => _month;

  int getDayCount() => _dayCount;

  double getFirstJulianDay() => _firstJulianDay;

  int getIndex() => _index;

  int getZhiIndex() => _zhiIndex;

  int getGanIndex() {
    int offset = (LunarYear.fromYear(_year).getGanIndex() + 1) % 5 * 2;
    return (_month.abs() - 1 + offset) % 10;
  }

  String getGan() => LunarUtil.GAN[getGanIndex() + 1];

  String getZhi() => LunarUtil.ZHI[_zhiIndex + 1];

  String getGanZhi() => '${getGan()}${getZhi()}';

  String getPositionXi() => LunarUtil.POSITION_XI[getGanIndex() + 1];

  String getPositionXiDesc() => LunarUtil.POSITION_DESC[getPositionXi()]!;

  String getPositionYangGui() => LunarUtil.POSITION_YANG_GUI[getGanIndex() + 1];

  String getPositionYangGuiDesc() =>
      LunarUtil.POSITION_DESC[getPositionYangGui()]!;

  String getPositionYinGui() => LunarUtil.POSITION_YIN_GUI[getGanIndex() + 1];

  String getPositionYinGuiDesc() =>
      LunarUtil.POSITION_DESC[getPositionYinGui()]!;

  String getPositionFu([int sect = 2]) => (1 == sect
      ? LunarUtil.POSITION_FU
      : LunarUtil.POSITION_FU_2)[getGanIndex() + 1];

  String getPositionFuDesc([int sect = 2]) =>
      LunarUtil.POSITION_DESC[getPositionFu(sect)]!;

  String getPositionCai() => LunarUtil.POSITION_CAI[getGanIndex() + 1];

  String getPositionCaiDesc() => LunarUtil.POSITION_DESC[getPositionCai()]!;

  bool isLeap() => _month < 0;

  String getPositionTaiSui() {
    String p;
    int m = _month.abs();
    switch (m) {
      case 1:
      case 5:
      case 9:
        p = '艮';
        break;
      case 3:
      case 7:
      case 11:
        p = '坤';
        break;
      case 4:
      case 8:
      case 12:
        p = '巽';
        break;
      default:
        p = LunarUtil.POSITION_GAN[Solar.fromJulianDay(this.getFirstJulianDay())
            .getLunar()
            .getMonthGanIndex()];
    }
    return p;
  }

  String getPositionTaiSuiDesc() =>
      LunarUtil.POSITION_DESC[getPositionTaiSui()]!;

  NineStar getNineStar() {
    int index = LunarYear.fromYear(_year).getZhiIndex() % 3;
    int m = _month.abs();
    int monthZhiIndex = (13 + m) % 12;
    int n = 27 - (index * 3);
    if (monthZhiIndex < LunarUtil.BASE_MONTH_ZHI_INDEX) {
      n -= 3;
    }
    int offset = (n - monthZhiIndex) % 9;
    return NineStar.fromIndex(offset);
  }

  @override
  String toString() {
    String month = LunarUtil.MONTH[_month.abs()];
    return '$_year年${isLeap() ? '闰' : ''}$month月($_dayCount)天';
  }

  LunarMonth next(int n) {
    if (0 == n) {
      return LunarMonth.fromYm(_year, _month)!;
    } else if (n > 0) {
      int rest = n;
      int ny = _year;
      int iy = ny;
      int im = _month;
      int index = 0;
      List<LunarMonth> months = LunarYear.fromYear(ny).getMonths();
      while (true) {
        int size = months.length;
        for (int i = 0; i < size; i++) {
          LunarMonth m = months[i];
          if (m.getYear() == iy && m.getMonth() == im) {
            index = i;
            break;
          }
        }
        int more = size - index - 1;
        if (rest < more) {
          break;
        }
        rest -= more;
        LunarMonth lastMonth = months[size - 1];
        iy = lastMonth.getYear();
        im = lastMonth.getMonth();
        ny++;
        months = LunarYear.fromYear(ny).getMonths();
      }
      return months[index + rest];
    } else {
      int rest = -n;
      int ny = _year;
      int iy = ny;
      int im = _month;
      int index = 0;
      List<LunarMonth> months = LunarYear.fromYear(ny).getMonths();
      while (true) {
        int size = months.length;
        for (int i = 0; i < size; i++) {
          LunarMonth m = months[i];
          if (m.getYear() == iy && m.getMonth() == im) {
            index = i;
            break;
          }
        }
        if (rest <= index) {
          break;
        }
        rest -= index;
        LunarMonth firstMonth = months[0];
        iy = firstMonth.getYear();
        im = firstMonth.getMonth();
        ny--;
        months = LunarYear.fromYear(ny).getMonths();
      }
      return months[index - rest];
    }
  }
}
