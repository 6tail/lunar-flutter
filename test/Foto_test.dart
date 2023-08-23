import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('佛历', () {
    Foto foto = Foto.fromLunar(Lunar.fromYmd(2021, 10, 14));
    expect(foto.toFullString(), '二五六五年十月十四 (三元降) (四天王巡行)');
  });

  test('佛历1', () {
    Foto foto = Foto.fromLunar(Lunar.fromYmd(2020, 4, 13));
    expect(foto.getXiu(), '氐');
    expect(foto.getZheng(), '土');
    expect(foto.getAnimal(), '貉');
    expect(foto.getGong(), '东');
    expect(foto.getShou(), '青龙');
  });

  test('佛历2', () {
    Foto foto = Foto.fromLunar(Lunar.fromYmd(2021, 3, 16));
    List<String> expected = [];
    expected.add('准提菩萨圣诞');
    expect(foto.getOtherFestivals(), expected);
  });
}
