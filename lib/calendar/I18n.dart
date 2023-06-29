import 'util/FotoUtil.dart';
import 'util/LunarUtil.dart';
import 'util/NineStarUtil.dart';
import 'util/SolarUtil.dart';
import 'util/TaoUtil.dart';

/// 多语言工具
/// @author 6tail
class I18n {

  static const DEFAULT_LANG = 'chs';
  static String _lang = 'chs';
  static bool _inited = false;
  static final RegExp _pattern = new RegExp('\\{(.[^}]*)}');

  static final Map<String, Map<String, String>> _messages = {
    'chs': {
      'tg.jia': '甲',
      'tg.yi': '乙',
      'tg.bing': '丙',
      'tg.ding': '丁',
      'tg.wu': '戊',
      'tg.ji': '己',
      'tg.geng': '庚',
      'tg.xin': '辛',
      'tg.ren': '壬',
      'tg.gui': '癸',
      'dz.zi': '子',
      'dz.chou': '丑',
      'dz.yin': '寅',
      'dz.mao': '卯',
      'dz.chen': '辰',
      'dz.si': '巳',
      'dz.wu': '午',
      'dz.wei': '未',
      'dz.shen': '申',
      'dz.you': '酉',
      'dz.xu': '戌',
      'dz.hai': '亥',
      'zx.jian': '建',
      'zx.chu': '除',
      'zx.man': '满',
      'zx.ping': '平',
      'zx.ding': '定',
      'zx.zhi': '执',
      'zx.po': '破',
      'zx.wei': '危',
      'zx.cheng': '成',
      'zx.shou': '收',
      'zx.kai': '开',
      'zx.bi': '闭',
      'jz.jiaZi': '甲子',
      'jz.yiChou': '乙丑',
      'jz.bingYin': '丙寅',
      'jz.dingMao': '丁卯',
      'jz.wuChen': '戊辰',
      'jz.jiSi': '己巳',
      'jz.gengWu': '庚午',
      'jz.xinWei': '辛未',
      'jz.renShen': '壬申',
      'jz.guiYou': '癸酉',
      'jz.jiaXu': '甲戌',
      'jz.yiHai': '乙亥',
      'jz.bingZi': '丙子',
      'jz.dingChou': '丁丑',
      'jz.wuYin': '戊寅',
      'jz.jiMao': '己卯',
      'jz.gengChen': '庚辰',
      'jz.xinSi': '辛巳',
      'jz.renWu': '壬午',
      'jz.guiWei': '癸未',
      'jz.jiaShen': '甲申',
      'jz.yiYou': '乙酉',
      'jz.bingXu': '丙戌',
      'jz.dingHai': '丁亥',
      'jz.wuZi': '戊子',
      'jz.jiChou': '己丑',
      'jz.gengYin': '庚寅',
      'jz.xinMao': '辛卯',
      'jz.renChen': '壬辰',
      'jz.guiSi': '癸巳',
      'jz.jiaWu': '甲午',
      'jz.yiWei': '乙未',
      'jz.bingShen': '丙申',
      'jz.dingYou': '丁酉',
      'jz.wuXu': '戊戌',
      'jz.jiHai': '己亥',
      'jz.gengZi': '庚子',
      'jz.xinChou': '辛丑',
      'jz.renYin': '壬寅',
      'jz.guiMao': '癸卯',
      'jz.jiaChen': '甲辰',
      'jz.yiSi': '乙巳',
      'jz.bingWu': '丙午',
      'jz.dingWei': '丁未',
      'jz.wuShen': '戊申',
      'jz.jiYou': '己酉',
      'jz.gengXu': '庚戌',
      'jz.xinHai': '辛亥',
      'jz.renZi': '壬子',
      'jz.guiChou': '癸丑',
      'jz.jiaYin': '甲寅',
      'jz.yiMao': '乙卯',
      'jz.bingChen': '丙辰',
      'jz.dingSi': '丁巳',
      'jz.wuWu': '戊午',
      'jz.jiWei': '己未',
      'jz.gengShen': '庚申',
      'jz.xinYou': '辛酉',
      'jz.renXu': '壬戌',
      'jz.guiHai': '癸亥',
      'sx.rat': '鼠',
      'sx.ox': '牛',
      'sx.tiger': '虎',
      'sx.rabbit': '兔',
      'sx.dragon': '龙',
      'sx.snake': '蛇',
      'sx.horse': '马',
      'sx.goat': '羊',
      'sx.monkey': '猴',
      'sx.rooster': '鸡',
      'sx.dog': '狗',
      'sx.pig': '猪',
      'dw.long': '龙',
      'dw.niu': '牛',
      'dw.gou': '狗',
      'dw.yang': '羊',
      'dw.tu': '兔',
      'dw.shu': '鼠',
      'dw.ji': '鸡',
      'dw.ma': '马',
      'dw.hu': '虎',
      'dw.zhu': '猪',
      'dw.hou': '猴',
      'dw.she': '蛇',
      'dw.huLi': '狐',
      'dw.yan': '燕',
      'dw.bao': '豹',
      'dw.yuan': '猿',
      'dw.yin': '蚓',
      'dw.lu': '鹿',
      'dw.wu': '乌',
      'dw.jiao': '蛟',
      'dw.lang': '狼',
      'dw.fu': '蝠',
      'dw.zhang': '獐',
      'dw.xu': '獝',
      'dw.xie': '獬',
      'dw.han': '犴',
      'dw.he': '貉',
      'dw.zhi': '彘',
      'wx.jin': '金',
      'wx.mu': '木',
      'wx.shui': '水',
      'wx.huo': '火',
      'wx.tu': '土',
      'wx.ri': '日',
      'wx.yue': '月',
      'n.zero': '〇',
      'n.one': '一',
      'n.two': '二',
      'n.three': '三',
      'n.four': '四',
      'n.five': '五',
      'n.six': '六',
      'n.seven': '七',
      'n.eight': '八',
      'n.nine': '九',
      'n.ten': '十',
      'n.eleven': '十一',
      'n.twelve': '十二',
      'd.one': '初一',
      'd.two': '初二',
      'd.three': '初三',
      'd.four': '初四',
      'd.five': '初五',
      'd.six': '初六',
      'd.seven': '初七',
      'd.eight': '初八',
      'd.nine': '初九',
      'd.ten': '初十',
      'd.eleven': '十一',
      'd.twelve': '十二',
      'd.thirteen': '十三',
      'd.fourteen': '十四',
      'd.fifteen': '十五',
      'd.sixteen': '十六',
      'd.seventeen': '十七',
      'd.eighteen': '十八',
      'd.nighteen': '十九',
      'd.twenty': '二十',
      'd.twentyOne': '廿一',
      'd.twentyTwo': '廿二',
      'd.twentyThree': '廿三',
      'd.twentyFour': '廿四',
      'd.twentyFive': '廿五',
      'd.twentySix': '廿六',
      'd.twentySeven': '廿七',
      'd.twentyEight': '廿八',
      'd.twentyNine': '廿九',
      'd.thirty': '三十',
      'm.one': '正',
      'm.two': '二',
      'm.three': '三',
      'm.four': '四',
      'm.five': '五',
      'm.six': '六',
      'm.seven': '七',
      'm.eight': '八',
      'm.nine': '九',
      'm.ten': '十',
      'm.eleven': '冬',
      'm.twelve': '腊',
      'w.sun': '日',
      'w.mon': '一',
      'w.tues': '二',
      'w.wed': '三',
      'w.thur': '四',
      'w.fri': '五',
      'w.sat': '六',
      'xz.aries': '白羊',
      'xz.taurus': '金牛',
      'xz.gemini': '双子',
      'xz.cancer': '巨蟹',
      'xz.leo': '狮子',
      'xz.virgo': '处女',
      'xz.libra': '天秤',
      'xz.scorpio': '天蝎',
      'xz.sagittarius': '射手',
      'xz.capricornus': '摩羯',
      'xz.aquarius': '水瓶',
      'xz.pisces': '双鱼',
      'bg.qian': '乾',
      'bg.kun': '坤',
      'bg.zhen': '震',
      'bg.xun': '巽',
      'bg.kan': '坎',
      'bg.li': '离',
      'bg.gen': '艮',
      'bg.dui': '兑',
      'ps.center': '中',
      'ps.dong': '东',
      'ps.nan': '南',
      'ps.xi': '西',
      'ps.bei': '北',
      'ps.zhong': '中宫',
      'ps.zhengDong': '正东',
      'ps.zhengNan': '正南',
      'ps.zhengXi': '正西',
      'ps.zhengBei': '正北',
      'ps.dongBei': '东北',
      'ps.dongNan': '东南',
      'ps.xiBei': '西北',
      'ps.xiNan': '西南',
      'ps.wai': '外',
      'ps.fangNei': '房内',
      'jq.dongZhi': '冬至',
      'jq.xiaoHan': '小寒',
      'jq.daHan': '大寒',
      'jq.liChun': '立春',
      'jq.yuShui': '雨水',
      'jq.jingZhe': '惊蛰',
      'jq.chunFen': '春分',
      'jq.qingMing': '清明',
      'jq.guYu': '谷雨',
      'jq.liXia': '立夏',
      'jq.xiaoMan': '小满',
      'jq.mangZhong': '芒种',
      'jq.xiaZhi': '夏至',
      'jq.xiaoShu': '小暑',
      'jq.daShu': '大暑',
      'jq.liQiu': '立秋',
      'jq.chuShu': '处暑',
      'jq.baiLu': '白露',
      'jq.qiuFen': '秋分',
      'jq.hanLu': '寒露',
      'jq.shuangJiang': '霜降',
      'jq.liDong': '立冬',
      'jq.xiaoXue': '小雪',
      'jq.daXue': '大雪',
      'sn.qingLong': '青龙',
      'sn.baiHu': '白虎',
      'sn.zhuQue': '朱雀',
      'sn.xuanWu': '玄武',
      'sn.mingTang': '明堂',
      'sn.tianXing': '天刑',
      'sn.tianDe': '天德',
      'sn.jinKui': '金匮',
      'sn.yuTang': '玉堂',
      'sn.siMing': '司命',
      'sn.tianLao': '天牢',
      'sn.gouChen': '勾陈',
      'sn.tianEn': '天恩',
      'sn.muCang': '母仓',
      'sn.shiYang': '时阳',
      'sn.shengQi': '生气',
      'sn.yiHou': '益后',
      'sn.zaiSha': '灾煞',
      'sn.tianHuo': '天火',
      'sn.siJi': '四忌',
      'sn.baLong': '八龙',
      'sn.fuRi': '复日',
      'sn.xuShi': '续世',
      'sn.yueSha': '月煞',
      'sn.yueXu': '月虚',
      'sn.xueZhi': '血支',
      'sn.tianZei': '天贼',
      'sn.wuXu': '五虚',
      'sn.tuFu': '土符',
      'sn.guiJi': '归忌',
      'sn.xueJi': '血忌',
      'sn.yueDe': '月德',
      'sn.yueEn': '月恩',
      'sn.siXiang': '四相',
      'sn.wangRi': '王日',
      'sn.tianCang': '天仓',
      'sn.buJiang': '不将',
      'sn.wuHe': '五合',
      'sn.mingFeiDui': '鸣吠对',
      'sn.yueJian': '月建',
      'sn.xiaoShi': '小时',
      'sn.tuHu': '土府',
      'sn.wangWang': '往亡',
      'sn.yaoAn': '要安',
      'sn.siShen': '死神',
      'sn.tianMa': '天马',
      'sn.jiuHu': '九虎',
      'sn.qiNiao': '七鸟',
      'sn.liuShe': '六蛇',
      'sn.guanRi': '官日',
      'sn.jiQi': '吉期',
      'sn.yuYu': '玉宇',
      'sn.daShi': '大时',
      'sn.daBai': '大败',
      'sn.xianChi': '咸池',
      'sn.shouRi': '守日',
      'sn.tianWu': '天巫',
      'sn.fuDe': '福德',
      'sn.liuYi': '六仪',
      'sn.jinTang': '金堂',
      'sn.yanDui': '厌对',
      'sn.zhaoYao': '招摇',
      'sn.jiuKong': '九空',
      'sn.jiuKan': '九坎',
      'sn.jiuJiao': '九焦',
      'sn.xiangRi': '相日',
      'sn.baoGuang': '宝光',
      'sn.tianGang': '天罡',
      'sn.yueXing': '月刑',
      'sn.yueHai': '月害',
      'sn.youHuo': '游祸',
      'sn.chongRi': '重日',
      'sn.shiDe': '时德',
      'sn.minRi': '民日',
      'sn.sanHe': '三合',
      'sn.linRi': '临日',
      'sn.shiYin': '时阴',
      'sn.mingFei': '鸣吠',
      'sn.siQi': '死气',
      'sn.diNang': '地囊',
      'sn.yueDeHe': '月德合',
      'sn.jingAn': '敬安',
      'sn.puHu': '普护',
      'sn.jieShen': '解神',
      'sn.xiaoHao': '小耗',
      'sn.tianDeHe': '天德合',
      'sn.yueKong': '月空',
      'sn.yiMa': '驿马',
      'sn.tianHou': '天后',
      'sn.chuShen': '除神',
      'sn.yuePo': '月破',
      'sn.daHao': '大耗',
      'sn.wuLi': '五离',
      'sn.yinDe': '阴德',
      'sn.fuSheng': '福生',
      'sn.tianLi': '天吏',
      'sn.zhiSi': '致死',
      'sn.yuanWu': '元武',
      'sn.yangDe': '阳德',
      'sn.tianXi': '天喜',
      'sn.tianYi': '天医',
      'sn.yueYan': '月厌',
      'sn.diHuo': '地火',
      'sn.fourHit': '四击',
      'sn.daSha': '大煞',
      'sn.daHui': '大会',
      'sn.tianYuan': '天愿',
      'sn.liuHe': '六合',
      'sn.wuFu': '五富',
      'sn.shengXin': '圣心',
      'sn.heKui': '河魁',
      'sn.jieSha': '劫煞',
      'sn.siQiong': '四穷',
      'sn.chuShuiLong': '触水龙',
      'sn.baFeng': '八风',
      'sn.tianShe': '天赦',
      'sn.wuMu': '五墓',
      'sn.baZhuan': '八专',
      'sn.yinCuo': '阴错',
      'sn.siHao': '四耗',
      'sn.yangCuo': '阳错',
      'sn.siFei': '四废',
      'sn.sanYin': '三阴',
      'sn.xiaoHui': '小会',
      'sn.yinDaoChongYang': '阴道冲阳',
      'sn.danYin': '单阴',
      'sn.guChen': '孤辰',
      'sn.yinWei': '阴位',
      'sn.xingHen': '行狠',
      'sn.liaoLi': '了戾',
      'sn.jueYin': '绝阴',
      'sn.chunYang': '纯阳',
      'sn.suiBo': '岁薄',
      'sn.yinYangJiaoPo': '阴阳交破',
      'sn.yinYangJuCuo': '阴阳俱错',
      'sn.yinYangJiChong': '阴阳击冲',
      'sn.zhuZhen': '逐阵',
      'sn.yangCuoYinChong': '阳错阴冲',
      'sn.qiFu': '七符',
      'sn.tianGou': '天狗',
      'sn.chengRi': '成日',
      'sn.tianFu': '天符',
      'sn.guYang': '孤阳',
      'sn.jueYang': '绝阳',
      'sn.chunYin': '纯阴',
      'sn.yinShen': '阴神',
      'sn.jieChu': '解除',
      'sn.yangPoYinChong': '阳破阴冲',
      'ss.biJian': '比肩',
      'ss.jieCai': '劫财',
      'ss.shiShen': '食神',
      'ss.shangGuan': '伤官',
      'ss.pianCai': '偏财',
      'ss.zhengCai': '正财',
      'ss.qiSha': '七杀',
      'ss.zhengGuan': '正官',
      'ss.pianYin': '偏印',
      'ss.zhengYin': '正印',
      's.none': '无',
      's.huangDao': '黄道',
      's.heiDao': '黑道',
      's.goodLuck': '吉',
      's.badLuck': '凶',
      's.yin': '阴',
      's.yang': '阳',
      's.white': '白',
      's.black': '黑',
      's.blue': '碧',
      's.green': '绿',
      's.yellow': '黄',
      's.red': '赤',
      's.purple': '紫',
      'jr.chuXi': '除夕',
      'jr.chunJie': '春节',
      'jr.yuanXiao': '元宵节',
      'jr.longTou': '龙头节',
      'jr.duanWu': '端午节',
      'jr.qiXi': '七夕节',
      'jr.zhongQiu': '中秋节',
      'jr.chongYang': '重阳节',
      'jr.laBa': '腊八节',
      'jr.yuanDan': '元旦节',
      'jr.qingRen': '情人节',
      'jr.fuNv': '妇女节',
      'jr.zhiShu': '植树节',
      'jr.xiaoFei': '消费者权益日',
      'jr.wuYi': '劳动节',
      'jr.qingNian': '青年节',
      'jr.erTong': '儿童节',
      'jr.yuRen': '愚人节',
      'jr.jianDang': '建党节',
      'jr.jianJun': '建军节',
      'jr.jiaoShi': '教师节',
      'jr.guoQing': '国庆节',
      'jr.wanShengYe': '万圣节前夜',
      'jr.wanSheng': '万圣节',
      'jr.pingAn': '平安夜',
      'jr.shengDan': '圣诞节',
      'ds.changSheng': '长生',
      'ds.muYu': '沐浴',
      'ds.guanDai': '冠带',
      'ds.linGuan': '临官',
      'ds.diWang': '帝旺',
      'ds.shuai': '衰',
      'ds.bing': '病',
      'ds.si': '死',
      'ds.mu': '墓',
      'ds.jue': '绝',
      'ds.tai': '胎',
      'ds.yang': '养',
      'h.first': '初候',
      'h.second': '二候',
      'h.third': '三候',
      'h.qiuYinJie': '蚯蚓结',
      'h.miJiao': '麋角解',
      'h.shuiQuan': '水泉动',
      'h.yanBei': '雁北乡',
      'h.queShi': '鹊始巢',
      'h.zhiShi': '雉始雊',
      'h.jiShi': '鸡始乳',
      'h.zhengNiao': '征鸟厉疾',
      'h.shuiZe': '水泽腹坚',
      'h.dongFeng': '东风解冻',
      'h.zheChongShiZhen': '蛰虫始振',
      'h.yuZhi': '鱼陟负冰',
      'h.taJi': '獭祭鱼',
      'h.houYan': '候雁北',
      'h.caoMuMengDong': '草木萌动',
      'h.taoShi': '桃始华',
      'h.cangGeng': '仓庚鸣',
      'h.yingHua': '鹰化为鸠',
      'h.xuanNiaoZhi': '玄鸟至',
      'h.leiNai': '雷乃发声',
      'h.shiDian': '始电',
      'h.tongShi': '桐始华',
      'h.tianShu': '田鼠化为鴽',
      'h.hongShi': '虹始见',
      'h.pingShi': '萍始生',
      'h.mingJiu': '鸣鸠拂奇羽',
      'h.daiSheng': '戴胜降于桑',
      'h.louGuo': '蝼蝈鸣',
      'h.qiuYinChu': '蚯蚓出',
      'h.wangGua': '王瓜生',
      'h.kuCai': '苦菜秀',
      'h.miCao': '靡草死',
      'h.maiQiu': '麦秋至',
      'h.tangLang': '螳螂生',
      'h.juShi': '鵙始鸣',
      'h.fanShe': '反舌无声',
      'h.luJia': '鹿角解',
      'h.tiaoShi': '蜩始鸣',
      'h.banXia': '半夏生',
      'h.wenFeng': '温风至',
      'h.xiShuai': '蟋蟀居壁',
      'h.yingShi': '鹰始挚',
      'h.fuCao': '腐草为萤',
      'h.tuRun': '土润溽暑',
      'h.daYu': '大雨行时',
      'h.liangFeng': '凉风至',
      'h.baiLu': '白露降',
      'h.hanChan': '寒蝉鸣',
      'h.yingNai': '鹰乃祭鸟',
      'h.tianDi': '天地始肃',
      'h.heNai': '禾乃登',
      'h.hongYanLai': '鸿雁来',
      'h.xuanNiaoGui': '玄鸟归',
      'h.qunNiao': '群鸟养羞',
      'h.leiShi': '雷始收声',
      'h.zheChongPiHu': '蛰虫坯户',
      'h.shuiShiHe': '水始涸',
      'h.hongYanLaiBin': '鸿雁来宾',
      'h.queRu': '雀入大水为蛤',
      'h.juYou': '菊有黄花',
      'h.caiNai': '豺乃祭兽',
      'h.caoMuHuangLuo': '草木黄落',
      'h.zheChongXianFu': '蛰虫咸俯',
      'h.shuiShiBing': '水始冰',
      'h.diShi': '地始冻',
      'h.zhiRu': '雉入大水为蜃',
      'h.hongCang': '虹藏不见',
      'h.tianQi': '天气上升地气下降',
      'h.biSe': '闭塞而成冬',
      'h.heDan': '鹖鴠不鸣',
      'h.huShi': '虎始交',
      'h.liTing': '荔挺出',
      'ts.zhan': '占',
      'ts.hu': '户',
      'ts.win': '窗',
      'ts.fang': '房',
      'ts.chuang': '床',
      'ts.lu': '炉',
      'ts.zao': '灶',
      'ts.dui': '碓',
      'ts.mo': '磨',
      'ts.xi': '栖',
      'ts.chu': '厨',
      'ts.ce': '厕',
      'ts.cang': '仓',
      'ts.cangKu': '仓库',
      'ts.daMen': '大门',
      'ts.men': '门',
      'ts.tang': '堂',
      'ly.xianSheng': '先胜',
      'ly.xianFu': '先负',
      'ly.youYin': '友引',
      'ly.foMie': '佛灭',
      'ly.daAn': '大安',
      'ly.chiKou': '赤口',
      'yj.jiSi': '祭祀',
      'yj.qiFu': '祈福',
      'yj.qiuSi': '求嗣',
      'yj.kaiGuang': '开光',
      'yj.suHui': '塑绘',
      'yj.qiJiao': '齐醮',
      'yj.zhaiJiao': '斋醮',
      'yj.muYu': '沐浴',
      'yj.chouShen': '酬神',
      'yj.zaoMiao': '造庙',
      'yj.siZhao': '祀灶',
      'yj.fenXiang': '焚香',
      'yj.xieTu': '谢土',
      'yj.chuHuo': '出火',
      'yj.diaoKe': '雕刻',
      'yj.jiaQu': '嫁娶',
      'yj.DingHun': '订婚',
      'yj.naCai': '纳采',
      'yj.wenMing': '问名',
      'yj.naXu': '纳婿',
      'yj.guiNing': '归宁',
      'yj.anChuang': '安床',
      'yj.heZhang': '合帐',
      'yj.guanJi': '冠笄',
      'yj.dingMeng': '订盟',
      'yj.jinRenKou': '进人口',
      'yj.caiYi': '裁衣',
      'yj.wanMian': '挽面',
      'yj.kaiRong': '开容',
      'yj.xiuFen': '修坟',
      'yj.qiZuan': '启钻',
      'yj.poTu': '破土',
      'yj.anZang': '安葬',
      'yj.liBei': '立碑',
      'yj.chengFu': '成服',
      'yj.chuFu': '除服',
      'yj.kaiShengFen': '开生坟',
      'yj.heShouMu': '合寿木',
      'yj.ruLian': '入殓',
      'yj.yiJiu': '移柩',
      'yj.puDu': '普渡',
      'yj.ruZhai': '入宅',
      'yj.anXiang': '安香',
      'yj.anMen': '安门',
      'yj.xiuZao': '修造',
      'yj.qiJi': '起基',
      'yj.dongTu': '动土',
      'yj.shangLiang': '上梁',
      'yj.shuZhu': '竖柱',
      'yj.kaiJing': '开井开池',
      'yj.zuoBei': '作陂放水',
      'yj.chaiXie': '拆卸',
      'yj.poWu': '破屋',
      'yj.huaiYuan': '坏垣',
      'yj.buYuan': '补垣',
      'yj.faMuZuoLiang': '伐木做梁',
      'yj.zuoZhao': '作灶',
      'yj.jieChu': '解除',
      'yj.kaiZhuYan': '开柱眼',
      'yj.chuanPing': '穿屏扇架',
      'yj.gaiWuHeJi': '盖屋合脊',
      'yj.kaiCe': '开厕',
      'yj.zaoCang': '造仓',
      'yj.saiXue': '塞穴',
      'yj.pingZhi': '平治道涂',
      'yj.zaoQiao': '造桥',
      'yj.zuoCe': '作厕',
      'yj.zhuDi': '筑堤',
      'yj.kaiChi': '开池',
      'yj.faMu': '伐木',
      'yj.kaiQu': '开渠',
      'yj.jueJing': '掘井',
      'yj.saoShe': '扫舍',
      'yj.fangShui': '放水',
      'yj.zaoWu': '造屋',
      'yj.heJi': '合脊',
      'yj.zaoChuChou': '造畜稠',
      'yj.xiuMen': '修门',
      'yj.dingSang': '定磉',
      'yj.zuoLiang': '作梁',
      'yj.xiuShi': '修饰垣墙',
      'yj.jiaMa': '架马',
      'yj.kaiShi': '开市',
      'yj.guaBian': '挂匾',
      'yj.naChai': '纳财',
      'yj.qiuCai': '求财',
      'yj.kaiCang': '开仓',
      'yj.maiChe': '买车',
      'yj.zhiChan': '置产',
      'yj.guYong': '雇庸',
      'yj.chuHuoCai': '出货财',
      'yj.anJiXie': '安机械',
      'yj.zaoCheQi': '造车器',
      'yj.jingLuo': '经络',
      'yj.yunNiang': '酝酿',
      'yj.zuoRan': '作染',
      'yj.guZhu': '鼓铸',
      'yj.zaoChuan': '造船',
      'yj.geMi': '割蜜',
      'yj.zaiZhong': '栽种',
      'yj.quYu': '取渔',
      'yj.jieWang': '结网',
      'yj.muYang': '牧养',
      'yj.anDuiWei': '安碓磑',
      'yj.xiYi': '习艺',
      'yj.ruXue': '入学',
      'yj.liFa': '理发',
      'yj.tanBing': '探病',
      'yj.jianGui': '见贵',
      'yj.chengChuan': '乘船',
      'yj.duShui': '渡水',
      'yj.zhenJiu': '针灸',
      'yj.chuXing': '出行',
      'yj.yiXi': '移徙',
      'yj.fenJu': '分居',
      'yj.TiTou': '剃头',
      'yj.zhengShou': '整手足甲',
      'yj.naChu': '纳畜',
      'yj.buZhuo': '捕捉',
      'yj.tianLie': '畋猎',
      'yj.jiaoNiuMa': '教牛马',
      'yj.huiQinYou': '会亲友',
      'yj.fuRen': '赴任',
      'yj.qiuYi': '求医',
      'yj.zhiBing': '治病',
      'yj.ciSong': '词讼',
      'yj.qiJiDongTu': '起基动土',
      'yj.poWuHuaiYuan': '破屋坏垣',
      'yj.gaiWu': '盖屋',
      'yj.zaoCangKu': '造仓库',
      'yj.liQuanJiaoYi': '立券交易',
      'yj.jiaoYi': '交易',
      'yj.liQuan': '立券',
      'yj.anJi': '安机',
      'yj.huiYou': '会友',
      'yj.qiuYiLiaoBing': '求医疗病',
      'yj.zhuShi': '诸事不宜',
      'yj.yuShi': '馀事勿取',
      'yj.xingSang': '行丧',
      'yj.duanYi': '断蚁',
      'yj.guiXiu': '归岫',
      'xx.bi': '毕',
      'xx.yi': '翼',
      'xx.ji': '箕',
      'xx.kui': '奎',
      'xx.gui': '鬼',
      'xx.di': '氐',
      'xx.xu': '虚',
      'xx.wei': '危',
      'xx.zi': '觜',
      'xx.zhen': '轸',
      'xx.dou': '斗',
      'xx.lou': '娄',
      'xx.liu': '柳',
      'xx.fang': '房',
      'xx.xin': '心',
      'xx.shi': '室',
      'xx.can': '参',
      'xx.jiao': '角',
      'xx.niu': '牛',
      'xx.vei': '胃',
      'xx.xing': '星',
      'xx.zhang': '张',
      'xx.tail': '尾',
      'xx.qiang': '壁',
      'xx.jing': '井',
      'xx.kang': '亢',
      'xx.nv': '女',
      'xx.mao': '昴',
      'sz.chun': '春',
      'sz.xia': '夏',
      'sz.qiu': '秋',
      'sz.dong': '冬',
      'od.first': '孟',
      'od.second': '仲',
      'od.third': '季',
      'yx.shuo': '朔',
      'yx.jiShuo': '既朔',
      'yx.eMeiXin': '蛾眉新',
      'yx.eMei': '蛾眉',
      'yx.xi': '夕',
      'yx.shangXian': '上弦',
      'yx.jiuYe': '九夜',
      'yx.night': '宵',
      'yx.jianYingTu': '渐盈凸',
      'yx.xiaoWang': '小望',
      'yx.wang': '望',
      'yx.jiWang': '既望',
      'yx.liDai': '立待',
      'yx.juDai': '居待',
      'yx.qinDai': '寝待',
      'yx.gengDai': '更待',
      'yx.jianKuiTu': '渐亏凸',
      'yx.xiaXian': '下弦',
      'yx.youMing': '有明',
      'yx.eMeiCan': '蛾眉残',
      'yx.can': '残',
      'yx.xiao': '晓',
      'yx.hui': '晦',
      'ny.sangZhe': '桑柘',
      'ny.baiLa': '白蜡',
      'ny.yangLiu': '杨柳',
      'ny.jinBo': '金箔',
      'ny.haiZhong': '海中',
      'ny.daHai': '大海',
      'ny.shaZhong': '沙中',
      'ny.luZhong': '炉中',
      'ny.shanXia': '山下',
      'ny.daLin': '大林',
      'ny.pingDi': '平地',
      'ny.luPang': '路旁',
      'ny.biShang': '壁上',
      'ny.jianFeng': '剑锋',
      'ny.shanTou': '山头',
      'ny.fuDeng': '覆灯',
      'ny.jianXia': '涧下',
      'ny.tianHe': '天河',
      'ny.chengTou': '城头',
      'ny.daYi': '大驿',
      'ny.chaiChuan': '钗钏',
      'ny.quanZhong': '泉中',
      'ny.daXi': '大溪',
      'ny.wuShang': '屋上',
      'ny.piLi': '霹雳',
      'ny.tianShang': '天上',
      'ny.songBo': '松柏',
      'ny.shiLiu': '石榴',
      'ny.changLiu': '长流'
    },
    'zht': {
      'tg.jia': '甲',
      'tg.yi': '乙',
      'tg.bing': '丙',
      'tg.ding': '丁',
      'tg.wu': '戊',
      'tg.ji': '己',
      'tg.geng': '庚',
      'tg.xin': '辛',
      'tg.ren': '壬',
      'tg.gui': '癸',
      'dz.zi': '子',
      'dz.chou': '丑',
      'dz.yin': '寅',
      'dz.mao': '卯',
      'dz.chen': '辰',
      'dz.si': '巳',
      'dz.wu': '午',
      'dz.wei': '未',
      'dz.shen': '申',
      'dz.you': '酉',
      'dz.xu': '戌',
      'dz.hai': '亥',
      'zx.jian': '建',
      'zx.chu': '除',
      'zx.man': '滿',
      'zx.ping': '平',
      'zx.ding': '定',
      'zx.zhi': '執',
      'zx.po': '破',
      'zx.wei': '危',
      'zx.cheng': '成',
      'zx.shou': '收',
      'zx.kai': '開',
      'zx.bi': '閉',
      'jz.jiaZi': '甲子',
      'jz.yiChou': '乙丑',
      'jz.bingYin': '丙寅',
      'jz.dingMao': '丁卯',
      'jz.wuChen': '戊辰',
      'jz.jiSi': '己巳',
      'jz.gengWu': '庚午',
      'jz.xinWei': '辛未',
      'jz.renShen': '壬申',
      'jz.guiYou': '癸酉',
      'jz.jiaXu': '甲戌',
      'jz.yiHai': '乙亥',
      'jz.bingZi': '丙子',
      'jz.dingChou': '丁丑',
      'jz.wuYin': '戊寅',
      'jz.jiMao': '己卯',
      'jz.gengChen': '庚辰',
      'jz.xinSi': '辛巳',
      'jz.renWu': '壬午',
      'jz.guiWei': '癸未',
      'jz.jiaShen': '甲申',
      'jz.yiYou': '乙酉',
      'jz.bingXu': '丙戌',
      'jz.dingHai': '丁亥',
      'jz.wuZi': '戊子',
      'jz.jiChou': '己丑',
      'jz.gengYin': '庚寅',
      'jz.xinMao': '辛卯',
      'jz.renChen': '壬辰',
      'jz.guiSi': '癸巳',
      'jz.jiaWu': '甲午',
      'jz.yiWei': '乙未',
      'jz.bingShen': '丙申',
      'jz.dingYou': '丁酉',
      'jz.wuXu': '戊戌',
      'jz.jiHai': '己亥',
      'jz.gengZi': '庚子',
      'jz.xinChou': '辛丑',
      'jz.renYin': '壬寅',
      'jz.guiMao': '癸卯',
      'jz.jiaChen': '甲辰',
      'jz.yiSi': '乙巳',
      'jz.bingWu': '丙午',
      'jz.dingWei': '丁未',
      'jz.wuShen': '戊申',
      'jz.jiYou': '己酉',
      'jz.gengXu': '庚戌',
      'jz.xinHai': '辛亥',
      'jz.renZi': '壬子',
      'jz.guiChou': '癸丑',
      'jz.jiaYin': '甲寅',
      'jz.yiMao': '乙卯',
      'jz.bingChen': '丙辰',
      'jz.dingSi': '丁巳',
      'jz.wuWu': '戊午',
      'jz.jiWei': '己未',
      'jz.gengShen': '庚申',
      'jz.xinYou': '辛酉',
      'jz.renXu': '壬戌',
      'jz.guiHai': '癸亥',
      'sx.rat': '鼠',
      'sx.ox': '牛',
      'sx.tiger': '虎',
      'sx.rabbit': '兔',
      'sx.dragon': '龍',
      'sx.snake': '蛇',
      'sx.horse': '馬',
      'sx.goat': '羊',
      'sx.monkey': '猴',
      'sx.rooster': '雞',
      'sx.dog': '狗',
      'sx.pig': '猪',
      'dw.long': '龍',
      'dw.niu': '牛',
      'dw.gou': '狗',
      'dw.yang': '羊',
      'dw.tu': '兔',
      'dw.shu': '鼠',
      'dw.ji': '雞',
      'dw.ma': '马',
      'dw.hu': '虎',
      'dw.zhu': '猪',
      'dw.hou': '猴',
      'dw.she': '蛇',
      'dw.huLi': '狐',
      'dw.yan': '燕',
      'dw.bao': '豹',
      'dw.yuan': '猿',
      'dw.yin': '蚓',
      'dw.lu': '鹿',
      'dw.wu': '烏',
      'dw.jiao': '蛟',
      'dw.lang': '狼',
      'dw.fu': '蝠',
      'dw.zhang': '獐',
      'dw.xu': '獝',
      'dw.xie': '獬',
      'dw.han': '犴',
      'dw.he': '貉',
      'dw.zhi': '彘',
      'wx.jin': '金',
      'wx.mu': '木',
      'wx.shui': '水',
      'wx.huo': '火',
      'wx.tu': '土',
      'wx.ri': '日',
      'wx.yue': '月',
      'n.zero': '〇',
      'n.one': '一',
      'n.two': '二',
      'n.three': '三',
      'n.four': '四',
      'n.five': '五',
      'n.six': '六',
      'n.seven': '七',
      'n.eight': '八',
      'n.nine': '九',
      'n.ten': '十',
      'n.eleven': '十一',
      'n.twelve': '十二',
      'd.one': '初一',
      'd.two': '初二',
      'd.three': '初三',
      'd.four': '初四',
      'd.five': '初五',
      'd.six': '初六',
      'd.seven': '初七',
      'd.eight': '初八',
      'd.nine': '初九',
      'd.ten': '初十',
      'd.eleven': '十一',
      'd.twelve': '十二',
      'd.thirteen': '十三',
      'd.fourteen': '十四',
      'd.fifteen': '十五',
      'd.sixteen': '十六',
      'd.seventeen': '十七',
      'd.eighteen': '十八',
      'd.nighteen': '十九',
      'd.twenty': '二十',
      'd.twentyOne': '廿一',
      'd.twentyTwo': '廿二',
      'd.twentyThree': '廿三',
      'd.twentyFour': '廿四',
      'd.twentyFive': '廿五',
      'd.twentySix': '廿六',
      'd.twentySeven': '廿七',
      'd.twentyEight': '廿八',
      'd.twentyNine': '廿九',
      'd.thirty': '三十',
      'm.one': '正',
      'm.two': '二',
      'm.three': '三',
      'm.four': '四',
      'm.five': '五',
      'm.six': '六',
      'm.seven': '七',
      'm.eight': '八',
      'm.nine': '九',
      'm.ten': '十',
      'm.eleven': '冬',
      'm.twelve': '臘',
      'w.sun': '日',
      'w.mon': '一',
      'w.tues': '二',
      'w.wed': '三',
      'w.thur': '四',
      'w.fri': '五',
      'w.sat': '六',
      'xz.aries': '白羊',
      'xz.taurus': '金牛',
      'xz.gemini': '雙子',
      'xz.cancer': '巨蟹',
      'xz.leo': '獅子',
      'xz.virgo': '處女',
      'xz.libra': '天秤',
      'xz.scorpio': '天蠍',
      'xz.sagittarius': '射手',
      'xz.capricornus': '摩羯',
      'xz.aquarius': '水瓶',
      'xz.pisces': '雙魚',
      'bg.qian': '乾',
      'bg.kun': '坤',
      'bg.zhen': '震',
      'bg.xun': '巽',
      'bg.kan': '坎',
      'bg.li': '離',
      'bg.gen': '艮',
      'bg.dui': '兑',
      'ps.center': '中',
      'ps.dong': '東',
      'ps.nan': '南',
      'ps.xi': '西',
      'ps.bei': '北',
      'ps.zhong': '中宫',
      'ps.zhengDong': '正東',
      'ps.zhengNan': '正南',
      'ps.zhengXi': '正西',
      'ps.zhengBei': '正北',
      'ps.dongBei': '东北',
      'ps.dongNan': '东南',
      'ps.xiBei': '西北',
      'ps.xiNan': '西南',
      'ps.wai': '外',
      'ps.fangNei': '房内',
      'jq.dongZhi': '冬至',
      'jq.xiaoHan': '小寒',
      'jq.daHan': '大寒',
      'jq.liChun': '立春',
      'jq.yuShui': '雨水',
      'jq.jingZhe': '驚蟄',
      'jq.chunFen': '春分',
      'jq.qingMing': '清明',
      'jq.guYu': '穀雨',
      'jq.liXia': '立夏',
      'jq.xiaoMan': '小满',
      'jq.mangZhong': '芒種',
      'jq.xiaZhi': '夏至',
      'jq.xiaoShu': '小暑',
      'jq.daShu': '大暑',
      'jq.liQiu': '立秋',
      'jq.chuShu': '處暑',
      'jq.baiLu': '白露',
      'jq.qiuFen': '秋分',
      'jq.hanLu': '寒露',
      'jq.shuangJiang': '霜降',
      'jq.liDong': '立冬',
      'jq.xiaoXue': '小雪',
      'jq.daXue': '大雪',
      'sn.qingLong': '青龍',
      'sn.baiHu': '白虎',
      'sn.zhuQue': '朱雀',
      'sn.xuanWu': '玄武',
      'sn.mingTang': '明堂',
      'sn.tianXing': '天刑',
      'sn.tianDe': '天德',
      'sn.jinKui': '金匮',
      'sn.yuTang': '玉堂',
      'sn.siMing': '司命',
      'sn.tianLao': '天牢',
      'sn.gouChen': '勾陳',
      'sn.tianEn': '天恩',
      'sn.muCang': '母倉',
      'sn.shiYang': '時陽',
      'sn.shengQi': '生氣',
      'sn.yiHou': '益後',
      'sn.zaiSha': '灾煞',
      'sn.tianHuo': '天火',
      'sn.siJi': '四忌',
      'sn.baLong': '八龍',
      'sn.fuRi': '複日',
      'sn.xuShi': '續世',
      'sn.yueSha': '月煞',
      'sn.yueXu': '月虛',
      'sn.xueZhi': '血支',
      'sn.tianZei': '天賊',
      'sn.wuXu': '五虛',
      'sn.tuFu': '土符',
      'sn.guiJi': '歸忌',
      'sn.xueJi': '血忌',
      'sn.yueDe': '月德',
      'sn.yueEn': '月恩',
      'sn.siXiang': '四相',
      'sn.wangRi': '王日',
      'sn.tianCang': '天倉',
      'sn.buJiang': '不將',
      'sn.wuHe': '五合',
      'sn.mingFeiDui': '鳴吠對',
      'sn.yueJian': '月建',
      'sn.xiaoShi': '小時',
      'sn.tuHu': '土府',
      'sn.wangWang': '往亡',
      'sn.yaoAn': '要安',
      'sn.siShen': '死神',
      'sn.tianMa': '天馬',
      'sn.jiuHu': '九虎',
      'sn.qiNiao': '七鳥',
      'sn.liuShe': '六蛇',
      'sn.guanRi': '官日',
      'sn.jiQi': '吉期',
      'sn.yuYu': '玉宇',
      'sn.daShi': '大時',
      'sn.daBai': '大敗',
      'sn.xianChi': '咸池',
      'sn.shouRi': '守日',
      'sn.tianWu': '天巫',
      'sn.fuDe': '福德',
      'sn.liuYi': '六儀',
      'sn.jinTang': '金堂',
      'sn.yanDui': '厭對',
      'sn.zhaoYao': '招搖',
      'sn.jiuKong': '九空',
      'sn.jiuKan': '九坎',
      'sn.jiuJiao': '九焦',
      'sn.xiangRi': '相日',
      'sn.baoGuang': '寶光',
      'sn.tianGang': '天罡',
      'sn.yueXing': '月刑',
      'sn.yueHai': '月害',
      'sn.youHuo': '遊禍',
      'sn.chongRi': '重日',
      'sn.shiDe': '時德',
      'sn.minRi': '民日',
      'sn.sanHe': '三合',
      'sn.linRi': '臨日',
      'sn.shiYin': '時陰',
      'sn.mingFei': '鳴吠',
      'sn.siQi': '死氣',
      'sn.diNang': '地囊',
      'sn.yueDeHe': '月德合',
      'sn.jingAn': '敬安',
      'sn.puHu': '普護',
      'sn.jieShen': '解神',
      'sn.xiaoHao': '小耗',
      'sn.tianDeHe': '天德合',
      'sn.yueKong': '月空',
      'sn.yiMa': '驛馬',
      'sn.tianHou': '天后',
      'sn.chuShen': '除神',
      'sn.yuePo': '月破',
      'sn.daHao': '大耗',
      'sn.wuLi': '五離',
      'sn.yinDe': '陰德',
      'sn.fuSheng': '福生',
      'sn.tianLi': '天吏',
      'sn.zhiSi': '致死',
      'sn.yuanWu': '元武',
      'sn.yangDe': '陽德',
      'sn.tianXi': '天喜',
      'sn.tianYi': '天醫',
      'sn.yueYan': '月厭',
      'sn.diHuo': '地火',
      'sn.fourHit': '四擊',
      'sn.daSha': '大煞',
      'sn.daHui': '大會',
      'sn.tianYuan': '天願',
      'sn.liuHe': '六合',
      'sn.wuFu': '五富',
      'sn.shengXin': '聖心',
      'sn.heKui': '河魁',
      'sn.jieSha': '劫煞',
      'sn.siQiong': '四窮',
      'sn.chuShuiLong': '觸水龍',
      'sn.baFeng': '八風',
      'sn.tianShe': '天赦',
      'sn.wuMu': '五墓',
      'sn.baZhuan': '八專',
      'sn.yinCuo': '陰錯',
      'sn.siHao': '四耗',
      'sn.yangCuo': '陽錯',
      'sn.siFei': '四廢',
      'sn.sanYin': '三陰',
      'sn.xiaoHui': '小會',
      'sn.yinDaoChongYang': '陰道沖陽',
      'sn.danYin': '單陰',
      'sn.guChen': '孤辰',
      'sn.yinWei': '陰位',
      'sn.xingHen': '行狠',
      'sn.liaoLi': '了戾',
      'sn.jueYin': '絕陰',
      'sn.chunYang': '純陽',
      'sn.suiBo': '歲薄',
      'sn.yinYangJiaoPo': '陰陽交破',
      'sn.yinYangJuCuo': '陰陽俱錯',
      'sn.yinYangJiChong': '陰陽擊沖',
      'sn.zhuZhen': '逐陣',
      'sn.yangCuoYinChong': '陽錯陰沖',
      'sn.qiFu': '七符',
      'sn.tianGou': '天狗',
      'sn.chengRi': '成日',
      'sn.tianFu': '天符',
      'sn.guYang': '孤陽',
      'sn.jueYang': '絕陽',
      'sn.chunYin': '純陰',
      'sn.yinShen': '陰神',
      'sn.jieChu': '解除',
      'sn.yangPoYinChong': '陽破陰沖',
      'ss.biJian': '比肩',
      'ss.jieCai': '劫財',
      'ss.shiShen': '食神',
      'ss.shangGuan': '傷官',
      'ss.pianCai': '偏財',
      'ss.zhengCai': '正財',
      'ss.qiSha': '七殺',
      'ss.zhengGuan': '正官',
      'ss.pianYin': '偏印',
      'ss.zhengYin': '正印',
      's.none': '無',
      's.huangDao': '黄道',
      's.heiDao': '黑道',
      's.goodLuck': '吉',
      's.badLuck': '凶',
      's.yin': '陰',
      's.yang': '陽',
      's.white': '白',
      's.black': '黑',
      's.blue': '碧',
      's.green': '綠',
      's.yellow': '黃',
      's.red': '赤',
      's.purple': '紫',
      'jr.chuXi': '除夕',
      'jr.chunJie': '春節',
      'jr.yuanXiao': '元宵節',
      'jr.longTou': '龍頭節',
      'jr.duanWu': '端午節',
      'jr.qiXi': '七夕節',
      'jr.zhongQiu': '中秋節',
      'jr.chongYang': '重陽節',
      'jr.laBa': '臘八節',
      'jr.yuanDan': '元旦節',
      'jr.qingRen': '情人節',
      'jr.fuNv': '婦女節',
      'jr.zhiShu': '植樹節',
      'jr.xiaoFei': '消費者權益日',
      'jr.wuYi': '勞動節',
      'jr.qingNian': '青年節',
      'jr.erTong': '兒童節',
      'jr.yuRen': '愚人節',
      'jr.jianDang': '建黨節',
      'jr.jianJun': '建軍節',
      'jr.jiaoShi': '教師節',
      'jr.guoQing': '國慶日',
      'jr.wanShengYe': '萬聖節前夜',
      'jr.wanSheng': '萬聖節',
      'jr.pingAn': '平安夜',
      'jr.shengDan': '耶誕節',
      'ds.changSheng': '長生',
      'ds.muYu': '沐浴',
      'ds.guanDai': '冠帶',
      'ds.linGuan': '臨官',
      'ds.diWang': '帝旺',
      'ds.shuai': '衰',
      'ds.bing': '病',
      'ds.si': '死',
      'ds.mu': '墓',
      'ds.jue': '絕',
      'ds.tai': '胎',
      'ds.yang': '養',
      'h.first': '初候',
      'h.second': '二候',
      'h.third': '三候',
      'h.qiuYinJie': '蚯蚓結',
      'h.miJiao': '麋角解',
      'h.shuiQuan': '水泉動',
      'h.yanBei': '雁北鄉',
      'h.queShi': '鵲始巢',
      'h.zhiShi': '雉始雊',
      'h.jiShi': '雞始乳',
      'h.zhengNiao': '征鳥厲疾',
      'h.shuiZe': '水澤腹堅',
      'h.dongFeng': '東風解凍',
      'h.zheChongShiZhen': '蟄蟲始振',
      'h.yuZhi': '魚陟負冰',
      'h.taJi': '獺祭魚',
      'h.houYan': '候雁北',
      'h.caoMuMengDong': '草木萌動',
      'h.taoShi': '桃始華',
      'h.cangGeng': '倉庚鳴',
      'h.yingHua': '鷹化為鳩',
      'h.xuanNiaoZhi': '玄鳥至',
      'h.leiNai': '雷乃發聲',
      'h.shiDian': '始電',
      'h.tongShi': '桐始華',
      'h.tianShu': '田鼠化為鴽',
      'h.hongShi': '虹始見',
      'h.pingShi': '萍始生',
      'h.mingJiu': '鳴鳩拂奇羽',
      'h.daiSheng': '戴勝降於桑',
      'h.louGuo': '螻蟈鳴',
      'h.qiuYinChu': '蚯蚓出',
      'h.wangGua': '王瓜生',
      'h.kuCai': '苦菜秀',
      'h.miCao': '靡草死',
      'h.maiQiu': '麥秋至',
      'h.tangLang': '螳螂生',
      'h.juShi': '鵙始鳴',
      'h.fanShe': '反舌無聲',
      'h.luJia': '鹿角解',
      'h.tiaoShi': '蜩始鳴',
      'h.banXia': '半夏生',
      'h.wenFeng': '溫風至',
      'h.xiShuai': '蟋蟀居壁',
      'h.yingShi': '鷹始摯',
      'h.fuCao': '腐草為螢',
      'h.tuRun': '土潤溽暑',
      'h.daYu': '大雨行時',
      'h.liangFeng': '涼風至',
      'h.baiLu': '白露降',
      'h.hanChan': '寒蟬鳴',
      'h.yingNai': '鷹乃祭鳥',
      'h.tianDi': '天地始肅',
      'h.heNai': '禾乃登',
      'h.hongYanLai': '鴻雁來',
      'h.xuanNiaoGui': '玄鳥歸',
      'h.qunNiao': '群鳥養羞',
      'h.leiShi': '雷始收聲',
      'h.zheChongPiHu': '蟄蟲坯戶',
      'h.shuiShiHe': '水始涸',
      'h.hongYanLaiBin': '鴻雁來賓',
      'h.queRu': '雀入大水為蛤',
      'h.juYou': '菊有黃花',
      'h.caiNai': '豺乃祭獸',
      'h.caoMuHuangLuo': '草木黃落',
      'h.zheChongXianFu': '蟄蟲鹹俯',
      'h.shuiShiBing': '水始冰',
      'h.diShi': '地始凍',
      'h.zhiRu': '雉入大水為蜃',
      'h.hongCang': '虹藏不見',
      'h.tianQi': '天氣上升地氣下降',
      'h.biSe': '閉塞而成冬',
      'h.heDan': '鶡鴠不鳴',
      'h.huShi': '虎始交',
      'h.liTing': '荔挺出',
      'ts.zhan': '占',
      'ts.hu': '户',
      'ts.win': '窗',
      'ts.fang': '房',
      'ts.chuang': '床',
      'ts.lu': '爐',
      'ts.zao': '灶',
      'ts.dui': '碓',
      'ts.mo': '磨',
      'ts.xi': '棲',
      'ts.chu': '廚',
      'ts.ce': '廁',
      'ts.cang': '倉',
      'ts.cangKu': '倉庫',
      'ts.daMen': '大門',
      'ts.men': '門',
      'ts.tang': '堂',
      'ly.xianSheng': '先勝',
      'ly.xianFu': '先負',
      'ly.youYin': '友引',
      'ly.foMie': '佛滅',
      'ly.daAn': '大安',
      'ly.chiKou': '赤口',
      'yj.jiSi': '祭祀',
      'yj.qiFu': '祈福',
      'yj.qiuSi': '求嗣',
      'yj.kaiGuang': '開光',
      'yj.suHui': '塑繪',
      'yj.qiJiao': '齊醮',
      'yj.zhaiJiao': '齋醮',
      'yj.muYu': '沐浴',
      'yj.chouShen': '酬神',
      'yj.zaoMiao': '造廟',
      'yj.siZhao': '祀灶',
      'yj.fenXiang': '焚香',
      'yj.xieTu': '謝土',
      'yj.chuHuo': '出火',
      'yj.diaoKe': '雕刻',
      'yj.jiaQu': '嫁娶',
      'yj.DingHun': '訂婚',
      'yj.naCai': '納采',
      'yj.wenMing': '問名',
      'yj.naXu': '納婿',
      'yj.guiNing': '歸寧',
      'yj.anChuang': '安床',
      'yj.heZhang': '合帳',
      'yj.guanJi': '冠笄',
      'yj.dingMeng': '訂盟',
      'yj.jinRenKou': '進人口',
      'yj.caiYi': '裁衣',
      'yj.wanMian': '挽面',
      'yj.kaiRong': '開容',
      'yj.xiuFen': '修墳',
      'yj.qiZuan': '啟鑽',
      'yj.poTu': '破土',
      'yj.anZang': '安葬',
      'yj.liBei': '立碑',
      'yj.chengFu': '成服',
      'yj.chuFu': '除服',
      'yj.kaiShengFen': '開生墳',
      'yj.heShouMu': '合壽木',
      'yj.ruLian': '入殮',
      'yj.yiJiu': '移柩',
      'yj.puDu': '普渡',
      'yj.ruZhai': '入宅',
      'yj.anXiang': '安香',
      'yj.anMen': '安門',
      'yj.xiuZao': '修造',
      'yj.qiJi': '起基',
      'yj.dongTu': '動土',
      'yj.shangLiang': '上樑',
      'yj.shuZhu': '豎柱',
      'yj.kaiJing': '開井開池',
      'yj.zuoBei': '作陂放水',
      'yj.chaiXie': '拆卸',
      'yj.poWu': '破屋',
      'yj.huaiYuan': '壞垣',
      'yj.buYuan': '補垣',
      'yj.faMuZuoLiang': '伐木做梁',
      'yj.zuoZhao': '作灶',
      'yj.jieChu': '解除',
      'yj.kaiZhuYan': '開柱眼',
      'yj.chuanPing': '穿屏扇架',
      'yj.gaiWuHeJi': '蓋屋合脊',
      'yj.kaiCe': '開廁',
      'yj.zaoCang': '造倉',
      'yj.saiXue': '塞穴',
      'yj.pingZhi': '平治道塗',
      'yj.zaoQiao': '造橋',
      'yj.zuoCe': '作廁',
      'yj.zhuDi': '築堤',
      'yj.kaiChi': '開池',
      'yj.faMu': '伐木',
      'yj.kaiQu': '開渠',
      'yj.jueJing': '掘井',
      'yj.saoShe': '掃舍',
      'yj.fangShui': '放水',
      'yj.zaoWu': '造屋',
      'yj.heJi': '合脊',
      'yj.zaoChuChou': '造畜稠',
      'yj.xiuMen': '修門',
      'yj.dingSang': '定磉',
      'yj.zuoLiang': '作梁',
      'yj.xiuShi': '修飾垣牆',
      'yj.jiaMa': '架馬',
      'yj.kaiShi': '開市',
      'yj.guaBian': '掛匾',
      'yj.naChai': '納財',
      'yj.qiuCai': '求財',
      'yj.kaiCang': '開倉',
      'yj.maiChe': '買車',
      'yj.zhiChan': '置產',
      'yj.guYong': '雇庸',
      'yj.chuHuoCai': '出貨財',
      'yj.anJiXie': '安機械',
      'yj.zaoCheQi': '造車器',
      'yj.jingLuo': '經絡',
      'yj.yunNiang': '醞釀',
      'yj.zuoRan': '作染',
      'yj.guZhu': '鼓鑄',
      'yj.zaoChuan': '造船',
      'yj.geMi': '割蜜',
      'yj.zaiZhong': '栽種',
      'yj.quYu': '取漁',
      'yj.jieWang': '結網',
      'yj.muYang': '牧養',
      'yj.anDuiWei': '安碓磑',
      'yj.xiYi': '習藝',
      'yj.ruXue': '入學',
      'yj.liFa': '理髮',
      'yj.tanBing': '探病',
      'yj.jianGui': '見貴',
      'yj.chengChuan': '乘船',
      'yj.duShui': '渡水',
      'yj.zhenJiu': '針灸',
      'yj.chuXing': '出行',
      'yj.yiXi': '移徙',
      'yj.fenJu': '分居',
      'yj.TiTou': '剃頭',
      'yj.zhengShou': '整手足甲',
      'yj.naChu': '納畜',
      'yj.buZhuo': '捕捉',
      'yj.tianLie': '畋獵',
      'yj.jiaoNiuMa': '教牛馬',
      'yj.huiQinYou': '會親友',
      'yj.fuRen': '赴任',
      'yj.qiuYi': '求醫',
      'yj.zhiBing': '治病',
      'yj.ciSong': '詞訟',
      'yj.qiJiDongTu': '起基動土',
      'yj.poWuHuaiYuan': '破屋壞垣',
      'yj.gaiWu': '蓋屋',
      'yj.zaoCangKu': '造倉庫',
      'yj.liQuanJiaoYi': '立券交易',
      'yj.jiaoYi': '交易',
      'yj.liQuan': '立券',
      'yj.anJi': '安機',
      'yj.huiYou': '會友',
      'yj.qiuYiLiaoBing': '求醫療病',
      'yj.zhuShi': '諸事不宜',
      'yj.yuShi': '餘事勿取',
      'yj.xingSang': '行喪',
      'yj.duanYi': '斷蟻',
      'yj.guiXiu': '歸岫',
      'xx.bi': '畢',
      'xx.yi': '翼',
      'xx.ji': '箕',
      'xx.kui': '奎',
      'xx.gui': '鬼',
      'xx.di': '氐',
      'xx.xu': '虛',
      'xx.wei': '危',
      'xx.zi': '觜',
      'xx.zhen': '軫',
      'xx.dou': '鬥',
      'xx.lou': '婁',
      'xx.liu': '柳',
      'xx.fang': '房',
      'xx.xin': '心',
      'xx.shi': '室',
      'xx.can': '參',
      'xx.jiao': '角',
      'xx.niu': '牛',
      'xx.vei': '胃',
      'xx.xing': '星',
      'xx.zhang': '張',
      'xx.tail': '尾',
      'xx.qiang': '壁',
      'xx.jing': '井',
      'xx.kang': '亢',
      'xx.nv': '女',
      'xx.mao': '昴',
      'sz.chun': '春',
      'sz.xia': '夏',
      'sz.qiu': '秋',
      'sz.dong': '冬',
      'od.first': '孟',
      'od.second': '仲',
      'od.third': '季',
      'yx.shuo': '朔',
      'yx.jiShuo': '既朔',
      'yx.eMeiXin': '蛾眉新',
      'yx.eMei': '蛾眉',
      'yx.xi': '夕',
      'yx.shangXian': '上弦',
      'yx.jiuYe': '九夜',
      'yx.night': '宵',
      'yx.jianYingTu': '漸盈凸',
      'yx.xiaoWang': '小望',
      'yx.wang': '望',
      'yx.jiWang': '既望',
      'yx.liDai': '立待',
      'yx.juDai': '居待',
      'yx.qinDai': '寢待',
      'yx.gengDai': '更待',
      'yx.jianKuiTu': '漸虧凸',
      'yx.xiaXian': '下弦',
      'yx.youMing': '有明',
      'yx.eMeiCan': '蛾眉殘',
      'yx.can': '殘',
      'yx.xiao': '曉',
      'yx.hui': '晦',
      'ny.sangZhe': '桑柘',
      'ny.baiLa': '白蠟',
      'ny.yangLiu': '楊柳',
      'ny.jinBo': '金箔',
      'ny.haiZhong': '海中',
      'ny.daHai': '大海',
      'ny.shaZhong': '沙中',
      'ny.luZhong': '爐中',
      'ny.shanXia': '山下',
      'ny.daLin': '大林',
      'ny.pingDi': '平地',
      'ny.luPang': '路旁',
      'ny.biShang': '壁上',
      'ny.jianFeng': '劍鋒',
      'ny.shanTou': '山頭',
      'ny.fuDeng': '覆燈',
      'ny.jianXia': '澗下',
      'ny.tianHe': '天河',
      'ny.chengTou': '城頭',
      'ny.daYi': '大驛',
      'ny.chaiChuan': '釵釧',
      'ny.quanZhong': '泉中',
      'ny.daXi': '大溪',
      'ny.wuShang': '屋上',
      'ny.piLi': '霹靂',
      'ny.tianShang': '天上',
      'ny.songBo': '松柏',
      'ny.shiLiu': '石榴',
      'ny.changLiu': '長流'
    },
    'en': {
      'tg.jia': 'Jia',
      'tg.yi': 'Yi',
      'tg.bing': 'Bing',
      'tg.ding': 'Ding',
      'tg.wu': 'Wu',
      'tg.ji': 'Ji',
      'tg.geng': 'Geng',
      'tg.xin': 'Xin',
      'tg.ren': 'Ren',
      'tg.gui': 'Gui',
      'dz.zi': 'Zi',
      'dz.chou': 'Chou',
      'dz.yin': 'Yin',
      'dz.mao': 'Mao',
      'dz.chen': 'Chen',
      'dz.si': 'Si',
      'dz.wu': 'Wu',
      'dz.wei': 'Wei',
      'dz.shen': 'Shen',
      'dz.you': 'You',
      'dz.xu': 'Xu',
      'dz.hai': 'Hai',
      'zx.jian': 'Build',
      'zx.chu': 'Remove',
      'zx.man': 'Full',
      'zx.ping': 'Flat',
      'zx.ding': 'Stable',
      'zx.zhi': 'Hold',
      'zx.po': 'Break',
      'zx.wei': 'Danger',
      'zx.cheng': 'Complete',
      'zx.shou': 'Collect',
      'zx.kai': 'Open',
      'zx.bi': 'Close',
      'jz.jiaZi': 'JiaZi',
      'jz.yiChou': 'YiChou',
      'jz.bingYin': 'BingYin',
      'jz.dingMao': 'DingMao',
      'jz.wuChen': 'WuChen',
      'jz.jiSi': 'JiSi',
      'jz.gengWu': 'GengWu',
      'jz.xinWei': 'XinWei',
      'jz.renShen': 'RenShen',
      'jz.guiYou': 'GuiYou',
      'jz.jiaXu': 'JiaXu',
      'jz.yiHai': 'YiHai',
      'jz.bingZi': 'BingZi',
      'jz.dingChou': 'DingChou',
      'jz.wuYin': 'WuYin',
      'jz.jiMao': 'JiMao',
      'jz.gengChen': 'GengChen',
      'jz.xinSi': 'XinSi',
      'jz.renWu': 'RenWu',
      'jz.guiWei': 'GuiWei',
      'jz.jiaShen': 'JiaShen',
      'jz.yiYou': 'YiYou',
      'jz.bingXu': 'BingXu',
      'jz.dingHai': 'DingHai',
      'jz.wuZi': 'WuZi',
      'jz.jiChou': 'JiChou',
      'jz.gengYin': 'GengYin',
      'jz.xinMao': 'XinMao',
      'jz.renChen': 'RenChen',
      'jz.guiSi': 'GuiSi',
      'jz.jiaWu': 'JiaWu',
      'jz.yiWei': 'YiWei',
      'jz.bingShen': 'BingShen',
      'jz.dingYou': 'DingYou',
      'jz.wuXu': 'WuXu',
      'jz.jiHai': 'JiHai',
      'jz.gengZi': 'GengZi',
      'jz.xinChou': 'XinChou',
      'jz.renYin': 'RenYin',
      'jz.guiMao': 'GuiMao',
      'jz.jiaChen': 'JiaChen',
      'jz.yiSi': 'YiSi',
      'jz.bingWu': 'BingWu',
      'jz.dingWei': 'DingWei',
      'jz.wuShen': 'WuShen',
      'jz.jiYou': 'JiYou',
      'jz.gengXu': 'GengXu',
      'jz.xinHai': 'XinHai',
      'jz.renZi': 'RenZi',
      'jz.guiChou': 'GuiChou',
      'jz.jiaYin': 'JiaYin',
      'jz.yiMao': 'YiMao',
      'jz.bingChen': 'BingChen',
      'jz.dingSi': 'DingSi',
      'jz.wuWu': 'WuWu',
      'jz.jiWei': 'JiWei',
      'jz.gengShen': 'GengShen',
      'jz.xinYou': 'XinYou',
      'jz.renXu': 'RenXu',
      'jz.guiHai': 'GuiHai',
      'sx.rat': 'Rat',
      'sx.ox': 'Ox',
      'sx.tiger': 'Tiger',
      'sx.rabbit': 'Rabbit',
      'sx.dragon': 'Dragon',
      'sx.snake': 'Snake',
      'sx.horse': 'Horse',
      'sx.goat': 'Goat',
      'sx.monkey': 'Monkey',
      'sx.rooster': 'Rooster',
      'sx.dog': 'Dog',
      'sx.pig': 'Pig',
      'dw.long': 'Dragon',
      'dw.niu': 'Ox',
      'dw.gou': 'Dog',
      'dw.yang': 'Goat',
      'dw.tu': 'Rabbit',
      'dw.shu': 'Rat',
      'dw.ji': 'Rooster',
      'dw.ma': 'Horse',
      'dw.hu': 'Tiger',
      'dw.zhu': 'Pig',
      'dw.hou': 'Monkey',
      'dw.she': 'Snake',
      'dw.huLi': 'Fox',
      'dw.yan': 'Swallow',
      'dw.bao': 'Leopard',
      'dw.yuan': 'Ape',
      'dw.yin': 'Earthworm',
      'dw.lu': 'Deer',
      'dw.wu': 'Crow',
      'dw.lang': 'Wolf',
      'dw.fu': 'Bat',
      'wx.jin': 'Metal',
      'wx.mu': 'Wood',
      'wx.shui': 'Water',
      'wx.huo': 'Fire',
      'wx.tu': 'Earth',
      'wx.ri': 'Sun',
      'wx.yue': 'Moon',
      'n.zero': '0',
      'n.one': '1',
      'n.two': '2',
      'n.three': '3',
      'n.four': '4',
      'n.five': '5',
      'n.six': '6',
      'n.seven': '7',
      'n.eight': '8',
      'n.nine': '9',
      'n.ten': '10',
      'n.eleven': '11',
      'n.twelve': '12',
      'w.sun': 'Sunday',
      'w.mon': 'Monday',
      'w.tues': 'Tuesday',
      'w.wed': 'Wednesday',
      'w.thur': 'Thursday',
      'w.fri': 'Friday',
      'w.sat': 'Saturday',
      'xz.aries': 'Aries',
      'xz.taurus': 'Taurus',
      'xz.gemini': 'Gemini',
      'xz.cancer': 'Cancer',
      'xz.leo': 'Leo',
      'xz.virgo': 'Virgo',
      'xz.libra': 'Libra',
      'xz.scorpio': 'Scorpio',
      'xz.sagittarius': 'Sagittarius',
      'xz.capricornus': 'Capricornus',
      'xz.aquarius': 'Aquarius',
      'xz.pisces': 'Pisces',
      'bg.qian': 'Qian',
      'bg.kun': 'Kun',
      'bg.zhen': 'Zhen',
      'bg.xun': 'Xun',
      'bg.kan': 'Kan',
      'bg.li': 'Li',
      'bg.gen': 'Gen',
      'bg.dui': 'Dui',
      'ps.center': 'Center',
      'ps.dong': 'East',
      'ps.nan': 'South',
      'ps.xi': 'West',
      'ps.bei': 'North',
      'ps.zhong': 'Center',
      'ps.zhengDong': 'East',
      'ps.zhengNan': 'South',
      'ps.zhengXi': 'West',
      'ps.zhengBei': 'North',
      'ps.dongBei': 'Northeast',
      'ps.dongNan': 'Southeast',
      'ps.xiBei': 'Northwest',
      'ps.xiNan': 'Southwest',
      'jq.dongZhi': 'Winter Solstice',
      'jq.xiaoHan': 'Lesser Cold',
      'jq.daHan': 'Great Cold',
      'jq.liChun': 'Spring Beginning',
      'jq.yuShui': 'Rain Water',
      'jq.jingZhe': 'Awakening from Hibernation',
      'jq.chunFen': 'Spring Equinox',
      'jq.qingMing': 'Fresh Green',
      'jq.guYu': 'Grain Rain',
      'jq.liXia': 'Beginning of Summer',
      'jq.xiaoMan': 'Lesser Fullness',
      'jq.mangZhong': 'Grain in Ear',
      'jq.xiaZhi': 'Summer Solstice',
      'jq.xiaoShu': 'Lesser Heat',
      'jq.daShu': 'Greater Heat',
      'jq.liQiu': 'Beginning of Autumn',
      'jq.chuShu': 'End of Heat',
      'jq.baiLu': 'White Dew',
      'jq.qiuFen': 'Autumnal Equinox',
      'jq.hanLu': 'Cold Dew',
      'jq.shuangJiang': 'First Frost',
      'jq.liDong': 'Beginning of Winter',
      'jq.xiaoXue': 'Light Snow',
      'jq.daXue': 'Heavy Snow',
      'sn.qingLong': 'Azure Dragon',
      'sn.baiHu': 'White Tiger',
      'sn.zhuQue': 'Rosefinch',
      'sn.xuanWu': 'Black Tortoise',
      'sn.tianEn': 'Serene Grace',
      'sn.siShen': 'Death',
      'sn.tianMa': 'Pegasus',
      'sn.baLong': 'Eight Dragon',
      'sn.jiuHu': 'Nine Tiger',
      'sn.qiNiao': 'Seven Bird',
      'sn.liuShe': 'Six Snake',
      's.none': 'None',
      's.goodLuck': 'Good luck',
      's.badLuck': 'Bad luck',
      's.yin': 'Yin',
      's.yang': 'Yang',
      's.white': 'White',
      's.black': 'Black',
      's.blue': 'Blue',
      's.green': 'Green',
      's.yellow': 'Yellow',
      's.red': 'Red',
      's.purple': 'Purple',
      'jr.chuXi': 'Chinese New Year\'s Eve',
      'jr.chunJie': 'Luna New Year',
      'jr.yuanXiao': 'Lantern Festival',
      'jr.duanWu': 'Dragon Boat Festival',
      'jr.qiXi': 'Begging Festival',
      'jr.zhongQiu': 'Mid-Autumn Festival',
      'jr.laBa': 'Laba Festival',
      'jr.yuanDan': 'New Year\'s Day',
      'jr.qingRen': 'Valentine\'s Day',
      'jr.fuNv': 'Women\'s Day',
      'jr.xiaoFei': 'Consumer Rights Day',
      'jr.zhiShu': 'Arbor Day',
      'jr.wuYi': 'International Worker\'s Day',
      'jr.erTong': 'Children\'s Day',
      'jr.qingNian': 'Youth Day',
      'jr.yuRen': 'April Fools\' Day',
      'jr.jianDang': 'Party\'s Day',
      'jr.jianJun': 'Army Day',
      'jr.jiaoShi': 'Teachers\' Day',
      'jr.guoQing': 'National Day',
      'jr.wanShengYe': 'All Saints\' Eve',
      'jr.wanSheng': 'All Saints\' Day',
      'jr.pingAn': 'Christmas Eve',
      'jr.shengDan': 'Christmas Day',
      'ts.zhan': 'At',
      'ts.hu': 'Household',
      'ts.zao': 'Cooker',
      'ts.dui': 'Pestle',
      'ts.xi': 'Habitat',
      'ts.win': 'Window',
      'ts.fang': 'Room',
      'ts.chuang': 'Bed',
      'ts.lu': 'Stove',
      'ts.mo': 'Mill',
      'ts.chu': 'Kitchen',
      'ts.ce': 'Toilet',
      'ts.cang': 'Depot',
      'ts.cangKu': 'Depot',
      'ts.daMen': 'Gate',
      'ts.men': 'Door',
      'ts.tang': 'Hall',
      'ly.xianSheng': 'Win first',
      'ly.xianFu': 'Lose first',
      'ly.youYin': 'Friend\'s referral',
      'ly.foMie': 'Buddhism\'s demise',
      'ly.daAn': 'Great safety',
      'ly.chiKou': 'Chikagoro',
      'yj.jiSi': 'Sacrifice',
      'yj.qiFu': 'Pray',
      'yj.qiuSi': 'Seek heirs',
      'yj.kaiGuang': 'Consecretion',
      'yj.suHui': 'Paint sculptural',
      'yj.qiJiao': 'Build altar',
      'yj.zhaiJiao': 'Taoist rites',
      'yj.muYu': 'Bathing',
      'yj.chouShen': 'Reward gods',
      'yj.zaoMiao': 'Build temple',
      'yj.siZhao': 'Offer kitchen god',
      'yj.fenXiang': 'Burn incense',
      'yj.xieTu': 'Earth gratitude',
      'yj.chuHuo': 'Expel the flame',
      'yj.diaoKe': 'Carving',
      'yj.jiaQu': 'Marriage',
      'yj.DingHun': 'Engagement',
      'yj.naCai': 'Proposing',
      'yj.wenMing': 'Ask name',
      'yj.naXu': 'Uxorilocal marriage',
      'yj.guiNing': 'Visit parents',
      'yj.anChuang': 'Bed placing',
      'yj.heZhang': 'Make up accounts',
      'yj.guanJi': 'Crowning adulthood',
      'yj.dingMeng': 'Make alliance',
      'yj.jinRenKou': 'Adopt',
      'yj.caiYi': 'Dressmaking',
      'yj.wanMian': 'Cosmeticsurgery',
      'yj.kaiRong': 'Open face',
      'yj.xiuFen': 'Grave repair',
      'yj.qiZuan': 'Open coffin',
      'yj.poTu': 'Break earth',
      'yj.anZang': 'Burial',
      'yj.liBei': 'Tombstone erecting',
      'yj.chengFu': 'Formation of clothes',
      'yj.chuFu': 'Mourning clothes removal',
      'yj.kaiShengFen': 'Open grave',
      'yj.heShouMu': 'Make coffin',
      'yj.ruLian': 'Body placing',
      'yj.yiJiu': 'Move coffin',
      'yj.puDu': 'Save soul',
      'yj.ruZhai': 'Enter house',
      'yj.anXiang': 'Incenst placement',
      'yj.anMen': 'Door placing',
      'yj.xiuZao': 'Repair',
      'yj.qiJi': 'Digging',
      'yj.dongTu': 'Break ground',
      'yj.shangLiang': 'Beam placing',
      'yj.shuZhu': 'Erecting pillars',
      'yj.kaiJing': 'Open pond and well',
      'yj.zuoBei': 'Make pond and fill water',
      'yj.chaiXie': 'Smash house',
      'yj.poWu': 'Break house',
      'yj.huaiYuan': 'Demolish',
      'yj.buYuan': 'Mending',
      'yj.faMuZuoLiang': 'Make beams',
      'yj.zuoZhao': 'Make stove',
      'yj.jieChu': 'Removal',
      'yj.kaiZhuYan': 'Build beam',
      'yj.chuanPing': 'Build door',
      'yj.gaiWuHeJi': 'Cover house',
      'yj.kaiCe': 'Open toilet',
      'yj.zaoCang': 'Build depot',
      'yj.saiXue': 'Block nest',
      'yj.pingZhi': 'Repair roads',
      'yj.zaoQiao': 'Build bridge',
      'yj.zuoCe': 'Build toilet',
      'yj.zhuDi': 'Fill',
      'yj.kaiChi': 'Open pond',
      'yj.faMu': 'Lumbering',
      'yj.kaiQu': 'Canalization',
      'yj.jueJing': 'Dig well',
      'yj.saoShe': 'Sweep house',
      'yj.fangShui': 'Drainage',
      'yj.zaoWu': 'Build house',
      'yj.heJi': 'Close ridge',
      'yj.zaoChuChou': 'Livestock thickening',
      'yj.xiuMen': 'Repair door',
      'yj.dingSang': 'Fix stone',
      'yj.zuoLiang': 'Beam construction',
      'yj.xiuShi': 'Decorate wall',
      'yj.jiaMa': 'Erect horse',
      'yj.kaiShi': 'Opening',
      'yj.guaBian': 'Hang plaque',
      'yj.naChai': 'Accept wealth',
      'yj.qiuCai': 'Seek wealth',
      'yj.kaiCang': 'Open depot',
      'yj.maiChe': 'Buy car',
      'yj.zhiChan': 'Buy property',
      'yj.guYong': 'Hire',
      'yj.chuHuoCai': 'Delivery',
      'yj.anJiXie': 'Build machine',
      'yj.zaoCheQi': 'Build car',
      'yj.jingLuo': 'Build loom',
      'yj.yunNiang': 'Brew',
      'yj.zuoRan': 'Dye',
      'yj.guZhu': 'Cast',
      'yj.zaoChuan': 'Build boat',
      'yj.geMi': 'Harvest honey',
      'yj.zaiZhong': 'Farming',
      'yj.quYu': 'Fishing',
      'yj.jieWang': 'Netting',
      'yj.muYang': 'Graze',
      'yj.anDuiWei': 'Build rub',
      'yj.xiYi': 'Learn',
      'yj.ruXue': 'Enter school',
      'yj.liFa': 'Haircut',
      'yj.tanBing': 'Visiting',
      'yj.jianGui': 'Meet noble',
      'yj.chengChuan': 'Ride boat',
      'yj.duShui': 'Cross water',
      'yj.zhenJiu': 'Acupuncture',
      'yj.chuXing': 'Travel',
      'yj.yiXi': 'Move',
      'yj.fenJu': 'Live apart',
      'yj.TiTou': 'Shave',
      'yj.zhengShou': 'Manicure',
      'yj.naChu': 'Feed livestock',
      'yj.buZhuo': 'Catch',
      'yj.tianLie': 'Hunt',
      'yj.jiaoNiuMa': 'Train horse',
      'yj.huiQinYou': 'Meet friends',
      'yj.fuRen': 'Go post',
      'yj.qiuYi': 'See doctor',
      'yj.zhiBing': 'Treat',
      'yj.ciSong': 'Litigation',
      'yj.qiJiDongTu': 'Lay foundation',
      'yj.poWuHuaiYuan': 'Demolish',
      'yj.gaiWu': 'Build house',
      'yj.zaoCangKu': 'Build depot',
      'yj.liQuanJiaoYi': 'Covenant trade',
      'yj.jiaoYi': 'Trade',
      'yj.liQuan': 'Covenant',
      'yj.anJi': 'Install machine',
      'yj.huiYou': 'Meet friends',
      'yj.qiuYiLiaoBing': 'Seek treatment',
      'yj.zhuShi': 'Everything Sucks',
      'yj.yuShi': 'Do nothing else',
      'yj.xingSang': 'Funeral',
      'yj.duanYi': 'Block ant hole',
      'yj.guiXiu': 'Place beam',
      'xx.bi': 'Finish',
      'xx.yi': 'Wing',
      'xx.ji': 'Sieve',
      'xx.kui': 'Qui',
      'xx.gui': 'Ghost',
      'xx.di': 'Foundation',
      'xx.xu': 'Virtual',
      'xx.wei': 'Danger',
      'xx.zi': 'Mouth',
      'xx.zhen': 'Cross-bar',
      'xx.dou': 'Fight',
      'xx.lou': 'Weak',
      'xx.liu': 'Willow',
      'xx.fang': 'House',
      'xx.xin': 'Heart',
      'xx.shi': 'Room',
      'xx.can': 'Join',
      'xx.jiao': 'Horn',
      'xx.niu': 'Ox',
      'xx.vei': 'Stomach',
      'xx.xing': 'Star',
      'xx.zhang': 'Chang',
      'xx.tail': 'Tail',
      'xx.qiang': 'Wall',
      'xx.jing': 'Well',
      'xx.kang': 'Kang',
      'xx.nv': 'Female',
      'xx.mao': 'Mao',
      'sz.chun': 'Spring',
      'sz.xia': 'Summer',
      'sz.qiu': 'Autumn',
      'sz.dong': 'Winter',
      'yx.shuo': 'New',
      'yx.eMeiXin': 'New waxing',
      'yx.eMei': 'Waxing',
      'yx.xi': 'Evening',
      'yx.shangXian': 'First quarter',
      'yx.jiuYe': 'Nine night',
      'yx.night': 'Night',
      'yx.jianYingTu': 'Gibbous',
      'yx.xiaoWang': 'Little full',
      'yx.wang': 'Full',
      'yx.jianKuiTu': 'Disseminating',
      'yx.xiaXian': 'Third quarter',
      'yx.eMeiCan': 'Waning waxing',
      'yx.can': 'Waning',
      'yx.xiao': 'Daybreak',
      'yx.hui': 'Obscure',
      'ny.sangZhe': 'Cudrania',
      'ny.baiLa': 'Wax',
      'ny.yangLiu': 'Willow',
      'ny.jinBo': 'Foil',
      'ny.haiZhong': 'Sea',
      'ny.daHai': 'Ocean',
      'ny.shaZhong': 'Sand',
      'ny.luZhong': 'Stove',
      'ny.shanXia': 'Piedmont',
      'ny.daLin': 'Forest',
      'ny.pingDi': 'Land',
      'ny.luPang': 'Roadside',
      'ny.biShang': 'Wall',
      'ny.jianFeng': 'Blade',
      'ny.shanTou': 'Hilltop',
      'ny.fuDeng': 'Light',
      'ny.jianXia': 'Valleyn',
      'ny.tianHe': 'River',
      'ny.chengTou': 'City',
      'ny.daYi': 'Post',
      'ny.chaiChuan': 'Ornaments',
      'ny.quanZhong': 'Spring',
      'ny.daXi': 'Stream',
      'ny.wuShang': 'Roof',
      'ny.piLi': 'Thunderbolt',
      'ny.tianShang': 'Sky',
      'ny.songBo': 'Coniferin',
      'ny.shiLiu': 'Pomegranate',
      'ny.changLiu': 'Flows'
    }
  };

