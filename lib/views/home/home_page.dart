import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh/components/com_swiper.dart';
import 'package:fresh/components/item_goods_info.dart';
import 'package:fresh/components/jingang_item.dart';
import 'package:fresh/components/menu_tab.dart';
import 'package:fresh/config/config.dart';
import 'package:lottie/lottie.dart';
import 'package:piu_animation/piu_animation.dart';
import 'package:piu_animation/piu_loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //头部金刚区
  List<String> imageList = [
    "images/bander-1.jpeg",
    "images/bander-2.jpeg",
    "images/bander-3.jpeg",
    "images/bander-4.jpeg",
    "images/bander-5.jpeg",
    "images/bander-6.jpeg",
  ];

  @override
  void initState() {
    super.initState();
  }

  //用于加入购物车动画
  GlobalKey rootKey = GlobalKey();
  GlobalKey topCenterKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: -3,
        backgroundColor: Colors.green,
        leading: Lottie.asset('images/1.json', height: 30, width: 30),
        leadingWidth: 30,
        title: Container(
          width: mq.size.width * 0.35,
          child: Text(
            '郑州  外贸小区',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        toolbarHeight: 50,
        actions: [
          Lottie.asset('images/scan.json', width: 18),
          SizedBox(
            width: 12,
          ),
          SvgPicture.asset(
            'images/messages.svg',
            width: 22,
            height: 22,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Stack(
        key: rootKey,
        children: [
          Opacity(
            opacity: 0,
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: CustomScrollView(
              slivers: [
                _getAppBar(),
                _buildStickyBar(),
                //瀑布流
                SliverToBoxAdapter(
                  child: MasonryGridView.count(
                    // 展示几列
                    crossAxisCount: 2,
                    // 元素总个数
                    itemCount: imgList.length,
                    // 单个子元素
                    itemBuilder: (BuildContext context, int index) =>
                        itemWidget(index),
                    // 纵向元素间距
                    mainAxisSpacing: 10,
                    // 横向元素间距
                    crossAxisSpacing: 10,
                    //本身不滚动，让外面的singlescrollview来滚动
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true, //收缩，让元素宽度自适应
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 110,
            bottom: -50,
            child: Container(
              key: topCenterKey,
              width: 50,
              height: 50,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  //超划算 板块
  SliverAppBar _getAppBar() {
    return SliverAppBar(
      pinned: false,
      expandedHeight: 440,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          child: Column(
            children: [
              _getSizeBox(10),

              _getSizeBox(10),
              get_swiper_widget(context),
              _getSizeBox(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  JinGangItem(
                    lable: '水果蔬菜',
                    url: 'images/jingang-1.jpeg',
                  ),
                  JinGangItem(
                    lable: '肉禽蛋奶',
                    url: 'images/jingang-2.jpeg',
                  ),
                  JinGangItem(
                    lable: '海鲜水产',
                    url: 'images/jingang-3.jpeg',
                  ),
                  JinGangItem(
                    lable: '速食冷冻',
                    url: 'images/jingang-4.png',
                  ),
                  JinGangItem(
                    lable: '粮油米面',
                    url: 'images/jingang-5.jpeg',
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "超划算",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppThemeColor
                                          .app_text_no_select_color,
                                    ),
                                  ),
                                  Container(
                                    // color: Colors.indigoAccent,
                                    child: Lottie.asset('images/wandou.json',
                                        width: 40),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '更多',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 1),
                                    // color: Colors.indigoAccent,
                                    child: Lottie.asset('images/arrow.json',
                                        width: 16),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              addCart(topCenterKey, 'images/sg-1.jpeg');
                            },
                            child: ItemGoodInfo(
                              goodUrl: 'images/sg-1.jpeg',
                              goodTitle: '四川柑橙36号品种品种品种',
                              goodPrice: 39.9,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              addCart(topCenterKey, 'images/sg-2.jpeg');
                            },
                            child: ItemGoodInfo(
                              goodUrl: 'images/sg-2.jpeg',
                              goodTitle: '新疆火锅牛肉卷',
                              goodPrice: 60,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              addCart(topCenterKey, 'images/sg-3.jpeg');
                            },
                            child: ItemGoodInfo(
                              goodUrl: 'images/sg-3.jpeg',
                              goodTitle: '本地新鲜蔬菜',
                              goodPrice: 60,
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //中间空格距离
  Widget _getSizeBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  List imgList = [
    "https://img1.baidu.com/it/u=3811304639,1862636957&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333",
    "https://img2.baidu.com/it/u=961178055,2111613824&fm=253&fmt=auto&app=138&f=PNG?w=500&h=622",
    "https://img2.baidu.com/it/u=2798420117,1143213005&fm=253&fmt=auto&app=138&f=JPEG?w=281&h=499",
    "https://img1.baidu.com/it/u=2782957187,833982170&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500",
    "https://img2.baidu.com/it/u=566973879,1634165869&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500",
    "https://img1.baidu.com/it/u=2899280306,3618542802&fm=253&fmt=auto&app=138&f=JPEG?w=788&h=500",
    "https://img2.baidu.com/it/u=2271096910,2440587446&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500",
    "https://img2.baidu.com/it/u=3324606412,3018510176&fm=253&fmt=auto&app=138&f=JPEG?w=721&h=408",
    "https://img1.baidu.com/it/u=3744753077,1307202716&fm=253&fmt=auto&app=138&f=JPEG?w=281&h=499",
    "https://img1.baidu.com/it/u=1514212794,2869693562&fm=253&fmt=auto&app=138&f=JPEG?w=628&h=380",
    "https://img2.baidu.com/it/u=2117616149,1538138901&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500",
    "https://img0.baidu.com/it/u=1311606927,3244663350&fm=253&fmt=auto&app=138&f=JPEG?w=647&h=500",
    "https://img2.baidu.com/it/u=2532732407,2030117692&fm=253&fmt=auto&app=120&f=JPEG?w=220&h=220",
    "https://img1.baidu.com/it/u=2846119948,3732116619&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=502",
    "https://img0.baidu.com/it/u=1334394885,3161029008&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=425",
    "https://img2.baidu.com/it/u=3912297337,2477410898&fm=253&fmt=auto&app=138&f=JPEG?w=839&h=500",
  ];

  //tab栏 吸顶 效果
  Widget _buildStickyBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 80, //收起的高度
          maxHeight: 80, //展开的最大高度
          child: Container(
            color: const Color(0xFFfafafa),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Expanded(
                  child: MenuTab(
                    menuList: const [
                      {"value": "1", "text": "全部", "lable": "猜你喜欢"},
                      {"value": "2", "text": "时令", "lable": "四季优选"},
                      {"value": "3", "text": "进口", "lable": "国际直采"},
                      {"value": "4", "text": "人气", "lable": "当下热卖"},
                      {"value": "5", "text": "新上架", "lable": "新品上架"},
                    ],
                    onPress: (e) {
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }

  //瀑布流 每个子项
  Widget itemWidget(int i) {
    String imagPath = imgList[i];
    return new Material(
      elevation: 8.0,
      borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
      child: new InkWell(
        splashColor: Colors.green[300],
        onTap: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new FullScreenImagePage(tag: imagPath, imageurl: imagPath);
          }));
        },
        child: new Hero(
          tag: imagPath,
          child: ItemGoodInfo(
            goodUrl: imagPath,
            goodTitle: '四川柑橙36号测试品种品种品种',
            goodPrice: 39.9,
            type: 2,
            goodType: '份',
          ),
        ),
      ),
    );
  }

//任务成功
  Future<bool> loadingSuccessFunction() {
    return Future.delayed(const Duration(milliseconds: 2000), () {
      return true;
    });
  }

  //任务失败
  Future<bool> loadingFieldFunction() {
    return Future.delayed(const Duration(milliseconds: 2000), () {
      return false;
    });
  }

  //添加购物车 动画
  void addCart(key, url, {LoadingCallback? loadingCallBack}) {
    //显示的widget
    Widget piuWidget = Container(
      color: Colors.white,
      child: Image.asset(
        url,
        fit: BoxFit.fill,
      ),
    );

    //动画终点坐标
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    var offset = box.localToGlobal(Offset.zero);
    Offset endOffset =
        Offset(offset.dx + box.size.width / 2, offset.dy + box.size.height / 2);

    PiuAnimation.addAnimation(rootKey, piuWidget, endOffset,
        maxWidth: MediaQuery.of(context).size.width,
        loadingCallback: loadingCallBack, doSomethingBeginCallBack: () {
      print("动画开始");
    }, doSomethingFinishCallBack: (success) {
      if (success) {
        print("loading 成功 动画结束");
      } else {
        print("loading 失败 动画结束");
      }
    });
  }



  //首页轮播图
  Widget get_swiper_widget(context) {
    return ComSwiper(
        paginationBuilder: ComPaginationBuilder.dot(),
        bannerList: imageList,
        onTap: (index) {
          debugPrint("我点击了第生死时速$index");
        },
        item: (item) => Padding(
              padding: EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
                child: Image.asset(
                  item,
                  fit: BoxFit.fill,
                ),
              ),
            ),
        context: context);
  }
}

//吸顶 widget 需要额外 继承一个类
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class FullScreenImagePage extends StatefulWidget {
  final String imageurl;
  final String tag;

  FullScreenImagePage({Key? key, required this.imageurl, required this.tag})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FullScreenImagePage();
  }
}

class _FullScreenImagePage extends State<FullScreenImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
        height: 400,
        margin: EdgeInsets.all(20.0),
        child: Text("asas"),
      ),
    );
  }
}
