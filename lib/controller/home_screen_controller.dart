import 'package:blog_app/constant/api_constant.dart';
import 'package:blog_app/models/articel_model.dart';

// import 'package:blog_app/models/podcast.model.dart';
import 'package:blog_app/models/poster_model.dart';
import 'package:blog_app/models/tag_model.dart';
import 'package:blog_app/services/dio_service.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagModel> tagList = RxList();
  // RxList<PodcastModel> podcastList = RxList();
  RxList<ArticelModel> blogList = RxList();
  RxBool isLoading = false.obs;
// very importent to do this in on fisrt time
  @override
  onInit() {
    getHomeItem();
    super.onInit();
  }

  getHomeItem() async {
    isLoading.value = true;
    var response = await DioService().getMethod(ApiConstant.getHomePageData);
    if (response.statusCode == 200) {
      var jsonData = response.data;
      //list of data -> using for each
      jsonData['top_visited'].forEach((el) {
        blogList.add(ArticelModel.fromJson(el));
      });

      // jsonData['top_podcasts'].forEach((el) {
      //   podcastList.add(PodcastModel.fromJson(el));
      // });
      jsonData['tags'].forEach((el) {
        tagList.add(TagModel.fromJson(el));
      });
      // map of data -> using key,value
      poster.value = PosterModel.fromJson(jsonData['poster']);

      isLoading.value = false;
    }
  }
}