  static final Map<String, Map<String, Map<String, String>>> _dictString = {
    'LunarUtil': {
      'TIAN_SHEN_TYPE': {},
      'TIAN_SHEN_TYPE_LUCK': {},
      'XIU_LUCK': {},
      'LU': {},
      'XIU': {},
      'SHA': {},
      'POSITION_DESC': {},
      'NAYIN': {},
      'WU_XING_GAN': {},
      'WU_XING_ZHI': {},
      'SHOU': {},
      'GONG': {},
      'FESTIVAL': {},
      'ZHENG': {},
      'ANIMAL': {},
      'SHI_SHEN_GAN': {},
      'SHI_SHEN_ZHI': {},
      'XIU_SONG': {}
    },
    'SolarUtil': {
      'FESTIVAL': {}
    },
    'TaoUtil': {
      'BA_HUI': {},
      'BA_JIE': {}
    }
  };

  static final Map<String, Map<String, Map<String, int>>> _dictNumber = {
    'LunarUtil':
    {
      'ZHI_TIAN_SHEN_OFFSET': {},
      'CHANG_SHENG_OFFSET': {}
    }
  };

  static final Map<String, Map<String, Map<String, List<String>>>> _dictArray = {
    'LunarUtil':
    {
      'ZHI_HIDE_GAN': {}
    }
  };

