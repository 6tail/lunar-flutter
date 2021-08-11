import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('农历年', () {
    LunarYear year = LunarYear.fromYear(2021);
    expect(year.toString(), '2021');
  });
}
