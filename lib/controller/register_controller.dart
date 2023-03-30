import 'package:blog_app/constant/api_constant.dart';
import 'package:blog_app/constant/constant.dart';
import 'package:blog_app/screens/main_screen.dart';
import 'package:blog_app/services/dio_service.dart';
// import 'package:blog_app/views/home_screen.dart';
import 'package:blog_app/views/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController activeCodeController = TextEditingController();
  var user_id;
  var email;

  register() async {
    Map<String, dynamic> map = {
      'email': emailController.text,
      'command': 'register'
    };
    // print(ApiConstant.postRegister);

    var response = await DioService().postMethod(map, ApiConstant.postRegister);

    email = emailController.text;
    user_id = response.data['user_id'];
    debugPrint(response.toString());
  }

//verify code
  verify() async {
    final box = GetStorage();

    Map<String, dynamic> map = {
      'email': emailController.text,
      'user_id': user_id,
      'code': activeCodeController.text,
      'command': 'verify'
    };
    // print(ApiConstant.postRegister);
    // debugPrint(map.toString());
    var response = await DioService().postMethod(map, ApiConstant.postRegister);

    debugPrint(response.data.toString());
    box.write(token, response.data['token']);
    box.write(userId, response.data['user_id']);

    var status = response.data['response'];
    switch (status) {
      case 'verified':
        box.write(token, response.data['token']);
        box.write(userId, response.data['user_id']);
        Get.offAll(() => const MainScreen());
        // print('read:: ${box.read(token)} , ${box.read(userId)}');
        break;
      case 'incorrect_code':
        Get.snackbar('خطا', 'رمز وارد شده اشتباه است');
        break;
      case 'expired':
        Get.snackbar('خطا', 'رمز وارد شده منقضی است');
        break;
    }

    // if (response.data['response'] == 'verified') {
    // } else {
    //   debugPrint('error');
    // }
  }

  toggelLogin() {
    if (GetStorage().read(token) == null) {
      Get.to(RegisterScreen());
    } else {
      debugPrint('home page');
    }
  }
}
