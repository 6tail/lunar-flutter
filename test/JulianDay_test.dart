import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('儒略日', () {
    Solar solar = Solar.fromYmd(2020, 7, 15);
    expect(solar.getJulianDay(), 2459045.5);
  });

  test('儒略日2', () {
    Solar solar = Solar.fromJulianDay(2459045.5);
    expect(solar.toYmdHms(), '2020-07-15 00:00:00');
  });
}