  static final Map<String, Map<String, List<String>>> _arrays = {
    'LunarUtil':
    {
      'GAN': [],
      'ZHI': [],
      'JIA_ZI': [],
      'ZHI_XING': [],
      'XUN': [],
      'XUN_KONG': [],
      'CHONG': [],
      'CHONG_GAN': [],
      'CHONG_GAN_TIE': [],
      'HE_GAN_5': [],
      'HE_ZHI_6': [],
      'SHENGXIAO': [],
      'NUMBER': [],
      'POSITION_XI': [],
      'POSITION_YANG_GUI': [],
      'POSITION_YIN_GUI': [],
      'POSITION_FU': [],
      'POSITION_FU_2': [],
      'POSITION_CAI': [],
      'POSITION_TAI_SUI_YEAR': [],
      'POSITION_GAN': [],
      'POSITION_ZHI': [],
      'JIE_QI': [],
      'JIE_QI_IN_USE': [],
      'TIAN_SHEN': [],
      'SHEN_SHA': [],
      'PENGZU_GAN': [],
      'PENGZU_ZHI': [],
      'MONTH_ZHI': [],
      'CHANG_SHENG': [],
      'HOU': [],
      'WU_HOU': [],
      'POSITION_TAI_DAY': [],
      'POSITION_TAI_MONTH': [],
      'YI_JI': [],
      'LIU_YAO': [],
      'MONTH': [],
      'SEASON': [],
      'DAY': [],
      'YUE_XIANG': [],
    },
    'SolarUtil':
    {
      'WEEK': [],
      'XING_ZUO': [],
    },
    'TaoUtil':
    {
      'AN_WU': [],
    },
    'FotoUtil':
    {
      'XIU_27': [],
    },
    'NineStarUtil':
    {
      'NUMBER': [],
      'WU_XING': [],
      'POSITION': [],
      'LUCK_XUAN_KONG': [],
      'YIN_YANG_QI_MEN': [],
      'COLOR': [],
    }
  };

