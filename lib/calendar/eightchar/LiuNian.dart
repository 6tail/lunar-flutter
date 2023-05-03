import '../../lunar.dart';

/// 流年
/// @author 6tail
class LiuNian {
  /// 序数，0-9
  int _index = 0;

  /// 年
  int _year = 0;

  /// 年龄
  int _age = 0;

  /// 大运
  DaYun? _daYun;

  /// 阴历
  Lunar? _lunar;

  LiuNian(DaYun daYun, int index) {
    _daYun = daYun;
    _lunar = daYun.getLunar();
    _index = index;
    _year = daYun.getStartYear() + index;
    _age = daYun.getStartAge() + index;
  }

  String getMonthInChinese() => LunarUtil.MONTH[_index + 1];

  int getIndex() => _index;

  int getYear() => _year;

  int getAge() => _age;

  String getGanZhi() {
    // 干支与出生日期和起运日期都没关系
    int offset = LunarUtil.getJiaZiIndex(_lunar!.getJieQiSolar(I18n.getMessage('jq.liChun')).getLunar().getYearInGanZhiExact()) + _index;
    if (_daYun!.getIndex() > 0) {
      offset += _daYun!.getStartAge() - 1;
    }
    offset %= LunarUtil.JIA_ZI.length;
    return LunarUtil.JIA_ZI[offset];
  }

  String getXun() => LunarUtil.getXun(getGanZhi());

  String getXunKong() => LunarUtil.getXunKong(getGanZhi());

  List<LiuYue> getLiuYue() {
    int n = 12;
    List<LiuYue> l = <LiuYue>[];
    for (int i = 0; i < n; i++) {
      l.add(LiuYue(this, i));
    }
    return l;
  }
}
