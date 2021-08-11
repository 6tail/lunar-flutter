import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('年', () {
    SolarYear year = SolarYear.fromYear(2019);
    expect(year.toString(), '2019');
    expect(year.toFullString(), '2019年');
  });

  test('年2', () {
    SolarYear year = SolarYear.fromYear(2019).next(1);
    expect(year.toString(), '2020');
    expect(year.toFullString(), '2020年');
  });
}
