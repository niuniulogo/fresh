import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fresh/views/my/my_page_controller.dart';
import 'package:fresh/views/routers.dart';
import 'package:get/get.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key, required this.globalkey}) : super(key: key);
  final GlobalKey<ScaffoldState> globalkey;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyPageController>(
      builder: (MyPageController c) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 0,
            toolbarHeight: 80,
            title: Row(
              children: [
                ClipOval(
                  child: Image.asset('images/jingang-1.jpeg',
                      width: 60, height: 60, fit: BoxFit.cover),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      c.user_info.value.nickname,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      c.user_info.value.mobile,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
            actions: [
              InkWell(
                  onTap: () {
                    globalkey.currentState!.openEndDrawer();
                  },
                  child: Icon(
                    Icons.settings,
                    size: 20,
                  )),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.headset_mic,
                size: 20,
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 200,
                      child: Text(''),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          conmon_widget(c.user_info.value.blance, '??????(???)'),
                          conmon_widget(c.user_info.value.coupon, '?????????(???)'),
                          conmon_widget(c.user_info.value.integral, '??????'),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 20,
                      right: 20,
                      child: Container(
                        height: 120,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '????????????',
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                conmon_service(
                                    Icons.account_balance_wallet, '?????????'),
                                conmon_service(Icons.card_giftcard, '?????????'),
                                conmon_service(Icons.local_shipping, '?????????'),
                                conmon_service(Icons.textsms, '?????????'),
                                conmon_service(Icons.monetization_on, '??????/??????'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 120,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '????????????',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          conmon_service(Icons.location_on, '????????????'),
                          conmon_service(Icons.event_note, '??????'),
                          conmon_service(Icons.local_mall, '????????????'),
                          conmon_service(Icons.location_city, '????????????'),
                          conmon_service(Icons.headset_mic, '????????????'),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                c.is_login.isTrue ? InkWell(
                    onTap: () {





                      Get.toNamed(Routers.login)?.then((res) => {
                        print("???????????????????????????"+res.toString()),
                        res==true ? c.get_user_info():{}
                      });
                    },
                    child: Container(
                        width: Get.width * .5,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.green),
                        child: Center(
                            child: Text(
                          '??????',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )))): SizedBox(height: 0,)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget conmon_widget(title, desc) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(
              title.toString(),
              style: TextStyle(color: Colors.white),
            ),
            Text(desc, style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }

  Widget conmon_service(IconData icon, String desc) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.green,
              size: 26,
            ),
            Text(
              desc,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
