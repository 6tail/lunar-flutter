import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('i18n', () {
    expect(I18n.getMessage("sx.dog"), "狗");

    I18n.setLanguage("en");

    expect(I18n.getMessage("sx.dog"), "Dog");

    I18n.setMessages("chs", {
      "sx.dog": "小狗狗"
    });

    I18n.setLanguage("chs");
    expect(I18n.getMessage("sx.dog"), "小狗狗");

    I18n.setMessages("chs", {
      "sx.dog": "狗"
    });

    expect(I18n.getMessage("sx.dog"), "狗");

  });

}
