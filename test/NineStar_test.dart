import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('test1', () {
    Lunar lunar = Solar.fromYmd(1985, 2, 19).getLunar();
    expect(lunar.getYearNineStar().getNumber(), '六');
  });

  test('test2', () {
    Lunar lunar = Lunar.fromYmd(2022, 1, 1);
    expect(lunar.getYearNineStar().toString(), '六白金开阳');
  });

  test('test3', () {
    Lunar lunar = Lunar.fromYmd(2033, 1, 1);
    expect(lunar.getYearNineStar().toString(), '四绿木天权');
  });
}
