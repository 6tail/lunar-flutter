import 'SolarMonth.dart';

/// 阳历季度
/// @author 6tail
class SolarSeason {
  /// 一季度的月数
  static const int MONTH_COUNT = 3;

  /// 年
  int _year = 0;

  /// 月
  int _month = 0;

  SolarSeason() : this.fromDate(DateTime.now().toLocal());

  SolarSeason.fromYm(int year, int month) {
    _year = year;
    _month = month;
  }

  SolarSeason.fromDate(DateTime date) {
    _year = date.year;
    _month = date.month;
  }

  int getYear() => _year;

  int getMonth() => _month;

  int getIndex() => (_month * 1.0 / MONTH_COUNT).ceil();

  List<SolarMonth> getMonths() {
    List<SolarMonth> l = <SolarMonth>[];
    int index = getIndex() - 1;
    for (int i = 0; i < MONTH_COUNT; i++) {
      l.add(SolarMonth.fromYm(_year, MONTH_COUNT * index + i + 1));
    }
    return l;
  }

  SolarSeason next(int seasons) {
    SolarMonth m = SolarMonth.fromYm(_year, _month).next(MONTH_COUNT * seasons);
    return SolarSeason.fromYm(m.getYear(), m.getMonth());
  }

  @override
  String toString() => '$_year.${getIndex()}';

  String toFullString() => '$_year年${getIndex()}季度';
}
