import 'Lunar.dart';
import 'TaoFestival.dart';
import 'util/LunarUtil.dart';
import 'util/TaoUtil.dart';

/// 道历
/// @author 6tail
class Tao {
  static const int BIRTH_YEAR = -2697;

  /// 阴历
  Lunar? _lunar;

  Tao(this._lunar);

  static Tao fromLunar(Lunar lunar) {
    return new Tao(lunar);
  }

  static Tao fromYmdHms(
      int year, int month, int day, int hour, int minute, int second) {
    return fromLunar(
        Lunar.fromYmdHms(year + BIRTH_YEAR, month, day, hour, minute, second));
  }

  static Tao fromYmd(int year, int month, int day) {
    return fromYmdHms(year, month, day, 0, 0, 0);
  }

  Lunar getLunar() => _lunar!;

  int getYear() => _lunar!.getYear() - BIRTH_YEAR;

  int getMonth() => _lunar!.getMonth();

  int getDay() => _lunar!.getDay();

  String getYearInChinese() {
    String y = getYear().toString();
    String s = '';
    for (int i = 0, j = y.length; i < j; i++) {
      s += LunarUtil.NUMBER[y.codeUnitAt(i) - 48];
    }
    return s;
  }

  String getMonthInChinese() => _lunar!.getMonthInChinese();

  String getDayInChinese() => _lunar!.getDayInChinese();

  List<TaoFestival> getFestivals() {
    List<TaoFestival> l = <TaoFestival>[];
    List<TaoFestival>? fs = TaoUtil.FESTIVAL['${getMonth()}-${getDay()}'];
    if (null != fs) {
      l.addAll(fs);
    }
    String jq = _lunar!.getJieQi();
    if ('冬至' == jq) {
      l.add(new TaoFestival('元始天尊圣诞'));
    } else if ('夏至' == jq) {
      l.add(new TaoFestival('灵宝天尊圣诞'));
    }
    // 八节日
    String? f = TaoUtil.BA_JIE[jq];
    if (null != f) {
      l.add(new TaoFestival(f));
    }
    // 八会日
    f = TaoUtil.BA_HUI[_lunar!.getDayInGanZhi()];
    if (null != f) {
      l.add(new TaoFestival(f));
    }
    return l;
  }

  bool _isDayIn(List<String> days) {
    String md = '${getMonth()}-${getDay()}';
    for (String d in days) {
      if (md == d) {
        return true;
      }
    }
    return false;
  }

  bool isDaySanHui() => _isDayIn(TaoUtil.SAN_HUI);

  bool isDaySanYuan() => _isDayIn(TaoUtil.SAN_YUAN);

  bool isDayBaJie() => TaoUtil.BA_JIE.containsKey(_lunar!.getJieQi());

  bool isDayWuLa() => _isDayIn(TaoUtil.WU_LA);

  bool isDayBaHui() => TaoUtil.BA_HUI.containsKey(_lunar!.getDayInGanZhi());

  bool isDayMingWu() {
    return '戊' == _lunar!.getDayGan();
  }

  bool isDayAnWu() {
    return _lunar!.getDayZhi() == TaoUtil.AN_WU[getMonth().abs() - 1];
  }

  bool isDayWu() {
    return isDayMingWu() || isDayAnWu();
  }

  bool isDayTianShe() {
    bool ret = false;
    String mz = _lunar!.getMonthZhi();
    String dgz = _lunar!.getDayInGanZhi();
    if ('寅卯辰'.contains(mz)) {
      if ('戊寅' == dgz) {
        ret = true;
      }
    } else if ('巳午未'.contains(mz)) {
      if ('甲午' == dgz) {
        ret = true;
      }
    } else if ('申酉戌'.contains(mz)) {
      if ('戊申' == dgz) {
        ret = true;
      }
    } else if ('亥子丑'.contains(mz)) {
      if ('甲子' == dgz) {
        ret = true;
      }
    }
    return ret;
  }

  @override
  String toString() {
    return '${getYearInChinese()}年${getMonthInChinese()}月${getDayInChinese()}';
  }

  String toFullString() {
    return '道歷${getYearInChinese()}年，天運${_lunar!.getYearInGanZhi()}年，${_lunar!.getMonthInGanZhi()}月，${_lunar!.getDayInGanZhi()}日。${getMonthInChinese()}月${getDayInChinese()}日，${_lunar!.getTimeZhi()}時。';
  }
}
