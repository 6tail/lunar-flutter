import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('remove', () {
    Holiday? holiday = HolidayUtil.getHoliday('2010-01-01');
    expect(holiday!.getName(), '元旦节');

    HolidayUtil.fix(null, '20100101~000000000000000000000000000');
    holiday = HolidayUtil.getHoliday('2010-01-01');
    expect(holiday, null);
  });

  test('5.1', () {
    Holiday? holiday = HolidayUtil.getHoliday('2024-05-05');
    expect(holiday!.getName(), '劳动节');
    expect(holiday.isWork(), false);
  });
}
