# lunar [![License](https://img.shields.io/badge/license-MIT-4EB1BA.svg?style=flat-square)](https://github.com/6tail/lunar-flutter/blob/master/LICENSE)

lunar是一款无第三方依赖的日历工具，支持公历(阳历)、农历(阴历、老黄历)、道历、佛历，支持星座、儒略日、干支、生肖、节气、节日、彭祖百忌、吉神(喜神/福神/财神/阳贵神/阴贵神)方位、胎神方位、冲煞、纳音、星宿、八字、五行、十神、建除十二值星、青龙名堂等十二神、黄道日及吉凶、法定节假日及调休等。

> 自v1.2.22起，最低要求flutter 2.0.0、dart 2.12.0。

## 示例

    dependencies:
      lunar: ^1.7.4
     
    import 'package:lunar/lunar.dart';
     
    void main() {
      //今天
      //Lunar date = Lunar.fromDate(DateTime.now());
               
      //指定阴历的某一天
      Lunar date = Lunar.fromYmd(1986, 4, 21);
      print(date.toFullString());
      print(date.getSolar().toFullString());
    }

输出结果：

    一九八六年四月廿一 丙寅(虎)年 癸巳(蛇)月 癸酉(鸡)日 子(鼠)时 纳音[炉中火 长流水 剑锋金 桑柘木] 星期四 北方玄武 星宿[斗木獬](吉) 彭祖百忌[癸不词讼理弱敌强 酉不会客醉坐颠狂] 喜神方位[巽](东南) 阳贵神方位[巽](东南) 阴贵神方位[震](正东) 福神方位[兑](正西) 财神方位[离](正南) 冲[(丁卯)兔] 煞[东]
    1986-05-29 00:00:00 星期四 双子座

## 文档

请移步至 [https://6tail.cn/calendar/api.html](https://6tail.cn/calendar/api.html "https://6tail.cn/calendar/api.html")

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=6tail/lunar-flutter&type=Date)](https://star-history.com/#6tail/lunar-flutter&Date)
