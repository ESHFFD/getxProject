import 'package:blog_app/controller/articel_controller.dart';
// import 'package:blog_app/controller/home_screen_controller.dart';
import 'package:blog_app/controller/manage_articel_controller.dart';
import 'package:blog_app/controller/register_controller.dart';
import 'package:blog_app/controller/singel_articel_info.dart';
import 'package:get/get.dart';

class RegisterBindigs implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}

class ArticelManagementBunding implements Bindings {
  @override
  void dependencies() {
    Get.put(ManageArticel());
  }
}

class ArticelBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticelController());
    Get.lazyPut(() => SingelArticelInfoController());
  }
}
// class HomeScreenBinding implements Bindings {
//   @override
//   void dependencies() {
//    Get.put(HomeScreenController());
//   }
// }