  static String _replace(String key) {
    String s = key;
    for (RegExpMatch m in _pattern.allMatches(s)) {
      String k = m.group(1)!;
      s = s.replaceAll('{' + k + '}', getMessage(k));
    }
    return s;
  }

  static void _updateArray(String className) {
    Map<String, List<String>> klass = _arrays[className]!;
    for (MapEntry<String, List<String>> prop in klass.entries) {
      String propName = prop.key;
      List<String> propValue = prop.value;
      for (int i = 0, j = propValue.length; i < j; i++) {
        String v = _replace(propValue[i]);
        if ('LunarUtil' == className) {
          if ('GAN' == propName) {
            LunarUtil.GAN[i] = v;
          } else if ('ZHI' == propName) {
            LunarUtil.ZHI[i] = v;
          } else if ('JIA_ZI' == propName) {
            LunarUtil.JIA_ZI[i] = v;
          } else if ('ZHI_XING' == propName) {
            LunarUtil.ZHI_XING[i] = v;
          } else if ('XUN' == propName) {
            LunarUtil.XUN[i] = v;
          } else if ('XUN_KONG' == propName) {
            LunarUtil.XUN_KONG[i] = v;
          } else if ('CHONG' == propName) {
            LunarUtil.CHONG[i] = v;
          } else if ('CHONG_GAN' == propName) {
            LunarUtil.CHONG_GAN[i] = v;
          } else if ('CHONG_GAN_TIE' == propName) {
            LunarUtil.CHONG_GAN_TIE[i] = v;
          } else if ('HE_GAN_5' == propName) {
            LunarUtil.HE_GAN_5[i] = v;
          } else if ('HE_ZHI_6' == propName) {
            LunarUtil.HE_ZHI_6[i] = v;
          } else if ('SHENGXIAO' == propName) {
            LunarUtil.SHENGXIAO[i] = v;
          } else if ('NUMBER' == propName) {
            LunarUtil.NUMBER[i] = v;
          } else if ('POSITION_XI' == propName) {
            LunarUtil.POSITION_XI[i] = v;
          } else if ('POSITION_YANG_GUI' == propName) {
            LunarUtil.POSITION_YANG_GUI[i] = v;
          } else if ('POSITION_YIN_GUI' == propName) {
            LunarUtil.POSITION_YIN_GUI[i] = v;
          } else if ('POSITION_FU' == propName) {
            LunarUtil.POSITION_FU[i] = v;
          } else if ('POSITION_FU_2' == propName) {
            LunarUtil.POSITION_FU_2[i] = v;
          } else if ('POSITION_CAI' == propName) {
            LunarUtil.POSITION_CAI[i] = v;
          } else if ('POSITION_TAI_SUI_YEAR' == propName) {
            LunarUtil.POSITION_TAI_SUI_YEAR[i] = v;
          } else if ('POSITION_GAN' == propName) {
            LunarUtil.POSITION_GAN[i] = v;
          } else if ('POSITION_ZHI' == propName) {
            LunarUtil.POSITION_ZHI[i] = v;
          } else if ('JIE_QI' == propName) {
            LunarUtil.JIE_QI[i] = v;
          } else if ('JIE_QI_IN_USE' == propName) {
            LunarUtil.JIE_QI_IN_USE[i] = v;
          } else if ('TIAN_SHEN' == propName) {
            LunarUtil.TIAN_SHEN[i] = v;
          } else if ('SHEN_SHA' == propName) {
            LunarUtil.SHEN_SHA[i] = v;
          } else if ('PENGZU_GAN' == propName) {
            LunarUtil.PENGZU_GAN[i] = v;
          } else if ('PENGZU_ZHI' == propName) {
            LunarUtil.PENGZU_ZHI[i] = v;
          } else if ('MONTH_ZHI' == propName) {
            LunarUtil.MONTH_ZHI[i] = v;
          } else if ('CHANG_SHENG' == propName) {
            LunarUtil.CHANG_SHENG[i] = v;
          } else if ('HOU' == propName) {
            LunarUtil.HOU[i] = v;
          } else if ('WU_HOU' == propName) {
            LunarUtil.WU_HOU[i] = v;
          } else if ('POSITION_TAI_DAY' == propName) {
            LunarUtil.POSITION_TAI_DAY[i] = v;
          } else if ('POSITION_TAI_MONTH' == propName) {
            LunarUtil.POSITION_TAI_MONTH[i] = v;
          } else if ('YI_JI' == propName) {
            LunarUtil.YI_JI[i] = v;
          } else if ('LIU_YAO' == propName) {
            LunarUtil.LIU_YAO[i] = v;
          } else if ('MONTH' == propName) {
            LunarUtil.MONTH[i] = v;
          } else if ('SEASON' == propName) {
            LunarUtil.SEASON[i] = v;
          } else if ('DAY' == propName) {
            LunarUtil.DAY[i] = v;
          } else if ('YUE_XIANG' == propName) {
            LunarUtil.YUE_XIANG[i] = v;
          }
        } else if ('SolarUtil' == className) {
          if ('WEEK' == propName) {
            SolarUtil.WEEK[i] = v;
          } else if ('XING_ZUO' == propName) {
            SolarUtil.XING_ZUO[i] = v;
          }
        } else if ('TaoUtil' == className) {
          if ('AN_WU' == propName) {
            TaoUtil.AN_WU[i] = v;
          }
        } else if ('FotoUtil' == className) {
          if ('XIU_27' == propName) {
            FotoUtil.XIU_27[i] = v;
          }
        } else if ('NineStarUtil' == className) {
          if ('NUMBER' == propName) {
            NineStarUtil.NUMBER[i] = v;
          } else if ('WU_XING' == propName) {
            NineStarUtil.WU_XING[i] = v;
          } else if ('POSITION' == propName) {
            NineStarUtil.POSITION[i] = v;
          } else if ('LUCK_XUAN_KONG' == propName) {
            NineStarUtil.LUCK_XUAN_KONG[i] = v;
          } else if ('YIN_YANG_QI_MEN' == propName) {
            NineStarUtil.YIN_YANG_QI_MEN[i] = v;
          } else if ('COLOR' == propName) {
            NineStarUtil.COLOR[i] = v;
          }
        }
      }
    }
  }

