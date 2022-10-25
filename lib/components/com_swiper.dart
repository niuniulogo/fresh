


import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class ComSwiper extends StatelessWidget {
  ///上下文
  final BuildContext context;

  ///轮播图滚动列表
  final List<String> bannerList;

  ///高度可定制
  final double widgetHeight = 130;

  ///返回的item的定制
  final Function item;

  ///是否自动播放
  final bool autoPlay;

  ///点击的回调
  final Function? onTap;

  ///指点杆的布局
  final Alignment paginationAlignment;

  ///指点杆距离组件的距离
  final EdgeInsetsGeometry? paginationMargin;

  ///是否显示指点杆
  final bool showSwiperPagination;

  ///构造指点杆
  final SwiperPlugin? paginationBuilder;

  const ComSwiper(
      {Key? key,
        required this.bannerList,
        this.autoPlay = true,
        required this.item,
        required this.context,
        this.showSwiperPagination = true,
        this.onTap,
        this.paginationAlignment = Alignment.bottomRight,
        this.paginationMargin,
        this.paginationBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widgetHeight,
      child: _swiper(),
    );
  }

  Widget _swiper() {
    return Swiper(
      onTap: (index) => {
        if (onTap != null) {onTap!(bannerList[index])}
      },
      itemCount: bannerList.length,
    //如果只有一个不自动播放,多个按需求是否播放
      autoplay: bannerList.length != 1 ? autoPlay : false,
      itemBuilder: (BuildContext context, int index) => item(bannerList[index]),
      ///如果只有一个不显示指示器或者按需显示指示器
      pagination: (bannerList.length != 1) && showSwiperPagination
          ? SwiperPagination(
          alignment: paginationAlignment,
          margin: paginationMargin ??
              EdgeInsets.only(
                  right: 20,
                  bottom:20),
          builder: paginationBuilder ??
              RectSwiperPaginationBuilder(
                  color: Theme.of(context).textTheme.caption?.color,
                  activeColor: Theme.of(context).indicatorColor,
                  size: Size(12, 12),
                  activeSize: Size(12,12)))
          : null,
    );
  }
}



class ComPaginationBuilder {
  ///原点形 指示器
  ///[activeColor]选中的颜色
  ///[color]默认颜色
  ///[size]默认的大小
  ///[activeSize]选中的大小
  ///[space] 间距
  static dot({
    activeColor,
    color,
    size = 10.0,
    activeSize = 10.0,
    space = 3.0,
  }) {
    return DotSwiperPaginationBuilder(
        activeSize: activeSize,
        activeColor: activeColor,
        color: color,
        size: size,
        space: space);
  }

  ///带数字分页的指示器
  ///效果  1/4
  ///  ///[activeColor]选中的颜色
  //   ///[color]默认颜色
  //   ///[fontSize]默认的大小
  //   ///[activeFontSize]选中的大小
  static fraction({
    color,
    fontSize = 20.0,
    activeColor,
    activeFontSize = 35.0,
  }) {
    return FractionPaginationBuilder(
        color: color,
        fontSize: fontSize,
        activeColor: activeColor,
        activeFontSize: activeFontSize);
  }

  ///方块指示器
  ///  ///[activeColor]选中的颜色
  //   ///[color]默认颜色
  //   ///[fontSize]默认的大小
  //   ///[activeFontSize]选中的大小

  static rect({
    activeColor,
    color,
    size = const Size(12.0, 12.0),
    activeSize = const Size(18.0, 12.0),
    space = 3.0
  }) {
    return RectSwiperPaginationBuilder(
        activeSize: activeSize,
        activeColor: activeColor,
        color: color,
        size: size,
        space: space);
  }

}
