import '../../lunar.dart';
import '../IndexValue.dart';

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
    int yearGanIndex = 0;
    IndexValue? iv = LunarUtil.find(_liuNian.getGanZhi(), LunarUtil.GAN);
    if (null != iv) {
      yearGanIndex = iv.getIndex() - 1;
    }
    int offset = [2, 4, 6, 8, 0][yearGanIndex % 5];
    String gan = LunarUtil.GAN[(_index + offset) % 10 + 1];
    String zhi = LunarUtil.ZHI[(_index + LunarUtil.BASE_MONTH_ZHI_INDEX) % 12 + 1];
    return gan + zhi;
  }

  String getXun() => LunarUtil.getXun(getGanZhi());

  String getXunKong() => LunarUtil.getXunKong(getGanZhi());
}
