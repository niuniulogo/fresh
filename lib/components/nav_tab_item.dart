
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh/config/config.dart';

class NavTabItem extends StatelessWidget {
  String lable;
  String selectSvg;
  String defaultSvg;
  int selectIndex;
  int lableIndex;
  NavTabItem({
    Key? key,
    required this.selectIndex,
    required this.lableIndex,
    required this.lable,
    required this.selectSvg,
    required this.defaultSvg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 70.0,
      padding: EdgeInsets.only(bottom: 15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, anim1) {
                return ScaleTransition(child: child, scale: anim1);
              },
              child: selectIndex == lableIndex
                  ? SvgPicture.asset(selectSvg,
                      width: 28, height: 28, key: ValueKey("selectSvg"))
                  : SvgPicture.asset(defaultSvg,
                      width: 28, height: 28, key: ValueKey("defaultSvg")),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (child, anim1) {
                return FadeTransition(child: child, opacity: anim1);
              },
              child: selectIndex == lableIndex
                  ? Text(
                      lable,
                      style: TextStyle(
                          color: AppThemeColor.app_text_select_color,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      lable,
                      style: TextStyle(
                          color: AppThemeColor.app_text_no_select_color),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
