import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('季度', () {
    SolarSeason season = SolarSeason.fromYm(2019, 5);
    expect(season.toString(), '2019.2');
    expect(season.toFullString(), '2019年2季度');
  });

  test('季度2', () {
    SolarSeason season = SolarSeason.fromYm(2019, 5).next(1);
    expect(season.toString(), '2019.3');
    expect(season.toFullString(), '2019年3季度');
  });

  test('季度3', () {
    SolarSeason season = SolarSeason.fromYm(2019, 5).next(-2);
    expect(season.toString(), '2018.4');
    expect(season.toFullString(), '2018年4季度');
  });
}
