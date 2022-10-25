import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh/views/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (LoginController c) {
        return Scaffold(
            body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            //点击空白处隐藏键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height,
                  child: Lottie.asset('images/login-bg.json', fit: BoxFit.fill),
                ),
                Positioned(
                    top: 50,
                    left: 10,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.navigate_before,
                        color: Colors.lightGreen,
                        size: 40,
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 130),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          double value = _animation.value;
                          Gradient gradient = LinearGradient(
                            colors: [Colors.green, Colors.yellow, Colors.green],
                            stops: [value - 0.2, value, value + 0.2],
                          );

                          Shader shader = gradient.createShader(
                              Rect.fromLTWH(0, 0, Get.width, Get.height));

                          return Text(
                            'Welcome to 窝窝牛生鲜!',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = shader,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${c.phoneLogin}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      login(c),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 120,
                    child: Container(
                      width: Get.width,
                      child: Center(
                        child: Column(
                          children: [
                            const Text('其他登录方式'),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SvgPicture.asset(
                                    'images/icon-wx.svg',
                                    width: 40,
                                    height: 40,
                                  ),
                                  SvgPicture.asset(
                                    'images/icon-qq.svg',
                                    width: 40,
                                    height: 40,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
      },
    );
  }

  Widget login(LoginController c) {
    return Column(
      children: [
        TextField(
          maxLength: 11,
          keyboardType: TextInputType.phone,
          style: const TextStyle(fontSize: 16.0),
          decoration: const InputDecoration(
            filled: true,
            hintText: "请输入手机号码",
          ),
          //输入文本的样式
          onChanged: (text) {
            c.mobile.value = text;
          },
        ),
        TextField(
          obscureText: true,
          style: const TextStyle(
            fontSize: 16.0,
          ),
          decoration: const InputDecoration(
            filled: true,
            hintText: "请输入密码",
          ),
          //输入文本的样式
          onChanged: (text) {
            //内容改变的回调
            c.password.value = text;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              '用户注册 >',
              textAlign: TextAlign.right,
            ),
          ],
        ),
        InkWell(
          onTap: () {
            c.login();
          },
          child: Container(
            height: 180,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    child: Lottie.asset('images/login-btn.json',
                        width: Get.width * .8, height: 90, fit: BoxFit.fill),
                  ),
                ),
                const Center(
                    child: Text('登录',style: TextStyle(color: Colors.white, fontSize: 22),
                ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
