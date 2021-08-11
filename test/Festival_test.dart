import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('1', () {
    Solar solar = Solar.fromYmd(2020, 11, 26);
    expect(solar.getFestivals().toString(), '[感恩节]');
  });

  test('2', () {
    Solar solar = Solar.fromYmd(2020, 6, 21);
    expect(solar.getFestivals().toString(), '[父亲节]');
  });

  test('3', () {
    Solar solar = Solar.fromYmd(2021, 5, 9);
    expect(solar.getFestivals().toString(), '[母亲节]');
  });

  test('4', () {
    Solar solar = Solar.fromYmd(1986, 11, 27);
    expect(solar.getFestivals().toString(), '[感恩节]');
  });

  test('5', () {
    Solar solar = Solar.fromYmd(1985, 6, 16);
    expect(solar.getFestivals().toString(), '[父亲节]');
  });

  test('6', () {
    Solar solar = Solar.fromYmd(1984, 5, 13);
    expect(solar.getFestivals().toString(), '[母亲节]');
  });
}
