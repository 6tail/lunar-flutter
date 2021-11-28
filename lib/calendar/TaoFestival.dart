/// 道历节日
/// @author 6tail
class TaoFestival {
  /// 名称
  String? _name;

  /// 备注
  String? _remark;

  TaoFestival(String name, [String? remark]) {
    _name = name;
    _remark = null == remark ? '' : remark;
  }

  String getName() => _name!;

  String getRemark() => _remark!;

  @override
  String toString() {
    return _name!;
  }

  String toFullString() {
    String s = _name!;
    if (null != _remark && _remark!.length > 0) {
      s += '[';
      s += _remark!;
      s += ']';
    }
    return s;
  }
}
