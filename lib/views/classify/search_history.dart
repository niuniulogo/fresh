import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh/config/config.dart';
import 'package:get/get.dart';

//历史搜索记录
class SearchHistory extends StatefulWidget {
  const SearchHistory({Key? key}) : super(key: key);

  @override
  _SearchHistoryState createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {
  List history_list_title = [
    '果粒橙',
    '铁棍山药',
    '铁棍山药',
    '青菜萝卜',
    '芒果',
    '卷心菜',
    '大蒜',

    '地瓜',

  ];
  List hot_title = [
    '1.车厘子',
    '2.草莓',
    '3.火锅到家',
    '4.精选红酒',
    '5.馋嘴零食，冷热饮',
    '6.新鲜大虾仁',
    '7.高颜值好口味',
    '8.精美平安果'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: get_search_widget(),
        leadingWidth: 50,
        titleSpacing: 0,
        actions: [
          InkWell(
              onTap: () {
                Get.snackbar('title', '点击类搜索');
              },
              child:
                  Container(width: 40, height: 40, child: Icon(Icons.add_shopping_cart))),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '历史搜索',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        Icons.delete,
                        size: 20,
                        color: Colors.grey[400],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 10, //主轴上子控件的间距
                    children: List.generate(
                      history_list_title.length,
                      (int) {
                        return Chip(
                          label: Text(
                            history_list_title[int],
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500]),
                          ),
                          backgroundColor: Colors.grey[200],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '实时热搜',
                        style: TextStyle(fontSize: 16),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 10, //主轴上子控件的间距
                    children: List.generate(
                      hot_title.length,
                          (int) {
                        return Chip(
                          label: Text(
                            hot_title[int],
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500]),
                          ),
                          backgroundColor: Colors.grey[200],
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //首页搜索栏
  Widget get_search_widget() {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: AppThemeColor.app_search_bg_color,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                'images/search.svg',
                width: 22,
                height: 22,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "吃出美好生活",
                style: TextStyle(
                    fontSize: 14,
                    color: AppThemeColor.app_text_no_select_color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