  static void _updateStringDictionary(String className) {
    Map<String, Map<String, String>> klass = _dictString[className]!;
    for (MapEntry<String, Map<String, String>> prop in klass.entries) {
      String propName = prop.key;
      Map<String, String> propValue = prop.value;
      for (MapEntry<String, String> o in propValue.entries) {
        String k = _replace(o.key);
        String v = _replace(o.value);
        if ('LunarUtil' == className) {
          if ('TIAN_SHEN_TYPE' == propName) {
            LunarUtil.TIAN_SHEN_TYPE[k] = v;
          } else if ('TIAN_SHEN_TYPE_LUCK' == propName) {
            LunarUtil.TIAN_SHEN_TYPE_LUCK[k] = v;
          } else if ('XIU_LUCK' == propName) {
            LunarUtil.XIU_LUCK[k] = v;
          } else if ('LU' == propName) {
            LunarUtil.LU[k] = v;
          } else if ('XIU' == propName) {
            LunarUtil.XIU[k] = v;
          } else if ('SHA' == propName) {
            LunarUtil.SHA[k] = v;
          } else if ('POSITION_DESC' == propName) {
            LunarUtil.POSITION_DESC[k] = v;
          } else if ('NAYIN' == propName) {
            LunarUtil.NAYIN[k] = v;
          } else if ('WU_XING_GAN' == propName) {
            LunarUtil.WU_XING_GAN[k] = v;
          } else if ('WU_XING_ZHI' == propName) {
            LunarUtil.WU_XING_ZHI[k] = v;
          } else if ('SHOU' == propName) {
            LunarUtil.SHOU[k] = v;
          } else if ('GONG' == propName) {
            LunarUtil.GONG[k] = v;
          } else if ('FESTIVAL' == propName) {
            LunarUtil.FESTIVAL[k] = v;
          } else if ('ZHENG' == propName) {
            LunarUtil.ZHENG[k] = v;
          } else if ('ANIMAL' == propName) {
            LunarUtil.ANIMAL[k] = v;
          } else if ('SHI_SHEN_GAN' == propName) {
            LunarUtil.SHI_SHEN_GAN[k] = v;
          } else if ('SHI_SHEN_ZHI' == propName) {
            LunarUtil.SHI_SHEN_ZHI[k] = v;
          } else if ('XIU_SONG' == propName) {
            LunarUtil.XIU_SONG[k] = v;
          }
        } else if ('SolarUtil' == className) {
          if ('FESTIVAL' == propName) {
            SolarUtil.FESTIVAL[k] = v;
          }
        } else if ('TaoUtil' == className) {
          if ('BA_HUI' == propName) {
            TaoUtil.BA_HUI[k] = v;
          } else if ('BA_JIE' == propName) {
            TaoUtil.BA_JIE[k] = v;
          }
        }
      }
    }
  }

