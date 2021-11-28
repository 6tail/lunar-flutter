/// 佛历因果犯忌
/// @author 6tail
class FotoFestival {
  /// 是日何日，如：雷斋日
  String? _name;

  /// 犯之因果，如：犯者夺纪
  String? _result;

  /// 是否每月同
  bool? _everyMonth;

  /// 备注，如：宜先一日即戒
  String? _remark;

  FotoFestival(String name,
      [String? result, bool? everyMonth, String? remark]) {
    _name = name;
    _result = null == result ? '' : result;
    _everyMonth = null == everyMonth ? false : everyMonth;
    _remark = null == remark ? '' : remark;
  }

  String getName() => _name!;

  String getResult() => _result!;

  bool isEveryMonth() => _everyMonth!;

  String getRemark() => _remark!;

  @override
  String toString() {
    return _name!;
  }

  String toFullString() {
    String s = _name!;
    if (null != _result && _result!.length > 0) {
      s += ' ';
      s += _result!;
    }
    if (null != _remark && _remark!.length > 0) {
      s += ' ';
      s += _remark!;
    }
    return s;
  }
}
