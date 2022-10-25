
 import 'package:flutter/material.dart';

class AppThemeColor{
  static final Color app_default_color = Colors.indigo;   //app 主题默认颜色
  static final Color app_white_bg_color = ColorUtil.fromHex("#ffffff");   //app 主题默认颜色
  static final Color app_font_hig_color = ColorUtil.fromHex("#fc7330");   //文本高亮颜色
  static final Color app_font_text_color = ColorUtil.fromHex("#2b2b2e");  //一般文本显示颜色
  static final Color app_font_default_color = ColorUtil.fromHex("#999aa1");  //默认文本辅助颜色
  static final Color app_bg_grey = ColorUtil.fromHex("#f2f6f8");  //背景灰色


  static final Color app_text_select_color = ColorUtil.fromHex("#09a216");  //字体选中的颜色
  static final Color app_text_no_select_color = ColorUtil.fromHex("#8a8a8a");  //字体没选中的颜色
  static final Color app_search_bg_color = ColorUtil.fromHex("#f1f1f1");  //搜索框背景颜色

 }

 class ColorUtil {
   /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
   static Color fromHex(String hexString) {
     final buffer = StringBuffer();
     if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
     buffer.write(hexString.replaceFirst('#', ''));
     return Color(int.parse(buffer.toString(), radix: 16));
   }
 }






