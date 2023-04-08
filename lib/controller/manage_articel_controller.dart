// import 'package:blog_app/controller/singel_articel_info.dart';
import 'package:blog_app/models/articel_model.dart';
import 'package:blog_app/models/singel_articel_model.dart';
import 'package:blog_app/models/tag_model.dart';
import 'package:blog_app/services/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/api_constant.dart';

class ManageArticel extends GetxController {
  RxList<ArticelModel> articelList = RxList.empty();
  RxList<TagModel> tags = RxList.empty();
  Rx<SingelArticelInfoModel> singelArticel = SingelArticelInfoModel(
          'این ',
          """است که داستان وایکینگ‌ها را روایت می‌کند و جنبه‌های اکشن ادونچر (ماجراجویی) آن با تکیه بر المان‌های نقش‌آفرینی """,
          '/Techblog/assets/upload/images/article/valhalla.jpg')
      .obs;
  RxBool isLoading = false.obs;

  @override
  onInit() {
    getManagedArticel();
    super.onInit();
  }

  getManagedArticel() async {
    isLoading.value = true;

    var response =
        await DioService().getMethod('${ApiConstant.articelPublishByMe}1');
    if (response.statusCode == 200) {
      var jsonData = response.data;
      debugPrint(response.statusCode.toString());
      // this is allready returned by list no nett to use ([])
      jsonData.forEach((el) {
        articelList.add(ArticelModel.fromJson(el));
      });
      articelList.clear();

      isLoading.value = false;
    }
  }
}
