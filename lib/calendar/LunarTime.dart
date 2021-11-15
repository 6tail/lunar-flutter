import 'Lunar.dart';
import 'NineStar.dart';
import 'Solar.dart';
import 'util/LunarUtil.dart';

/// 阴历时辰
/// @author 6tail
class LunarTime {
  /// 天干下标，0-9
  int _ganIndex = 0;

  /// 地支下标，0-11
  int _zhiIndex = 0;

  /// 阴历
  Lunar? _lunar;

  LunarTime.fromYmdHms(int lunarYear, int lunarMonth, int lunarDay, int hour,
      int minute, int second) {
    _lunar =
        Lunar.fromYmdHms(lunarYear, lunarMonth, lunarDay, hour, minute, second);
    _zhiIndex = LunarUtil.getTimeZhiIndex(
        '${hour < 10 ? '0' : ''}$hour:${minute < 10 ? '0' : ''}$minute');
    _ganIndex = (_lunar!.getDayGanIndexExact() % 5 * 2 + _zhiIndex) % 10;
  }

  int getGanIndex() => _ganIndex;

  int getZhiIndex() => _zhiIndex;

  String getShengXiao() => LunarUtil.SHENGXIAO[_zhiIndex + 1];

  String getGan() => LunarUtil.GAN[_ganIndex + 1];

  String getZhi() => LunarUtil.ZHI[_zhiIndex + 1];

  String getGanZhi() => '${getGan()}${getZhi()}';

  String getPositionXi() => LunarUtil.POSITION_XI[_ganIndex + 1];

  String getPositionXiDesc() => LunarUtil.POSITION_DESC[getPositionXi()]!;

  String getPositionYangGui() => LunarUtil.POSITION_YANG_GUI[_ganIndex + 1];

  String getPositionYangGuiDesc() =>
      LunarUtil.POSITION_DESC[getPositionYangGui()]!;

  String getPositionYinGui() => LunarUtil.POSITION_YIN_GUI[_ganIndex + 1];

  String getPositionYinGuiDesc() =>
      LunarUtil.POSITION_DESC[getPositionYinGui()]!;

  String getPositionFu([int sect = 2]) => (1 == sect
      ? LunarUtil.POSITION_FU
      : LunarUtil.POSITION_FU_2)[_ganIndex + 1];

  String getPositionFuDesc([int sect = 2]) =>
      LunarUtil.POSITION_DESC[getPositionFu(sect)]!;

  String getPositionCai() => LunarUtil.POSITION_CAI[_ganIndex + 1];

  String getPositionCaiDesc() => LunarUtil.POSITION_DESC[getPositionCai()]!;

  String getNaYin() => LunarUtil.NAYIN[getGanZhi()]!;

  String getTianShen() {
    String dayZhi = _lunar!.getDayZhiExact();
    int offset = LunarUtil.ZHI_TIAN_SHEN_OFFSET[dayZhi]!;
    return LunarUtil.TIAN_SHEN[(_zhiIndex + offset) % 12 + 1];
  }

  String getTianShenType() => LunarUtil.TIAN_SHEN_TYPE[getTianShen()]!;

  String getTianShenLuck() => LunarUtil.TIAN_SHEN_TYPE_LUCK[getTianShenType()]!;

  String getChong() => LunarUtil.CHONG[_zhiIndex + 1];

  String getSha() => LunarUtil.SHA[getZhi()]!;

  String getChongShengXiao() {
    String chong = getChong();
    for (int i = 0, j = LunarUtil.ZHI.length; i < j; i++) {
      if (LunarUtil.ZHI[i] == chong) {
        return LunarUtil.SHENGXIAO[i];
      }
    }
    return '';
  }

  String getChongDesc() =>
      '(${getChongGan()}${getChong()})${getChongShengXiao()}';

  String getChongGan() => LunarUtil.CHONG_GAN[_ganIndex + 1];

  String getChongGanTie() => LunarUtil.CHONG_GAN_TIE[_ganIndex + 1];

  List<String> getYi() =>
      LunarUtil.getTimeYi(_lunar!.getDayInGanZhiExact(), getGanZhi());

  List<String> getJi() =>
      LunarUtil.getTimeJi(_lunar!.getDayInGanZhiExact(), getGanZhi());

  NineStar getNineStar() {
    //顺逆
    String solarYmd = _lunar!.getSolar().toYmd();
    Map<String, Solar> jieQi = _lunar!.getJieQiTable();
    bool asc = false;
    if (solarYmd.compareTo(jieQi['冬至']!.toYmd()) >= 0 &&
        solarYmd.compareTo(jieQi['夏至']!.toYmd()) < 0) {
      asc = true;
    }
    int start = asc ? 7 : 3;
    String dayZhi = _lunar!.getDayZhi();
    if ('子午卯酉'.contains(dayZhi)) {
      start = asc ? 1 : 9;
    } else if ('辰戌丑未'.contains(dayZhi)) {
      start = asc ? 4 : 6;
    }
    int index = asc ? start + _zhiIndex - 1 : start - _zhiIndex - 1;
    if (index > 8) {
      index -= 9;
    }
    if (index < 0) {
      index += 9;
    }
    return NineStar(index);
  }

  @override
  String toString() => getGanZhi();

  String getXun() => LunarUtil.getXun(getGanZhi());

  String getXunKong() => LunarUtil.getXunKong(getGanZhi());

  String getMinHm() {
    int hour = _lunar!.getHour();
    if (hour < 1) {
      return '00:00';
    } else if (hour > 22) {
      return '23:00';
    }
    if (hour % 2 == 0) {
      hour -= 1;
    }
    return '${hour < 10 ? '0' : ''}$hour:00';
  }

  String getMaxHm() {
    int hour = _lunar!.getHour();
    if (hour < 1) {
      return '00:59';
    } else if (hour > 22) {
      return '23:59';
    }
    if (hour % 2 != 0) {
      hour += 1;
    }
    return '${hour < 10 ? '0' : ''}$hour:59';
  }
}
