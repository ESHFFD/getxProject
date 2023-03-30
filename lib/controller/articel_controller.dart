import 'package:blog_app/constant/api_constant.dart';
import 'package:blog_app/models/articel_model.dart';
import 'package:blog_app/services/dio_service.dart';
import 'package:get/get.dart';

class ArticelController extends GetxController {
  RxList<ArticelModel> articelList = RxList();
  RxBool isLoading = false.obs;

  @override
  onInit() {
    getArticelList();
    super.onInit();
  }

  getArticelList() async {
    // articelList.clear();
    isLoading.value = true;

    var response = await DioService().getMethod(ApiConstant.articelList);
    if (response.statusCode == 200) {
      var jsonData = response.data;
      // this is allready returned by list no nett to use ([])
      jsonData.forEach((el) {
        articelList.add(ArticelModel.fromJson(el));
      });

      isLoading.value = false;
    }
  }

  getArticelModelWithId(String id) async {
    articelList.clear();
    isLoading.value = true;
    var response = await DioService().getMethod(
        '${ApiConstant.baseUrl}/article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');
    if (response.statusCode == 200) {
      var jsonData = response.data;
      // this is allready returned by list no nett to use ([])
      jsonData.forEach((el) {
        articelList.add(ArticelModel.fromJson(el));
      });

      isLoading.value = false;
    }
  }
}
