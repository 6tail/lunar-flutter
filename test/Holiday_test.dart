import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('2025 holidays', () async {
    final holidays = HolidayUtil.getHolidaysByYear(2025);
    final holidayFromFileJson = jsonDecode(await File("test/holidays/2025.json").readAsString()) as List<dynamic>;
    final holidayFromFile = holidayFromFileJson.map((e)=> Holiday.fromJson(e as Map<String, dynamic>)).toList();
    expect(holidayFromFile, holidays);
  });

  test('2025 encode', () async {
    final holidayFromFileJson = jsonDecode(await File("test/holidays/2025.json").readAsString()) as List<dynamic>;
    final holidayFromFile = holidayFromFileJson.map((e)=> Holiday.fromJson(e as Map<String, dynamic>)).toList();
    final encoded = HolidayUtil.encodeHolidays(holidayFromFile);
    final expectedEncoded = '202501010120250101202501261020250129202501281120250129202501291120250129202501301120250129202501311120250129202502011120250129202502021120250129202502031120250129202502041120250129202502081020250129202504042120250404202504052120250404202504062120250404202504273020250501202505013120250501202505023120250501202505033120250501202505043120250501202505053120250501202505314120250531202506014120250531202506024120250531202509286020251001202510016120251001202510026120251001202510036120251001202510046120251001202510056120251001202510065120251006202510076120251001202510086120251001202510116020251001';
    expect(encoded, expectedEncoded);
  });

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
