import 'Solar.dart';
import 'util/LunarUtil.dart';

/// 节气
/// @author 6tail
class JieQi {
  /// 名称
  String? _name;

  /// 阳历日期
  Solar? _solar;

  /// 是否节令
  bool _jie = false;

  /// 是否气令
  bool _qi = false;

  JieQi(String name, Solar solar) {
    setName(name);
    _solar = solar;
  }

  String getName() => _name!;

  void setName(String name) {
    _name = name;
    for (int i = 0, j = LunarUtil.JIE_QI.length; i < j; i++) {
      if (name == LunarUtil.JIE_QI[i]) {
        if (i % 2 == 0) {
          _qi = true;
        } else {
          _jie = true;
        }
        return;
      }
    }
  }

  Solar getSolar() => _solar!;

  void setSolar(Solar solar) {
    _solar = solar;
  }

  bool isJie() => _jie;

  bool isQi() => _qi;

  @override
  String toString() => '$_name';
}
