import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('月', () {
    SolarMonth month = SolarMonth.fromYm(2019, 5);
    expect(month.toString(), '2019-5');
    expect(month.toFullString(), '2019年5月');
  });

  test('月2', () {
    SolarMonth month = SolarMonth.fromYm(2019, 5).next(1);
    expect(month.toString(), '2019-6');
    expect(month.toFullString(), '2019年6月');
  });

  test('月3', () {
    SolarMonth month = SolarMonth.fromYm(2022, 1).next(-14);
    expect(month.toString(), '2020-11');
    expect(month.toFullString(), '2020年11月');
  });

  test('月4', () {
    SolarMonth month = SolarMonth.fromYm(2020, 11).next(14);
    expect(month.toString(), '2022-1');
    expect(month.toFullString(), '2022年1月');
  });
}
