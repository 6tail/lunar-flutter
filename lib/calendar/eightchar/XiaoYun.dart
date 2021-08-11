import '../../lunar.dart';

/// 小运
/// @author 6tail
class XiaoYun {
  /// 序数，0-9
  int _index = 0;

  /// 年
  int _year = 0;

  /// 年龄
  int _age = 0;

  /// 是否顺推
  bool _forward = false;

  /// 大运
  DaYun? _daYun;

  /// 阴历
  Lunar? _lunar;

  XiaoYun(DaYun daYun, int index, bool forward) {
    _daYun = daYun;
    _lunar = daYun.getLunar();
    _index = index;
    _year = daYun.getStartYear() + index;
    _age = daYun.getStartAge() + index;
    _forward = forward;
  }

  int getIndex() => _index;

  int getYear() => _year;

  int getAge() => _age;

  String getGanZhi() {
    int offset = LunarUtil.getJiaZiIndex(_lunar!.getTimeInGanZhi());
    int add = _index + 1;
    if (_daYun!.getIndex() > 0) {
      add += _daYun!.getStartAge() - 1;
    }
    offset += _forward ? add : -add;
    int size = LunarUtil.JIA_ZI.length;
    while (offset < 0) {
      offset += size;
    }
    offset %= size;
    return LunarUtil.JIA_ZI[offset];
  }

  String getXun() => LunarUtil.getXun(getGanZhi());

  String getXunKong() => LunarUtil.getXunKong(getGanZhi());
}
