
import 'package:flutter/material.dart';

class MenuTab extends StatefulWidget {
  final Function? onPress;
  final List<Map<String, dynamic>> menuList;

  const MenuTab({Key? key, required this.menuList, this.onPress})
      : super(key: key);

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  final ScrollController _controller = ScrollController();
  late String currerValue = "1";
  final GlobalKey menuTabListKey = GlobalKey();

  List<Widget> generateMenuTabList() {
    List<Widget> menuTabList = [];
    for (var i = 0; i < widget.menuList.length; i++) {
      menuTabList.add(
        InkResponse(
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.menuList[i]["text"],
                      style: TextStyle(
                          fontSize: 14,
                          color: currerValue ==
                              widget.menuList[i]["value"] as String
                              ? Colors.green
                              : Colors.black)),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding:
                    EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
                    child: Text(widget.menuList[i]["lable"],
                        style: TextStyle(
                            fontSize: 10,
                            color: currerValue ==
                                widget.menuList[i]["value"] as String
                                ? Colors.white
                                : Colors.grey)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                        currerValue == widget.menuList[i]["value"] as String
                            ? Colors.green
                            : Colors.transparent),
                  )
                ],
              )),
          onTap: () {
            chosenTab(widget.menuList[i], i);
            if (widget.onPress != null) {
              widget.onPress!(widget.menuList[i]);
            }
          },
        ),
      );
    }
    return menuTabList;
  }

  void chosenTab(item, int index) {
    double containerWidth = menuTabListKey.currentContext!.size!.width;
    if (containerWidth / 2 < ((index + 1) * 100 - 50)) {
      _controller.animateTo((index + 1) * 100 - containerWidth / 2,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    } else {
      _controller.animateTo(0,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }
    setState(() {
      currerValue = item['value'] as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: menuTabListKey,
      scrollDirection: Axis.horizontal,
      controller: _controller,
      children: generateMenuTabList(),
    );
  }
}