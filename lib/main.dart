import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fresh/nav_tabs.dart';
import 'package:fresh/views/my/my_page_controller.dart';
import 'package:fresh/views/routers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    theme: ThemeData(
        primarySwatch: Colors.green, //状态栏颜色
        backgroundColor: Colors.green),
    debugShowCheckedModeBanner: false,
    home: NavTabs(),
    getPages: Routers.getPages,
    initialBinding: BindingsBuilder(() {
      Get.lazyPut(() => DioController());
      Get.lazyPut(() => MyPageController());
    }),
    defaultTransition: Transition.circularReveal,
  ));
}

class DioController extends GetxController {
  final box = GetStorage();
  late Dio dio;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    BaseOptions options = BaseOptions(
      // baseUrl: 'http://127.0.0.1:8848/api',
      baseUrl: 'http://192.168.100.100:8848/api',
      connectTimeout: 15000,
      receiveTimeout: 3000,
    );
    dio = Dio(options);

    //添加一个拦截器
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent

      if (Get.isDialogOpen ?? false) {
      } else {
        Get.dialog(
          
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                  width: 200,
                  height: 250,
                  child: Column(
                    children: [
                      Lottie.asset('images/loading.json', width: 160),
                      Text(
                        "加载中...",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ),
            barrierDismissible: false);
      }

      print("request before token is" + getValue("token").toString());
      options.headers["token"] = getValue("token");
      //延时500毫秒执行
      Future.delayed(const Duration(milliseconds: 500), () {
        return handler.next(options);

      });
      // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onResponse: (response, handler) {
      if (Get.isDialogOpen ?? true) {
        Get.back();
      }

      // Do something with response data
      print(response.statusCode.toString() + "返回的状态码");
      if (response.statusCode == 200 && response.data["code"] == 0) {
        return handler.next(response); // continue
      } else {
        Get.defaultDialog(title: "提示", middleText: response.data["msg"]);
        return;
      }
      // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onError: (DioError e, handler) {
      // Do something with response error
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      if (e.response?.statusCode == 401) {
        clearAll();
        Get.find<MyPageController>().onInit();
        Get.defaultDialog(title: "提示", middleText: "登录已过期，请重新登录");

        return;
      } else {
        return handler.next(e); //continue
      }

      // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    }));
  }

  Future<dynamic> post(url, Map<String, dynamic> data) async {
    return base_requet(url, data, 'POST');
  }

  Future<dynamic> get(url, {Map<String, dynamic>? data}) async {
    return base_requet(url, data, 'GET');
  }

  Future<dynamic> base_requet(url, data, method) async {
    var res = await dio.request(
      url,
      data: data,
      options: Options(method: method),
    );
    return res.data['data'];
  }

  void setValue(String key, dynamic val) {
    box.write(key, val);
    update();
  }

  dynamic getValue(String key) {
    return box.read(key);
  }

  void removeValue(String key) {
    box.remove(key);
    update();
  }

  void clearAll() {
    box.erase();
    update();
  }
}
