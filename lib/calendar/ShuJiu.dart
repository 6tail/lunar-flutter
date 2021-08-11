/// 数九
/// @author 6tail
class ShuJiu {
  /// 名称，如一九、二九
  String? _name;

  /// 当前数九第几天，1-9
  int _index = 1;

  ShuJiu(this._name, this._index);

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
