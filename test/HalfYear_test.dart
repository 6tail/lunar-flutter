import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('半年', () {
    SolarHalfYear halfYear = SolarHalfYear.fromYm(2019, 5);
    expect(halfYear.toString(), '2019.1');
    expect(halfYear.toFullString(), '2019年上半年');
  });

  test('半年2', () {
    SolarHalfYear halfYear = SolarHalfYear.fromYm(2019, 5).next(1);
    expect(halfYear.toString(), '2019.2');
    expect(halfYear.toFullString(), '2019年下半年');
  });

  test('半年3', () {
    SolarHalfYear halfYear = SolarHalfYear.fromYm(2019, 5).next(-1);
    expect(halfYear.toString(), '2018.2');
    expect(halfYear.toFullString(), '2018年下半年');
  });
}
