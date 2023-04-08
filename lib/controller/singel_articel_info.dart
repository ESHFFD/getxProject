import 'package:blog_app/constant/api_constant.dart';
import 'package:blog_app/models/articel_model.dart';
import 'package:blog_app/models/singel_articel_model.dart';
import 'package:blog_app/models/tag_model.dart';
import 'package:blog_app/services/dio_service.dart';
// import 'package:blog_app/views/singel_articel_screen.dart';
// import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SingelArticelInfoController extends GetxController {
  Rx<SingelArticelInfoModel> singelArticel =
      SingelArticelInfoModel(null, null, null).obs;
  RxList<TagModel> tags = RxList();
  RxList<ArticelModel> relatedArticel = RxList();
  RxBool isLoading = false.obs;
  RxInt id = RxInt(0);

  // @override
  // onInit() {
  //   getSingelArticel();
  //   super.onInit();
  // }

  getSingelArticel(String id) async {
    singelArticel = SingelArticelInfoModel(null, null, null).obs;
    isLoading.value = true;
    var userId = '';
    var response = await DioService().getMethod(
        '${ApiConstant.baseUrl}/article/get.php?command=info&id=$id&user_id=$userId');
    // debugPrint(
    //     '${ApiConstant.baseUrl}/article/get.php?command=info&id=$id&user_id=$userId');
    if (response.statusCode == 200) {
      var jsonData = response.data;

      singelArticel.value = SingelArticelInfoModel.fromJson(jsonData);
      tags.clear();
      jsonData['tags'].forEach((el) => tags.add(TagModel.fromJson(el)));
      relatedArticel.clear();
      jsonData['related']
          .forEach((el) => relatedArticel.add(ArticelModel.fromJson(el)));

      isLoading.value == false;
    }
    // Get.to(SingelArticle());
  }

  // getSingelArticelById(String id) async {
  //   singelArticel = SingelArticelInfoModel().obs;
  //   isLoading.value = true;
  //   var userId = '';
  //   var response = await DioService().getMethod(
  //       '${ApiConstant.baseUrl}/article/get.php?command=info&id=$id&user_id=$userId');
  //   // debugPrint(
  //   //     '${ApiConstant.baseUrl}/article/get.php?command=info&id=$id&user_id=$userId');
  //   if (response.statusCode == 200) {
  //     var jsonData = response.data;

  //     singelArticel.value = SingelArticelInfoModel.fromJson(jsonData);
  //     tags.clear();
  //     jsonData['tags'].forEach((el) => tags.add(TagModel.fromJson(el)));
  //     relatedArticel.clear();
  //     jsonData['related']
  //         .forEach((el) => relatedArticel.add(ArticelModel.fromJson(el)));

  //     isLoading.value == false;
  //   }
  // }
}
