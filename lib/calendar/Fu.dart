/// 三伏
/// <p>从夏至后第3个庚日算起，初伏为10天，中伏为10天或20天，末伏为10天。当夏至与立秋之间出现4个庚日时中伏为10天，出现5个庚日则为20天。</p>
/// @author 6tail
class Fu {
  /// 名称：初伏、中伏、末伏
  String? _name;

  /// 当前入伏第几天，1-20
  int _index = 1;

  Fu(this._name, this._index);

  String getName() => _name!;

  void setName(String name) {
    _name = name;
  }

  int getIndex() => _index;

  void setIndex(int index) {
    _index = index;
  }

  @override
  String toString() {
    return '$_name';
  }

  String toFullString() {
    return '$_name第$_index天';
  }
}
