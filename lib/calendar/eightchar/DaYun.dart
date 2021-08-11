import '../../lunar.dart';

/// 大运
/// @author 6tail
class DaYun {
  /// 开始年(含)
  int _startYear = 0;

  /// 结束年(含)
  int _endYear = 0;

  /// 开始年龄(含)
  int _startAge = 0;

  /// 结束年龄(含)
  int _endAge = 0;

  /// 序数，0-9
  int _index = 0;

  /// 运
  Yun? _yun;

  /// 阴历
  Lunar? _lunar;

  DaYun(Yun yun, int index) {
    _yun = yun;
    _lunar = yun.getLunar();
    _index = index;
    int birthYear = _lunar!.getSolar().getYear();
    int year = yun.getStartSolar().getYear();
    if (index < 1) {
      _startYear = birthYear;
      _startAge = 1;
      _endYear = year - 1;
      _endAge = year - birthYear;
    } else {
      int add = (index - 1) * 10;
      _startYear = year + add;
      _startAge = _startYear - birthYear + 1;
      _endYear = _startYear + 9;
      _endAge = _startAge + 9;
    }
  }

  int getStartYear() => _startYear;

  int getEndYear() => _endYear;

  int getStartAge() => _startAge;

  int getEndAge() => _endAge;

  int getIndex() => _index;

  Lunar getLunar() => _lunar!;

  String getGanZhi() {
    if (_index < 1) {
      return '';
    }
    int offset = LunarUtil.getJiaZiIndex(_lunar!.getMonthInGanZhiExact());
    offset += _yun!.isForward() ? _index : -_index;
    int size = LunarUtil.JIA_ZI.length;
    if (offset >= size) {
      offset -= size;
    }
    if (offset < 0) {
      offset += size;
    }
    return LunarUtil.JIA_ZI[offset];
  }

  String getXun() => LunarUtil.getXun(getGanZhi());

  String getXunKong() => LunarUtil.getXunKong(getGanZhi());

  List<LiuNian> getLiuNian() {
    int n = 10;
    if (_index < 1) {
      n = _endYear - _startYear + 1;
    }
    List<LiuNian> l = <LiuNian>[];
    for (int i = 0; i < n; i++) {
      l[i] = LiuNian(this, i);
    }
    return l;
  }

  List<XiaoYun> getXiaoYun() {
    int n = 10;
    if (_index < 1) {
      n = _endYear - _startYear + 1;
    }
    List<XiaoYun> l = <XiaoYun>[];
    for (int i = 0; i < n; i++) {
      l[i] = XiaoYun(this, i, _yun!.isForward());
    }
    return l;
  }
}
