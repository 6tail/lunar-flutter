import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('道历', () {
    Tao tao = Tao.fromLunar(Lunar.fromYmdHms(2021, 10, 17, 18, 0, 0));
    expect(tao.toString(), '四七一八年十月十七');
    expect(tao.toFullString(), '道歷四七一八年，天運辛丑年，己亥月，癸酉日。十月十七日，酉時。');
  });

  test('道历1', () {
    Tao tao = Tao.fromYmd(4718, 10, 18);
    expect(tao.getFestivals().toString(), '[地母娘娘圣诞, 四时会]');

    tao = Lunar.fromYmd(2021, 10, 18).getTao();
    expect(tao.getFestivals().toString(), '[地母娘娘圣诞, 四时会]');
  });
}