  static void _updateNumberDictionary(String className) {
    Map<String, Map<String, int>> klass = _dictNumber[className]!;
    for (MapEntry<String, Map<String, int>> prop in klass.entries) {
      String propName = prop.key;
      Map<String, int> propValue = prop.value;
      for (MapEntry<String, int> o in propValue.entries) {
        String k = _replace(o.key);
        int v = o.value;
        if ('LunarUtil' == className) {
          if ('ZHI_TIAN_SHEN_OFFSET' == propName) {
            LunarUtil.ZHI_TIAN_SHEN_OFFSET[k] = v;
          } else if ('CHANG_SHENG_OFFSET' == propName) {
            LunarUtil.CHANG_SHENG_OFFSET[k] = v;
          }
        }
      }
    }
  }

  static void _updateArrayDictionary(String className) {
    Map<String, Map<String, List<String>>> klass = _dictArray[className]!;
    for (MapEntry<String, Map<String, List<String>>> prop in klass.entries) {
      String propName = prop.key;
      Map<String, List<String>> propValue = prop.value;
      for (MapEntry<String, List<String>> o in propValue.entries) {
        List<String> nv = [];
        for (String v in o.value) {
          nv.add(_replace(v));
        }
        if ('LunarUtil' == className) {
          if ('ZHI_HIDE_GAN' == propName) {
            LunarUtil.ZHI_HIDE_GAN[_replace(o.key)] = nv;
          }
        }
      }
    }
  }

