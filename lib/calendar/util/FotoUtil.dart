import '../FotoFestival.dart';

/// 佛历工具
/// @author 6tail
class FotoUtil {
  /// 27星宿，佛教从印度传入中国，印度把28星宿改为27星宿，把牛宿(牛金牛)纳入了女宿(女土蝠)。
  static const List<String> XIU_27 = [
    '角',
    '亢',
    '氐',
    '房',
    '心',
    '尾',
    '箕',
    '斗',
    '女',
    '虚',
    '危',
    '室',
    '壁',
    '奎',
    '娄',
    '胃',
    '昴',
    '毕',
    '觜',
    '参',
    '井',
    '鬼',
    '柳',
    '星',
    '张',
    '翼',
    '轸'
  ];

  /// 每月初一的27星宿偏移
  static const List<int> XIU_OFFSET = [
    11,
    13,
    15,
    17,
    19,
    21,
    24,
    0,
    2,
    4,
    7,
    9
  ];

  /// 观音斋日期
  static const List<String> DAY_ZHAI_GUAN_YIN = [
    '1-8',
    '2-7',
    '2-9',
    '2-19',
    '3-3',
    '3-6',
    '3-13',
    '4-22',
    '5-3',
    '5-17',
    '6-16',
    '6-18',
    '6-19',
    '6-23',
    '7-13',
    '8-16',
    '9-19',
    '9-23',
    '10-2',
    '11-19',
    '11-24',
    '12-25'
  ];

  static const String _DJ = '犯者夺纪';
  static const String _JS = '犯者减寿';
  static const String _SS = '犯者损寿';
  static const String _XL = '犯者削禄夺纪';
  static const String _JW = '犯者三年内夫妇俱亡';

  static final FotoFestival _Y = new FotoFestival('杨公忌');
  static final FotoFestival _T = new FotoFestival('四天王巡行', '', true);
  static final FotoFestival _D = new FotoFestival('斗降', _DJ, true);
  static final FotoFestival _S = new FotoFestival('月朔', _DJ, true);
  static final FotoFestival _W = new FotoFestival('月望', _DJ, true);
  static final FotoFestival _H = new FotoFestival('月晦', _JS, true);
  static final FotoFestival _L = new FotoFestival('雷斋日', _JS, true);
  static final FotoFestival _J = new FotoFestival('九毒日', '犯者夭亡，奇祸不测');
  static final FotoFestival _R =
      new FotoFestival('人神在阴', '犯者得病', true, '宜先一日即戒');
  static final FotoFestival _M =
      new FotoFestival('司命奏事', _JS, true, '如月小，即戒廿九');
  static final FotoFestival _HH = new FotoFestival('月晦', _JS, true, '如月小，即戒廿九');

