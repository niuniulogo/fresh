import 'package:flutter/material.dart';
import 'package:fresh/components/nav_tab_item.dart';
import 'package:fresh/config/config.dart';
import 'package:fresh/views/classify/classify_page.dart';
import 'package:fresh/views/home/home_page.dart';
import 'package:fresh/views/my/my_page.dart';
import 'package:fresh/views/my/my_page_controller.dart';
import 'package:fresh/views/shop_car/shop_car_page.dart';
import 'package:get/get.dart';

class NavTabs extends StatefulWidget {
  const NavTabs({Key? key}) : super(key: key);

  @override
  _NavTabsState createState() => _NavTabsState();
}

class _NavTabsState extends State<NavTabs> {
  /*
  * 当前选择的页面 下标 默认下标为0 即首页
  * 1--->分类页面
  * 2--->购物车页面
  * 3--->我的页面
  * */
  int _selectIndex = 0;
  late final GlobalKey<ScaffoldState> globalkeyqq;
  late final List<Widget> _pageList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    globalkeyqq = GlobalKey();
    _pageList = [
      HomePage(),
      ClassifyPage(),
      ShopCarPage(),
      MyPage(globalkey: globalkeyqq),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalkeyqq,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Container(
        width: Get.width * .8,
        color: Colors.white,
        padding: EdgeInsets.only(top: 40,),
        child: Column(
          children: [
            Text('设置',style: TextStyle(fontSize: 16),),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.lightGreen[100],
              margin:EdgeInsets.only(top: 10),
                child: Row(
              children: [
                Icon(Icons.account_box,color: Colors.grey[500],size: 26,),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '个人信息',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '头像，昵称，收获地址等',
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      )
                    ],
                  ),
                )
              ],
            )),
            Container(
                padding: EdgeInsets.all(10),
                color: Colors.lightGreen[100],
                margin:EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Icon(Icons.account_box,color: Colors.grey[500],size: 26,),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '个人信息',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            '头像，昵称，收获地址等',
                            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                          )
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _selectIndex,
              children: _pageList,
            ),
          ),
          Divider(
            height: 2,
            color: AppThemeColor.app_font_default_color,
          ),
          Container(
            height: 80,
            color: Color.fromRGBO(207, 245, 210, 0.1),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      this._selectIndex = 0;
                    });
                  },
                  child: NavTabItem(
                    selectIndex: _selectIndex,
                    lableIndex: 0,
                    lable: '首页',
                    selectSvg: 'images/home-select.svg',
                    defaultSvg: 'images/home.svg',
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      this._selectIndex = 1;
                    });
                  },
                  child: NavTabItem(
                    selectIndex: _selectIndex,
                    lableIndex: 1,
                    lable: '分类',
                    selectSvg: 'images/category-select.svg',
                    defaultSvg: 'images/category.svg',
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectIndex = 2;
                    });
                  },
                  child: NavTabItem(
                    selectIndex: _selectIndex,
                    lableIndex: 2,
                    lable: '购物车',
                    selectSvg: 'images/car-select.svg',
                    defaultSvg: 'images/car.svg',
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectIndex = 3;
                      Get.find<MyPageController>().get_user_info();
                    });
                  },
                  child: NavTabItem(
                    selectIndex: _selectIndex,
                    lableIndex: 3,
                    lable: '我的',
                    selectSvg: 'images/my-select.svg',
                    defaultSvg: 'images/my.svg',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
