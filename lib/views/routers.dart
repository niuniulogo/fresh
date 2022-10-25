

import 'package:fresh/views/classify/search_history.dart';
import 'package:fresh/views/login/login_controller.dart';
import 'package:fresh/views/login/login_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routers {
  static const search_history = '/searchHistory';
  static const login = '/login';


  static List<GetPage> getPages = [
    GetPage(name: search_history, page: () => SearchHistory()),
    GetPage(name: login, page: () => LoginPage(),binding: BindingsBuilder((){
      Get.lazyPut(() => LoginController());
    }))
  ];
}