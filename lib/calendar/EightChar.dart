import 'Lunar.dart';
import 'eightchar/Yun.dart';
import 'util/LunarUtil.dart';

/// 八字
/// @author 6tail
class EightChar {
  /// 月支，按正月起寅排列
  static const List<String> MONTH_ZHI = [
    '',
    '寅',
    '卯',
    '辰',
    '巳',
    '午',
    '未',
    '申',
    '酉',
    '戌',
    '亥',
    '子',
    '丑'
  ];

  /// 长生十二神
  static const List<String> CHANG_SHENG = [
    '长生',
    '沐浴',
    '冠带',
    '临官',
    '帝旺',
    '衰',
    '病',
    '死',
    '墓',
    '绝',
    '胎',
    '养'
  ];

  /// 长生十二神日干偏移值，五阳干顺推，五阴干逆推
  static const Map<String, int> CHANG_SHENG_OFFSET = {
    '甲': 1,
    '丙': 10,
    '戊': 10,
    '庚': 7,
    '壬': 4,
    '乙': 6,
    '丁': 9,
    '己': 9,
    '辛': 0,
    '癸': 3
  };

  /// 流派，2晚子时日柱按当天，1晚子时日柱按明天
  int _sect = 2;

  /// 阴历
  Lunar _lunar;

  EightChar(this._lunar);

  static EightChar fromLunar(Lunar lunar) {
    return EightChar(lunar);
  }

  int getSect() => _sect;

  void setSect(int sect) {
    _sect = (1 == sect) ? 1 : 2;
  }

  Lunar getLunar() => _lunar;

  String getYear() => _lunar.getYearInGanZhiExact();

  String getYearGan() => _lunar.getYearGanExact();

  String getYearZhi() => _lunar.getYearZhiExact();

  List<String> getYearHideGan() => LunarUtil.ZHI_HIDE_GAN[getYearZhi()]!;

  String getYearWuXing() =>
      LunarUtil.WU_XING_GAN[getYearGan()]! +
      LunarUtil.WU_XING_ZHI[getYearZhi()]!;

  String getYearNaYin() => LunarUtil.NAYIN[getYear()]!;

  String getYearShiShenGan() =>
      LunarUtil.SHI_SHEN_GAN['${getDayGan()}${getYearGan()}']!;

  List<String> getShiShenZhi(String zhi) {
    List<String> hideGan = LunarUtil.ZHI_HIDE_GAN[zhi]!;
    List<String> l = <String>[];
    for (String gan in hideGan) {
      l.add(LunarUtil.SHI_SHEN_ZHI['${getDayGan()}$zhi$gan']!);
    }
    return l;
  }

  List<String> getYearShiShenZhi() => getShiShenZhi(getYearZhi());

  int getDayGanIndex() =>
      2 == _sect ? _lunar.getDayGanIndexExact2() : _lunar.getDayGanIndexExact();

  int getDayZhiIndex() =>
      2 == _sect ? _lunar.getDayZhiIndexExact2() : _lunar.getDayZhiIndexExact();

  String getDiShi(int zhiIndex) {
    int? offset = CHANG_SHENG_OFFSET[getDayGan()];
    int index = offset! + (getDayGanIndex() % 2 == 0 ? zhiIndex : -zhiIndex);
    if (index >= 12) {
      index -= 12;
    }
    if (index < 0) {
      index += 12;
    }
    return CHANG_SHENG[index];
  }

  String getYearDiShi() => getDiShi(_lunar.getYearZhiIndexExact());

  String getMonth() => _lunar.getMonthInGanZhiExact();

  String getMonthGan() => _lunar.getMonthGanExact();

  String getMonthZhi() => _lunar.getMonthZhiExact();

  List<String> getMonthHideGan() => LunarUtil.ZHI_HIDE_GAN[getMonthZhi()]!;

  String getMonthWuXing() =>
      LunarUtil.WU_XING_GAN[getMonthGan()]! +
      LunarUtil.WU_XING_ZHI[getMonthZhi()]!;

  String getMonthNaYin() => LunarUtil.NAYIN[getMonth()]!;

  String getMonthShiShenGan() =>
      LunarUtil.SHI_SHEN_GAN['${getDayGan()}${getMonthGan()}']!;

  List<String> getMonthShiShenZhi() => getShiShenZhi(getMonthZhi());

  String getMonthDiShi() => getDiShi(_lunar.getMonthZhiIndexExact());

  String getDay() =>
      2 == _sect ? _lunar.getDayInGanZhiExact2() : _lunar.getDayInGanZhiExact();

  String getDayGan() =>
      2 == _sect ? _lunar.getDayGanExact2() : _lunar.getDayGanExact();

  String getDayZhi() =>
      2 == _sect ? _lunar.getDayZhiExact2() : _lunar.getDayZhiExact();

  List<String> getDayHideGan() => LunarUtil.ZHI_HIDE_GAN[getDayZhi()]!;

  String getDayWuXing() =>
      LunarUtil.WU_XING_GAN[getDayGan()]! + LunarUtil.WU_XING_ZHI[getDayZhi()]!;

  String getDayNaYin() => LunarUtil.NAYIN[getDay()]!;

  String getDayShiShenGan() => '日主';

