import 'package:flutter/material.dart';
import 'package:fresh/api/app_api.dart';
import 'package:fresh/main.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString phoneLogin = '手机号码登录'.obs;
  RxString register = '注册'.obs;
  final mobile = ''.obs;
  final password = ''.obs;
  final username = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // AppApi.login();
  }

  //登录
  Future<void> login() async {

    if(!GetUtils.isPhoneNumber(mobile.value)){
      Get.defaultDialog( title: "提示",middleText:"请输入正确的手机号");
      return;
    }

    if(GetUtils.isNullOrBlank(password.value)!){
      Get.defaultDialog( title: "提示",middleText:"请输入密码");
      return;
    }
    print("input is "+mobile.value.toString()+"------"+password.value);
    var res = await Get.find<DioController>().post(AppApi.login, {"mobile":mobile.value,"password":password.value});
    print("res is "+res.toString());
    Get.find<DioController>().setValue("token", res["token"]);
    Get.back(result: true);
  }

  //注册
  void rigester() {}

  //获取code
  void getCode() {}
}
