import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('佛历', () {
    Foto foto = Foto.fromLunar(Lunar.fromYmd(2021, 10, 14));
    expect(foto.toFullString(), '二五六五年十月十四 (三元降 犯者减寿) (四天王巡行)');
  });
}
