import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh/config/config.dart';




//金刚区每个图标
class JinGangItem extends StatelessWidget {
  String lable;
  String url;

  JinGangItem(
      {Key? key, required this.lable, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              url,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            lable,
            style: TextStyle(fontSize: 13, color: AppThemeColor.app_text_no_select_color),
          )
        ],
      ),
    );
  }
}