  /// 因果犯忌
  static final Map<String, List<FotoFestival>> FESTIVAL = {
    '1-1': [new FotoFestival('天腊，玉帝校世人神气禄命', _XL), _S],
    '1-3': [new FotoFestival('万神都会', _DJ), _D],
    '1-5': [new FotoFestival('五虚忌')],
    '1-6': [new FotoFestival('六耗忌'), _L],
    '1-7': [new FotoFestival('上会日', _SS)],
    '1-8': [new FotoFestival('五殿阎罗天子诞', _DJ), _T],
    '1-9': [new FotoFestival('玉皇上帝诞', _DJ)],
    '1-13': [_Y],
    '1-14': [new FotoFestival('三元降', _JS), _T],
    '1-15': [
      new FotoFestival('三元降', _JS),
      new FotoFestival('上元神会', _DJ),
      _W,
      _T
    ],
    '1-16': [new FotoFestival('三元降', _JS)],
    '1-19': [new FotoFestival('长春真人诞')],
    '1-23': [new FotoFestival('三尸神奏事'), _T],
    '1-25': [_H, new FotoFestival('天地仓开日', '犯者损寿，子带疾')],
    '1-27': [_D],
    '1-28': [_R],
    '1-29': [_T],
    '1-30': [_HH, _M, _T],
    '2-1': [new FotoFestival('一殿秦广王诞', _DJ), _S],
    '2-2': [new FotoFestival('万神都会', _DJ), new FotoFestival('福德土地正神诞', '犯者得祸')],
    '2-3': [new FotoFestival('文昌帝君诞', _XL), _D],
    '2-6': [new FotoFestival('东华帝君诞'), _L],
    '2-8': [
      new FotoFestival('释迦牟尼佛出家', _DJ),
      new FotoFestival('三殿宋帝王诞', _DJ),
      new FotoFestival('张大帝诞', _DJ),
      _T
    ],
    '2-11': [_Y],
    '2-14': [_T],
    '2-15': [
      new FotoFestival('释迦牟尼佛涅槃', _XL),
      new FotoFestival('太上老君诞', _XL),
      new FotoFestival('月望', _XL, true),
      _T
    ],
    '2-17': [new FotoFestival('东方杜将军诞')],
    '2-18': [
      new FotoFestival('四殿五官王诞', _XL),
      new FotoFestival('至圣先师孔子讳辰', _XL)
    ],
    '2-19': [new FotoFestival('观音大士诞', _DJ)],
    '2-21': [new FotoFestival('普贤菩萨诞')],
    '2-23': [_T],
    '2-25': [_H],
    '2-27': [_D],
    '2-28': [_R],
    '2-29': [_T],
    '2-30': [_HH, _M, _T],
    '3-1': [new FotoFestival('二殿楚江王诞', _DJ), _S],
    '3-3': [new FotoFestival('玄天上帝诞', _DJ), _D],
    '3-6': [_L],
    '3-8': [new FotoFestival('六殿卞城王诞', _DJ), _T],
    '3-9': [new FotoFestival('牛鬼神出', '犯者产恶胎'), _Y],
    '3-12': [new FotoFestival('中央五道诞')],
    '3-14': [_T],
    '3-15': [
      new FotoFestival('昊天上帝诞', _DJ),
      new FotoFestival('玄坛诞', _DJ),
      _W,
      _T
    ],
    '3-16': [new FotoFestival('准提菩萨诞', _DJ)],
    '3-19': [
      new FotoFestival('中岳大帝诞'),
      new FotoFestival('后土娘娘诞'),
      new FotoFestival('三茅降')
    ],
    '3-20': [new FotoFestival('天地仓开日', _SS), new FotoFestival('子孙娘娘诞')],
    '3-23': [_T],
    '3-25': [_H],
    '3-27': [new FotoFestival('七殿泰山王诞'), _D],
    '3-28': [_R, new FotoFestival('苍颉至圣先师诞', _XL), new FotoFestival('东岳大帝诞')],
    '3-29': [_T],
    '3-30': [_HH, _M, _T],
    '4-1': [new FotoFestival('八殿都市王诞', _DJ), _S],
    '4-3': [_D],
    '4-4': [new FotoFestival('万神善会', '犯者失瘼夭胎'), new FotoFestival('文殊菩萨诞')],
    '4-6': [_L],
    '4-7': [new FotoFestival('南斗、北斗、西斗同降', _JS), _Y],
    '4-8': [
      new FotoFestival('释迦牟尼佛诞', _DJ),
      new FotoFestival('万神善会', '犯者失瘼夭胎'),
      new FotoFestival('善恶童子降', '犯者血死'),
      new FotoFestival('九殿平等王诞'),
      _T
    ],
    '4-14': [new FotoFestival('纯阳祖师诞', _JS), _T],
    '4-15': [_W, new FotoFestival('钟离祖师诞'), _T],
    '4-16': [new FotoFestival('天地仓开日', _SS)],
    '4-17': [new FotoFestival('十殿转轮王诞', _DJ)],
    '4-18': [new FotoFestival('天地仓开日', _SS), new FotoFestival('紫徽大帝诞', _SS)],
    '4-20': [new FotoFestival('眼光圣母诞')],
    '4-23': [_T],
    '4-25': [_H],
    '4-27': [_D],
    '4-28': [_R],
    '4-29': [_T],
    '4-30': [_HH, _M, _T],
    '5-1': [new FotoFestival('南极长生大帝诞', _DJ), _S],
    '5-3': [_D],
    '5-5': [
      new FotoFestival('地腊', _XL),
      new FotoFestival('五帝校定生人官爵', _XL),
      _J,
      _Y
    ],
    '5-6': [_J, _L],
    '5-7': [_J],
    '5-8': [new FotoFestival('南方五道诞'), _T],
    '5-11': [new FotoFestival('天地仓开日', _SS), new FotoFestival('天下都城隍诞')],
    '5-12': [new FotoFestival('炳灵公诞')],
    '5-13': [new FotoFestival('关圣降', _XL)],
    '5-14': [new FotoFestival('夜子时为天地交泰', _JW), _T],
    '5-15': [_W, _J, _T],
    '5-16': [new FotoFestival('九毒日', _JW), new FotoFestival('天地元气造化万物之辰', _JW)],
    '5-17': [_J],
    '5-18': [new FotoFestival('张天师诞')],
    '5-22': [new FotoFestival('孝娥神诞', _DJ)],
    '5-23': [_T],
    '5-25': [_J, _H],
    '5-26': [_J],
    '5-27': [_J, _D],
    '5-28': [_R],
    '5-29': [_T],
    '5-30': [_HH, _M, _T],
    '6-1': [_S],
    '6-3': [new FotoFestival('韦驮菩萨圣诞'), _D, _Y],
    '6-5': [new FotoFestival('南赡部洲转大轮', _SS)],
    '6-6': [new FotoFestival('天地仓开日', _SS), _L],
    '6-8': [_T],
    '6-10': [new FotoFestival('金粟如来诞')],
    '6-14': [_T],
    '6-15': [_W, _T],
    '6-19': [new FotoFestival('观世音菩萨成道', _DJ)],
    '6-23': [new FotoFestival('南方火神诞', '犯者遭回禄'), _T],
    '6-24': [new FotoFestival('雷祖诞', _XL), new FotoFestival('关帝诞', _XL)],
    '6-25': [_H],
    '6-27': [_D],
    '6-28': [_R],
    '6-29': [_T],
    '6-30': [_HH, _M, _T],
    '7-1': [_S, _Y],
    '7-3': [_D],
    '7-5': [new FotoFestival('中会日', _SS, false, '一作初七')],
    '7-6': [_L],
    '7-7': [
      new FotoFestival('道德腊', _XL),
      new FotoFestival('五帝校生人善恶', _XL),
      new FotoFestival('魁星诞', _XL)
    ],
    '7-8': [_T],
    '7-10': [new FotoFestival('阴毒日', '', false, '大忌')],
    '7-12': [new FotoFestival('长真谭真人诞')],
    '7-13': [new FotoFestival('大势至菩萨诞', _JS)],
    '7-14': [new FotoFestival('三元降', _JS), _T],
    '7-15': [
      _W,
      new FotoFestival('三元降', _DJ),
      new FotoFestival('地官校籍', _DJ),
      _T
    ],
    '7-16': [new FotoFestival('三元降', _JS)],
    '7-18': [new FotoFestival('西王母诞', _DJ)],
    '7-19': [new FotoFestival('太岁诞', _DJ)],
    '7-22': [new FotoFestival('增福财神诞', _XL)],
    '7-23': [_T],
    '7-25': [_H],
    '7-27': [_D],
    '7-28': [_R],
    '7-29': [_Y, _T],
    '7-30': [new FotoFestival('地藏菩萨诞', _DJ), _HH, _M, _T],
    '8-1': [_S, new FotoFestival('许真君诞')],
    '8-3': [
      _D,
      new FotoFestival('北斗诞', _XL),
      new FotoFestival('司命灶君诞', '犯者遭回禄')
    ],
    '8-5': [new FotoFestival('雷声大帝诞', _DJ)],
    '8-6': [_L],
    '8-8': [_T],
    '8-10': [new FotoFestival('北斗大帝诞')],
    '8-12': [new FotoFestival('西方五道诞')],
    '8-14': [_T],
    '8-15': [_W, new FotoFestival('太明朝元', '犯者暴亡', false, '宜焚香守夜'), _T],
    '8-16': [new FotoFestival('天曹掠刷真君降', '犯者贫夭')],
    '8-18': [new FotoFestival('天人兴福之辰', '', false, '宜斋戒，存想吉事')],
    '8-23': [new FotoFestival('汉恒候张显王诞'), _T],
    '8-24': [new FotoFestival('灶君夫人诞')],
    '8-25': [_H],
    '8-27': [_D, new FotoFestival('至圣先师孔子诞', _XL), _Y],
    '8-28': [_R, new FotoFestival('四天会事')],
    '8-29': [_T],
    '8-30': [new FotoFestival('诸神考校', '犯者夺算'), _HH, _M, _T],
    '9-1': [
      _S,
      new FotoFestival('南斗诞', _XL),
      new FotoFestival('北斗九星降世', _DJ, false, '此九日俱宜斋戒')
    ],
    '9-3': [_D, new FotoFestival('五瘟神诞')],
    '9-6': [_L],
    '9-8': [_T],
    '9-9': [
      new FotoFestival('斗母诞', _XL),
      new FotoFestival('酆都大帝诞'),
      new FotoFestival('玄天上帝飞升')
    ],
    '9-10': [new FotoFestival('斗母降', _DJ)],
    '9-11': [new FotoFestival('宜戒')],
    '9-13': [new FotoFestival('孟婆尊神诞')],
    '9-14': [_T],
    '9-15': [_W, _T],
    '9-17': [new FotoFestival('金龙四大王诞', '犯者遭水厄')],
    '9-19': [new FotoFestival('日宫月宫会合', _JS), new FotoFestival('观世音菩萨诞', _JS)],
    '9-23': [_T],
    '9-25': [_H, _Y],
    '9-27': [_D],
    '9-28': [_R],
    '9-29': [_T],
    '9-30': [new FotoFestival('药师琉璃光佛诞', '犯者危疾'), _HH, _M, _T],
    '10-1': [
      _S,
      new FotoFestival('民岁腊', _DJ),
      new FotoFestival('四天王降', '犯者一年内死')
    ],
    '10-3': [_D, new FotoFestival('三茅诞')],
    '10-5': [new FotoFestival('下会日', _JS), new FotoFestival('达摩祖师诞', _JS)],
    '10-6': [_L, new FotoFestival('天曹考察', _DJ)],
    '10-8': [new FotoFestival('佛涅槃日', '', false, '大忌色欲'), _T],
    '10-10': [new FotoFestival('四天王降', '犯者一年内死')],
    '10-11': [new FotoFestival('宜戒')],
    '10-14': [new FotoFestival('三元降', _JS), _T],
    '10-15': [
      _W,
      new FotoFestival('三元降', _DJ),
      new FotoFestival('下元水府校籍', _DJ),
      _T
    ],
    '10-16': [new FotoFestival('三元降', _JS), _T],
    '10-23': [_Y, _T],
    '10-25': [_H],
    '10-27': [_D, new FotoFestival('北极紫徽大帝降')],
    '10-28': [_R],
    '10-29': [_T],
    '10-30': [_HH, _M, _T],
    '11-1': [_S],
    '11-3': [_D],
    '11-4': [new FotoFestival('至圣先师孔子诞', _XL)],
    '11-6': [new FotoFestival('西岳大帝诞')],
    '11-8': [_T],
    '11-11': [new FotoFestival('天地仓开日', _DJ), new FotoFestival('太乙救苦天尊诞', _DJ)],
    '11-14': [_T],
    '11-15': [
      new FotoFestival('月望', '上半夜犯男死 下半夜犯女死'),
      new FotoFestival('四天王巡行', '上半夜犯男死 下半夜犯女死')
    ],
    '11-17': [new FotoFestival('阿弥陀佛诞')],
    '11-19': [new FotoFestival('太阳日宫诞', '犯者得奇祸')],
    '11-21': [_Y],
    '11-23': [new FotoFestival('张仙诞', '犯者绝嗣'), _T],
    '11-25': [new FotoFestival('掠刷大夫降', '犯者遭大凶'), _H],
    '11-26': [new FotoFestival('北方五道诞')],
    '11-27': [_D],
    '11-28': [_R],
    '11-29': [_T],
    '11-30': [_HH, _M, _T],
    '12-1': [_S],
    '12-3': [_D],
    '12-6': [new FotoFestival('天地仓开日', _JS), _L],
    '12-7': [new FotoFestival('掠刷大夫降', '犯者得恶疾')],
    '12-8': [
      new FotoFestival('王侯腊', _DJ),
      new FotoFestival('释迦如来成佛之辰'),
      _T,
      new FotoFestival('初旬内戊日，亦名王侯腊', _DJ)
    ],
    '12-12': [new FotoFestival('太素三元君朝真')],
    '12-14': [_T],
    '12-15': [_W, _T],
    '12-16': [new FotoFestival('南岳大帝诞')],
    '12-19': [_Y],
    '12-20': [new FotoFestival('天地交道', '犯者促寿')],
    '12-21': [new FotoFestival('天猷上帝诞')],
    '12-23': [new FotoFestival('五岳诞降'), _T],
    '12-24': [new FotoFestival('司今朝天奏人善恶', '犯者得大祸')],
    '12-25': [new FotoFestival('三清玉帝同降，考察善恶', '犯者得奇祸'), _H],
    '12-27': [_D],
    '12-28': [_R],
    '12-29': [new FotoFestival('华严菩萨诞'), _T],
    '12-30': [new FotoFestival('诸神下降，察访善恶', '犯者男女俱亡')]
  };

  /// 获取27星宿
  /// @param month 佛历月
  /// @param day 佛历日
  /// @return 星宿
  static String getXiu(int month, int day) {
    return XIU_27[(XIU_OFFSET[month.abs() - 1] + day - 1) % XIU_27.length];
  }
}
