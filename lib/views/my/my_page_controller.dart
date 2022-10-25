import 'package:fresh/api/app_api.dart';
import 'package:fresh/main.dart';
import 'package:get/get.dart';

class MyPageController extends GetxController {
  late Rx<UserInfo> user_info;
   late Rx<bool>  is_login;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user_info =  UserInfo(
    nickname: "游客你好",
    mobile: "",
    blance: "0.00",
    coupon: 0,
    integral: 0,
    address: '',
    gender: '3',
    headpicture: null)
    .obs;

    if(user_info.value.nickname=='游客你好'){
      is_login=true.obs;
    }else{
      is_login=false.obs;
    }
    update();
  }

  get_user_info() async {
    print(
        "用户token is " + Get.find<DioController>().getValue("token").toString());
    if (Get.find<DioController>().getValue("token") != null) {
      var res = await Get.find<DioController>().get(AppApi.get_user_info);
      Get.find<DioController>().setValue("userInfo", res);

      user_info = UserInfo(
              nickname: res["nickname"],
              mobile: res["phone"],
              blance: res["blance"],
              coupon: res["coupon"],
              integral: res["integral"],
              address: res["address"],
              gender: res["gender"],
              headpicture:  res["headpicture"])
          .obs;
      is_login=false.obs;
      update();
    }
  }
}

class UserInfo {
  String? headpicture;
  String nickname, mobile, blance, address, gender;
  int coupon, integral;


  UserInfo(
      {required this.nickname,
      required this.mobile,
      required this.integral,
      required this.coupon,
      required this.address,
      required this.gender,
      required this.headpicture,
      required this.blance});
}
