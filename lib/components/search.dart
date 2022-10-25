import 'package:fresh/config/config.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final double? height; // 高度
  final double? width; // 宽度
  final String? hintText; // 输入提示
  final ValueChanged<String>? onEditingComplete; // 编辑完成的事件回调

  const SearchWidget(
      {Key? key,
        this.height,
        this.width,
        this.hintText,
        this.onEditingComplete})
      : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  /// 清除查询关键词
  clearKeywords() {
    controller.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      var width = widget.width ?? constrains.maxWidth ; // 父级宽度
      var height = widget.width ?? widget.height ?? 40;
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[200],
            // border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(height)),
        child: TextField(
            controller: controller,
            decoration: InputDecoration(

                hintText: widget.hintText ?? "请输入目的地",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                contentPadding: EdgeInsets.only(top: 4),
                border: InputBorder.none,
                icon: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 2),
                    child: Icon(
                      Icons.search,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    )),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 18,
                  ),
                  onPressed: clearKeywords,
                  splashColor: Theme.of(context).primaryColor,
                )),
            onEditingComplete: () {
              widget.onEditingComplete?.call(controller.text);
              FocusScope.of(context).requestFocus(FocusNode());//关闭键盘

            }),
      );
    });
  }
}



