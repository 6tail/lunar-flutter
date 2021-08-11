import 'util/LunarUtil.dart';

/// 九星
/// <p>玄空九星、奇门九星都来源于北斗九星，九数、七色、五行、后天八卦方位都是相通的。</p>
/// @author 6tail
class NineStar {
  /// 九数
  static const List<String> NUMBER = [
    '一',
    '二',
    '三',
    '四',
    '五',
    '六',
    '七',
    '八',
    '九'
  ];

  /// 七色
  static const List<String> COLOR = [
    '白',
    '黒',
    '碧',
    '绿',
    '黄',
    '白',
    '赤',
    '白',
    '紫'
  ];

  /// 五行
  static const List<String> WU_XING = [
    '水',
    '土',
    '木',
    '木',
    '土',
    '金',
    '金',
    '土',
    '火'
  ];

  /// 后天八卦方位
  static const List<String> POSITION = [
    '坎',
    '坤',
    '震',
    '巽',
    '中',
    '乾',
    '兑',
    '艮',
    '离'
  ];

  /// 北斗九星
  static const List<String> NAME_BEI_DOU = [
    '天枢',
    '天璇',
    '天玑',
    '天权',
    '玉衡',
    '开阳',
    '摇光',
    '洞明',
    '隐元'
  ];

  /// 玄空九星（玄空风水）
  static const List<String> NAME_XUAN_KONG = [
    '贪狼',
    '巨门',
    '禄存',
    '文曲',
    '廉贞',
    '武曲',
    '破军',
    '左辅',
    '右弼'
  ];

  /// 奇门九星（奇门遁甲，也称天盘九星）
  static const List<String> NAME_QI_MEN = [
    '天蓬',
    '天芮',
    '天冲',
    '天辅',
    '天禽',
    '天心',
    '天柱',
    '天任',
    '天英'
  ];

  /// 八门（奇门遁甲）
  static const List<String> BA_MEN_QI_MEN = [
    '休',
    '死',
    '伤',
    '杜',
    '',
    '开',
    '惊',
    '生',
    '景'
  ];

  /// 太乙九神（太乙神数）
  static const List<String> NAME_TAI_YI = [
    '太乙',
    '摄提',
    '轩辕',
    '招摇',
    '天符',
    '青龙',
    '咸池',
    '太阴',
    '天乙'
  ];

  /// 太乙九神对应类型
  static const List<String> TYPE_TAI_YI = [
    '吉神',
    '凶神',
    '安神',
    '安神',
    '凶神',
    '吉神',
    '凶神',
    '吉神',
    '吉神'
  ];

  /// 太乙九神歌诀（太乙神数）
  static const List<String> SONG_TAI_YI = [
    '门中太乙明，星官号贪狼，赌彩财喜旺，婚姻大吉昌，出入无阻挡，参谒见贤良，此行三五里，黑衣别阴阳。',
    '门前见摄提，百事必忧疑，相生犹自可，相克祸必临，死门并相会，老妇哭悲啼，求谋并吉事，尽皆不相宜，只可藏隐遁，若动伤身疾。',
    '出入会轩辕，凡事必缠牵，相生全不美，相克更忧煎，远行多不利，博彩尽输钱，九天玄女法，句句不虚言。',
    '招摇号木星，当之事莫行，相克行人阻，阴人口舌迎，梦寐多惊惧，屋响斧自鸣，阴阳消息理，万法弗违情。',
    '五鬼为天符，当门阴女谋，相克无好事，行路阻中途，走失难寻觅，道逢有尼姑，此星当门值，万事有灾除。',
    '神光跃青龙，财气喜重重，投入有酒食，赌彩最兴隆，更逢相生旺，休言克破凶，见贵安营寨，万事总吉同。',
    '吾将为咸池，当之尽不宜，出入多不利，相克有灾情，赌彩全输尽，求财空手回，仙人真妙语，愚人莫与知，动用虚惊退，反复逆风吹。',
    '坐临太阴星，百祸不相侵，求谋悉成就，知交有觅寻，回风归来路，恐有殃伏起，密语中记取，慎乎莫轻行。',
    '迎来天乙星，相逢百事兴，运用和合庆，茶酒喜相迎，求谋并嫁娶，好合有天成，祸福如神验，吉凶甚分明。'
  ];

  /// 吉凶（玄空风水）
  static const List<String> LUCK_XUAN_KONG = [
    '吉',
    '凶',
    '凶',
    '吉',
    '凶',
    '吉',
    '凶',
    '吉',
    '吉'
  ];

  /// 吉凶（奇门遁甲）
  static const List<String> LUCK_QI_MEN = [
    '大凶',
    '大凶',
    '小吉',
    '大吉',
    '大吉',
    '大吉',
    '小凶',
    '小吉',
    '小凶'
  ];

  /// 阴阳（奇门遁甲）
  static const List<String> YIN_YANG_QI_MEN = [
    '阳',
    '阴',
    '阳',
    '阳',
    '阳',
    '阴',
    '阴',
    '阳',
    '阴'
  ];

  /// 序号，0到8
  int _index = 0;

  NineStar(this._index);

  String getNumber() => NUMBER[_index];

  String getColor() => COLOR[_index];

  String getWuXing() => WU_XING[_index];

  String getPosition() => POSITION[_index];

  String? getPositionDesc() => LunarUtil.POSITION_DESC[getPosition()];

  String getNameInXuanKong() => NAME_XUAN_KONG[_index];

  String getNameInBeiDou() => NAME_BEI_DOU[_index];

  String getNameInQiMen() => NAME_QI_MEN[_index];

  String getNameInTaiYi() => NAME_TAI_YI[_index];

  String getLuckInQiMen() => LUCK_QI_MEN[_index];

  String getLuckInXuanKong() => LUCK_XUAN_KONG[_index];

  String getYinYangInQiMen() => YIN_YANG_QI_MEN[_index];

  String getTypeInTaiYi() => TYPE_TAI_YI[_index];

  String getBaMenInQiMen() => BA_MEN_QI_MEN[_index];

  String getSongInTaiYi() => SONG_TAI_YI[_index];

  int getIndex() => _index;

  @override
  String toString() =>
      '${getNumber()}${getColor()}${getWuXing()}${getNameInBeiDou()}';

  String toFullString() {
    String s =
        '${getNumber()}${getColor()}${getWuXing()} ${getPosition()}(${getPositionDesc()})${getNameInBeiDou()} 玄空[${getNameInXuanKong()} ${getLuckInXuanKong()}] 奇门[${getNameInQiMen()} ${getLuckInQiMen()}';
    if (getBaMenInQiMen().length > 0) {
      s += ' ${getBaMenInQiMen()}门';
    }
    s += ' ${getYinYangInQiMen()}] 太乙[${getNameInTaiYi()} ${getTypeInTaiYi()}]';
    return s;
  }
}