  List<String> getDayShiShenZhi() => getShiShenZhi(getDayZhi());

  String getDayDiShi() => getDiShi(getDayZhiIndex());

  String getTime() => _lunar.getTimeInGanZhi();

  String getTimeGan() => _lunar.getTimeGan();

  String getTimeZhi() => _lunar.getTimeZhi();

  List<String> getTimeHideGan() => LunarUtil.ZHI_HIDE_GAN[getTimeZhi()]!;

  String getTimeWuXing() =>
      LunarUtil.WU_XING_GAN[getTimeGan()]! +
      LunarUtil.WU_XING_ZHI[getTimeZhi()]!;

  String getTimeNaYin() => LunarUtil.NAYIN[getTime()]!;

  String getTimeShiShenGan() =>
      LunarUtil.SHI_SHEN_GAN[getDayGan() + getTimeGan()]!;

  List<String> getTimeShiShenZhi() => getShiShenZhi(getTimeZhi());

  String getTimeDiShi() => getDiShi(_lunar.getTimeZhiIndex());

  String getTaiYuan() {
    int ganIndex = _lunar.getMonthGanIndexExact() + 1;
    if (ganIndex >= 10) {
      ganIndex -= 10;
    }
    int zhiIndex = _lunar.getMonthZhiIndexExact() + 3;
    if (zhiIndex >= 12) {
      zhiIndex -= 12;
    }
    return LunarUtil.GAN[ganIndex + 1] + LunarUtil.ZHI[zhiIndex + 1];
  }

  String getTaiYuanNaYin() => LunarUtil.NAYIN[getTaiYuan()]!;

  String getTaiXi() {
    int ganIndex = (2 == _sect) ? _lunar.getDayGanIndexExact2() : _lunar.getDayGanIndexExact();
    int zhiIndex = (2 == _sect) ? _lunar.getDayZhiIndexExact2() : _lunar.getDayZhiIndexExact();
    return LunarUtil.HE_GAN_5[ganIndex] + LunarUtil.HE_ZHI_6[zhiIndex];
  }

  String getTaiXiNaYin() => LunarUtil.NAYIN[getTaiXi()]!;

  String getMingGong() {
    int monthZhiIndex = 0;
    int timeZhiIndex = 0;
    for (int i = 0, j = MONTH_ZHI.length; i < j; i++) {
      String zhi = MONTH_ZHI[i];
      if (_lunar.getMonthZhiExact() == zhi) {
        monthZhiIndex = i;
      }
      if (_lunar.getTimeZhi() == zhi) {
        timeZhiIndex = i;
      }
    }
    int zhiIndex = 26 - (monthZhiIndex + timeZhiIndex);
    if (zhiIndex > 12) {
      zhiIndex -= 12;
    }
    int jiaZiIndex = LunarUtil.getJiaZiIndex(_lunar.getMonthInGanZhiExact()) -
        (monthZhiIndex - zhiIndex);
    if (jiaZiIndex >= 60) {
      jiaZiIndex -= 60;
    }
    if (jiaZiIndex < 0) {
      jiaZiIndex += 60;
    }
    return LunarUtil.JIA_ZI[jiaZiIndex];
  }

  String getMingGongNaYin() => LunarUtil.NAYIN[getMingGong()]!;

  String getShenGong() {
    int monthZhiIndex = 0;
    int timeZhiIndex = 0;
    for (int i = 0, j = MONTH_ZHI.length; i < j; i++) {
      String zhi = MONTH_ZHI[i];
      if (_lunar.getMonthZhiExact() == zhi) {
        monthZhiIndex = i;
      }
      if (_lunar.getTimeZhi() == zhi) {
        timeZhiIndex = i;
      }
    }
    int zhiIndex = 2 + monthZhiIndex + timeZhiIndex;
    if (zhiIndex > 12) {
      zhiIndex -= 12;
    }
    int jiaZiIndex = LunarUtil.getJiaZiIndex(_lunar.getMonthInGanZhiExact()) -
        (monthZhiIndex - zhiIndex);
    if (jiaZiIndex >= 60) {
      jiaZiIndex -= 60;
    }
    if (jiaZiIndex < 0) {
      jiaZiIndex += 60;
    }
    return LunarUtil.JIA_ZI[jiaZiIndex];
  }

  String getShenGongNaYin() => LunarUtil.NAYIN[getShenGong()]!;

  Yun getYun(int gender, [int sect = 1]) => Yun(this, gender, sect);

  String getYearXun() => _lunar.getYearXunExact();

  String getYearXunKong() => _lunar.getYearXunKongExact();

  String getMonthXun() => _lunar.getMonthXunExact();

  String getMonthXunKong() => _lunar.getMonthXunKongExact();

  String getDayXun() =>
      2 == _sect ? _lunar.getDayXunExact2() : _lunar.getDayXunExact();

  String getDayXunKong() =>
      2 == _sect ? _lunar.getDayXunKongExact2() : _lunar.getDayXunKongExact();

  String getTimeXun() => _lunar.getTimeXun();

  String getTimeXunKong() => _lunar.getTimeXunKong();

  @override
  String toString() => '${getYear()} ${getMonth()} ${getDay()} ${getTime()}';
}
