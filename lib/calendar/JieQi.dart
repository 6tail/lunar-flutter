import 'Solar.dart';

/// 节气
/// @author 6tail
class JieQi {
  static const List<String> JIE_QI = [
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
    '大雪'
  ];

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
    for (int i = 0, j = JIE_QI.length; i < j; i++) {
      if (name == JIE_QI[i]) {
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
