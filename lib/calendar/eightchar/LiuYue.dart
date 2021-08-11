import '../../lunar.dart';

/// 流月
/// @author 6tail
class LiuYue {
  /// 序数，0-9
  int _index;

  /// 流年
  LiuNian _liuNian;

  LiuYue(this._liuNian, this._index);

  String getMonthInChinese() => LunarUtil.MONTH[_index + 1];

  int getIndex() => _index;

  String getGanZhi() {
    int offset = 0;
    String yearGan = _liuNian.getGanZhi().substring(0, 1);
    if ('甲' == yearGan || '己' == yearGan) {
      offset = 2;
    } else if ('乙' == yearGan || '庚' == yearGan) {
      offset = 4;
    } else if ('丙' == yearGan || '辛' == yearGan) {
      offset = 6;
    } else if ('丁' == yearGan || '壬' == yearGan) {
      offset = 8;
    }
    String gan = LunarUtil.GAN[(_index + offset) % 10 + 1];
    String zhi =
        LunarUtil.ZHI[(_index + LunarUtil.BASE_MONTH_ZHI_INDEX) % 12 + 1];
    return gan + zhi;
  }

  String getXun() => LunarUtil.getXun(getGanZhi());

  String getXunKong() => LunarUtil.getXunKong(getGanZhi());
}
