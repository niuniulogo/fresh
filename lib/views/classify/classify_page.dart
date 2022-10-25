import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh/config/config.dart';
import 'package:fresh/views/classify/search_history.dart';
import 'package:fresh/views/routers.dart';
import 'package:get/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:animations/animations.dart';
class ClassifyPage extends StatefulWidget {
  ClassifyPage({Key? key}) : super(key: key);

  @override
  State<ClassifyPage> createState() => _ClassifyPageState();
}

class _ClassifyPageState extends State<ClassifyPage>
    with AutomaticKeepAliveClientMixin {

  ContainerTransitionType _transitionType = ContainerTransitionType.fadeThrough;
  List<Map<String, dynamic>> leftList = [
    {'index': 1, 'title': '水果蔬菜', 'value': '999'},
    {'index': 2, 'title': '肉禽蛋品'},
    {'index': 3, 'title': '海鲜水产'},
    {'index': 4, 'title': '速食冷冻'},
    {'index': 5, 'title': '粮油米面'},
    {'index': 6, 'title': '国际进口'},
  ];
  ScrollController scrollController = ScrollController();
  PageController pageController = PageController();

  List tablist = ['全部', '热带水果', '樱桃草莓', '柑橘橙桂', '奇异果', '苹果梨蕉', '葱姜蒜'];

// 设置 true 期望保持页面状态
  @override
  bool get wantKeepAlive => true;
  int _selectIndex = 0;
  int _selectTab = 0;

  @override
  void initState() {
    super.initState();
    // 给列表滚动添加监听
    this.scrollController.addListener(() {
      // 滑动到底部的判断
      if (this.scrollController.position.pixels - 100 >=
          this.scrollController.position.maxScrollExtent) {
        print('footer');
      }
    });
  }

  @override
  void dispose() {
    // 组件销毁时，释放资源
    super.dispose();
    this.scrollController.dispose();
  }
  void _showMarkedAsDoneSnackbar(bool? isMarkedAsDone) {
    if (isMarkedAsDone ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Marked as done!'),
      ));
    }
  }

  //首页搜索栏
  Widget get_search_widget() {
    return OpenContainer<bool>(
      closedColor:Colors.white,
      transitionType: _transitionType,
      openColor: Colors.white,
      transitionDuration:Duration(milliseconds: 700),
      openBuilder: (BuildContext _, VoidCallback openContainer) {
        return const SearchHistory();
      },
      onClosed: (bool){},
      tappable: false,
      closedShape: const RoundedRectangleBorder(),
      closedElevation: 0.0,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return InkWell(
          onTap: openContainer,
          child: Container(
            height: 35,
            padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
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
                Container(
                    margin: EdgeInsets.only(right: 4),
                    child: Lottie.asset('images/run.json', width: 40))
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        title: get_search_widget(),
        shadowColor: Colors.transparent,
      ),
      body: Row(
        children: [
          Container(
            width: 80,
            height: double.maxFinite,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, int) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectIndex = int;
                      pageController.animateToPage(int,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    });
                  },
                  child: Container(
                      height: 45,
                      color: _selectIndex == int
                          ? Colors.white70
                          : Colors.transparent,
                      child: Center(
                          child: Text(
                        leftList[int]['title'],
                        style: TextStyle(
                          color:
                              _selectIndex == int ? Colors.green : Colors.black,
                          fontSize: _selectIndex == int ? 15 : 14,
                          fontWeight: _selectIndex == int
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ))),
                );
              },
              itemCount: leftList.length,
            ),
            color: Colors.grey[200],
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 40),
                    child: PageView(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (e) {
                        setState(() {
                          _selectIndex = e;
                        });
                      },
                      children: [
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            controller: scrollController,
                            itemBuilder: (content, int) {
                              return int == 29
                                  ? Container(
                                      child: Text("水果蔬菜已到底"),
                                    )
                                  : Container(
                                      margin: EdgeInsets.only(
                                          top: 0,
                                          left: 10,
                                          right: 10,
                                          bottom: 10),
                                      padding: EdgeInsets.all(10),
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.network(
                                            'https://img2.baidu.com/it/u=2271096910,2440587446&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
                                            width: 100,
                                            height: 100,
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '四川眉山青橙38号礼盒装 果冻橙🍊',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '有机食品 | 水果',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Colors.grey[500]),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2),
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                        .deepOrange[
                                                                    100],
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .redAccent,
                                                                    width: 0.5),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2)),
                                                            child: Text(
                                                              '特价',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .redAccent,
                                                                  fontSize: 8),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2),
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .green,
                                                                    width: 0.5),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2)),
                                                            child: Text('24H发货',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .green,
                                                                    fontSize:
                                                                        8)),
                                                          )
                                                        ],
                                                      ),
                                                      Text(
                                                        '¥ 39.9/份',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .deepOrange,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ));
                            },
                            itemCount: 30,
                          ),
                        ),
                        Container(
                          child: Center(child: Text('肉禽蛋品 \nthis page todo!!')),
                        ),
                        Container(
                          child: Center(child: Text('海鲜水产\nthis page todo')),
                        ),
                        Container(
                          child: Center(child: Text('速冻冷食\nthis page todo')),
                        ),
                        Container(
                          child: Center(child: Text('粮油米面\nthis page todo')),
                        ),
                        Container(
                          child: Center(child: Text('国际进口\nthis page todo')),
                        )
                      ],
                    )),
                Container(
                  height: 35,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey, //底色,阴影颜色
                      offset: Offset(1, 1), //阴影位置,从什么位置开始
                      blurRadius: 1, // 阴影模糊层度
                      spreadRadius: 0,
                    )
                  ]),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: 5, top: 6, right: 10, bottom: 6),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectTab = index;
                            });
                          },
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.only(left: 0,right: 0)),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                (states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    //按下时的颜色
                                    return Colors.green;
                                  }
                                  //默认状态使用灰色
                                  return _selectTab == index
                                      ? Colors.green[300]
                                      : Colors.grey[400];
                                },
                              )),
                          child: Text(tablist[index],style: TextStyle(fontSize: 12),),
                        ),
                      );
                    },
                    itemCount: tablist.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