  static void _update() {
    for (String c in _arrays.keys) {
      _updateArray(c);
    }
    for (String c in _dictString.keys) {
      _updateStringDictionary(c);
    }
    for (String c in _dictNumber.keys) {
      _updateNumberDictionary(c);
    }
    for (String c in _dictArray.keys) {
      _updateArrayDictionary(c);
    }
  }

  static void _initArray() {
    Map<String, List<String>> klass = _arrays['LunarUtil']!;
    List<String> v = [];
    for (String s in LunarUtil.GAN) {
      v.add(s);
    }
    klass['GAN'] = v;

    v = [];
    for (String s in LunarUtil.ZHI) {
      v.add(s);
    }
    klass['ZHI'] = v;

    v = [];
    for (String s in LunarUtil.JIA_ZI) {
      v.add(s);
    }
    klass['JIA_ZI'] = v;

    v = [];
    for (String s in LunarUtil.ZHI_XING) {
      v.add(s);
    }
    klass['ZHI_XING'] = v;

    v = [];
    for (String s in LunarUtil.XUN) {
      v.add(s);
    }
    klass['XUN'] = v;

    v = [];
    for (String s in LunarUtil.XUN_KONG) {
      v.add(s);
    }
    klass['XUN_KONG'] = v;

    v = [];
    for (String s in LunarUtil.CHONG) {
      v.add(s);
    }
    klass['CHONG'] = v;

    v = [];
    for (String s in LunarUtil.CHONG_GAN) {
      v.add(s);
    }
    klass['CHONG_GAN'] = v;

    v = [];
    for (String s in LunarUtil.CHONG_GAN_TIE) {
      v.add(s);
    }
    klass['CHONG_GAN_TIE'] = v;

    v = [];
    for (String s in LunarUtil.HE_GAN_5) {
      v.add(s);
    }
    klass['HE_GAN_5'] = v;

    v = [];
    for (String s in LunarUtil.HE_ZHI_6) {
      v.add(s);
    }
    klass['HE_ZHI_6'] = v;

    v = [];
    for (String s in LunarUtil.SHENGXIAO) {
      v.add(s);
    }
    klass['SHENGXIAO'] = v;

    v = [];
    for (String s in LunarUtil.NUMBER) {
      v.add(s);
    }
    klass['NUMBER'] = v;

    v = [];
    for (String s in LunarUtil.POSITION_XI) {
      v.add(s);
    }
    klass['POSITION_XI'] = v;

    v = [];
    for (String s in LunarUtil.POSITION_YANG_GUI) {
      v.add(s);
    }
    klass['POSITION_YANG_GUI'] = v;

    v = [];
    for (String s in LunarUtil.POSITION_YIN_GUI) {
      v.add(s);
    }
    klass['POSITION_YIN_GUI'] = v;

    v = [];
    for (String s in LunarUtil.POSITION_FU) {
      v.add(s);
    }
    klass['POSITION_FU'] = v;

    v = [];
    for (String s in LunarUtil.POSITION_FU_2) {
      v.add(s);
    }
    klass['POSITION_FU_2'] = v;

    v = [];
    for (String s in LunarUtil.POSITION_CAI) {
      v.add(s);
    }
    klass['POSITION_CAI'] = v;

    v = [];
    for (String s in LunarUtil.POSITION_TAI_SUI_YEAR) {
      v.add(s);
    }
    klass['POSITION_TAI_SUI_YEAR'] = v;

    v = [];
    for (String s in LunarUtil.POSITION_GAN) {
      v.add(s);
    }
    klass['POSITION_GAN'] = v;

    v = [];
    for (String s in LunarUtil.POSITION_ZHI) {
      v.add(s);
    }
    klass['POSITION_ZHI'] = v;

    v = [];
    for (String s in LunarUtil.JIE_QI) {
      v.add(s);
    }
    klass['JIE_QI'] = v;

    v = [];
    for (String s in LunarUtil.JIE_QI_IN_USE) {
      v.add(s);
    }
    klass['JIE_QI_IN_USE'] = v;

    v = [];
    for (String s in LunarUtil.TIAN_SHEN) {
      v.add(s);
    }
    klass['TIAN_SHEN'] = v;

    v = [];
    for (String s in LunarUtil.SHEN_SHA) {
      v.add(s);
    }
    klass['SHEN_SHA'] = v;

    v = [];
    for (String s in LunarUtil.PENGZU_GAN) {
      v.add(s);
    }
    klass['PENGZU_GAN'] = v;

    v = [];
    for (String s in LunarUtil.PENGZU_ZHI) {
      v.add(s);
    }
    klass['PENGZU_ZHI'] = v;

    v = [];
    for (String s in LunarUtil.MONTH_ZHI) {
      v.add(s);
    }
    klass['MONTH_ZHI'] = v;

    v = [];
    for (String s in LunarUtil.CHANG_SHENG) {
      v.add(s);
    }
    klass['CHANG_SHENG'] = v;

    v = [];
    for (String s in LunarUtil.HOU) {
      v.add(s);
    }
    klass['HOU'] = v;

    v = [];
    for (String s in LunarUtil.WU_HOU) {
      v.add(s);
    }
    klass['WU_HOU'] = v;

    v = [];
    for (String s in LunarUtil.POSITION_TAI_DAY) {
      v.add(s);
    }
    klass['POSITION_TAI_DAY'] = v;

    v = [];
    for (String s in LunarUtil.POSITION_TAI_MONTH) {
      v.add(s);
    }
    klass['POSITION_TAI_MONTH'] = v;

    v = [];
    for (String s in LunarUtil.YI_JI) {
      v.add(s);
    }
    klass['YI_JI'] = v;

    v = [];
    for (String s in LunarUtil.LIU_YAO) {
      v.add(s);
    }
    klass['LIU_YAO'] = v;

    v = [];
    for (String s in LunarUtil.MONTH) {
      v.add(s);
    }
    klass['MONTH'] = v;

    v = [];
    for (String s in LunarUtil.SEASON) {
      v.add(s);
    }
    klass['SEASON'] = v;

    v = [];
    for (String s in LunarUtil.DAY) {
      v.add(s);
    }
    klass['DAY'] = v;

    v = [];
    for (String s in LunarUtil.YUE_XIANG) {
      v.add(s);
    }
    klass['YUE_XIANG'] = v;

    klass = _arrays['SolarUtil']!;

    v = [];
    for (String s in SolarUtil.WEEK) {
      v.add(s);
    }
    klass['WEEK'] = v;

    v = [];
    for (String s in SolarUtil.XING_ZUO) {
      v.add(s);
    }
    klass['XING_ZUO'] = v;

    klass = _arrays['TaoUtil']!;
    v = [];
    for (String s in TaoUtil.AN_WU) {
      v.add(s);
    }
    klass['AN_WU'] = v;

    klass = _arrays['FotoUtil']!;
    v = [];
    for (String s in FotoUtil.XIU_27) {
      v.add(s);
    }
    klass['XIU_27'] = v;

    klass = _arrays['NineStarUtil']!;
    v = [];
    for (String s in NineStarUtil.NUMBER) {
      v.add(s);
    }
    klass['NUMBER'] = v;

    v = [];
    for (String s in NineStarUtil.WU_XING) {
      v.add(s);
    }
    klass['WU_XING'] = v;

    v = [];
    for (String s in NineStarUtil.POSITION) {
      v.add(s);
    }
    klass['POSITION'] = v;

    v = [];
    for (String s in NineStarUtil.LUCK_XUAN_KONG) {
      v.add(s);
    }
    klass['LUCK_XUAN_KONG'] = v;

    v = [];
    for (String s in NineStarUtil.YIN_YANG_QI_MEN) {
      v.add(s);
    }
    klass['YIN_YANG_QI_MEN'] = v;

    v = [];
    for (String s in NineStarUtil.COLOR) {
      v.add(s);
    }
    klass['COLOR'] = v;
  }

  static void _initStringDictionary() {
    Map<String, Map<String, String>> v = _dictString['LunarUtil']!;
    for (MapEntry<String, String> o in LunarUtil.TIAN_SHEN_TYPE.entries) {
      v['TIAN_SHEN_TYPE']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.TIAN_SHEN_TYPE_LUCK.entries) {
      v['TIAN_SHEN_TYPE_LUCK']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.XIU_LUCK.entries) {
      v['XIU_LUCK']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.LU.entries) {
      v['LU']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.XIU.entries) {
      v['XIU']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.SHA.entries) {
      v['SHA']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.POSITION_DESC.entries) {
      v['POSITION_DESC']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.NAYIN.entries) {
      v['NAYIN']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.WU_XING_GAN.entries) {
      v['WU_XING_GAN']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.WU_XING_ZHI.entries) {
      v['WU_XING_ZHI']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.SHOU.entries) {
      v['SHOU']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.GONG.entries) {
      v['GONG']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.FESTIVAL.entries) {
      v['FESTIVAL']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.ZHENG.entries) {
      v['ZHENG']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.ANIMAL.entries) {
      v['ANIMAL']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.SHI_SHEN_GAN.entries) {
      v['SHI_SHEN_GAN']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.SHI_SHEN_ZHI.entries) {
      v['SHI_SHEN_ZHI']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in LunarUtil.XIU_SONG.entries) {
      v['XIU_SONG']![o.key] = o.value;
    }

    v = _dictString['SolarUtil']!;
    for (MapEntry<String, String> o in SolarUtil.FESTIVAL.entries) {
      v['FESTIVAL']![o.key] = o.value;
    }

    v = _dictString['TaoUtil']!;
    for (MapEntry<String, String> o in TaoUtil.BA_HUI.entries) {
      v['BA_HUI']![o.key] = o.value;
    }
    for (MapEntry<String, String> o in TaoUtil.BA_JIE.entries) {
      v['BA_JIE']![o.key] = o.value;
    }
  }

  static void _initNumberDictionary() {
    Map<String, Map<String, int>> v = _dictNumber['LunarUtil']!;
    for (MapEntry<String, int> o in LunarUtil.ZHI_TIAN_SHEN_OFFSET.entries) {
      v['ZHI_TIAN_SHEN_OFFSET']![o.key] = o.value;
    }
    for (MapEntry<String, int> o in LunarUtil.CHANG_SHENG_OFFSET.entries) {
      v['CHANG_SHENG_OFFSET']![o.key] = o.value;
    }
  }

  static void _initArrayDictionary() {
    Map<String, Map<String, List<String>>> v = _dictArray['LunarUtil']!;
    Map<String, List<String>> m = v['ZHI_HIDE_GAN']!;
    for (MapEntry<String, List<String>> o in LunarUtil.ZHI_HIDE_GAN.entries) {
      m[o.key] = [];
      for (String s in o.value) {
        m[o.key]!.add(s);
      }
    }
  }

  static void setLanguage(String lang) {
    init();
    if (_messages.containsKey(lang)) {
      _lang = lang;
      _update();
    }
  }

  static String getLanguage() {
    init();
    return _lang;
  }

  static void setMessages(String lang, Map<String, String> messages) {
    init();
    Map<String, String>? v = _messages[lang];
    if (null == v) {
      v = {};
      _messages[lang] = v;
    }
    for (MapEntry<String, String> entry in messages.entries) {
      v[entry.key] = entry.value;
    }
    _update();
  }

  static String getMessage(String key) {
    init();
    Map<String, String>? messages = _messages[_lang];
    String? value;
    if (null != messages) {
      value = messages[key];
    }
    if (null == value) {
      messages = _messages[DEFAULT_LANG];
    }
    if (null != messages) {
      value = messages[key];
    }
    return null == value ? key : value;
  }

  static void init() {
    if (_inited) {
      return;
    }
    _inited = true;
    _initArray();
    _initStringDictionary();
    _initNumberDictionary();
    _initArrayDictionary();
    _update();
  }

}
