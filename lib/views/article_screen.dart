// import 'package:blog_app/constant/constant.dart';
// import 'package:blog_app/constant/constant.dart';
import 'package:blog_app/controller/articel_controller.dart';
import 'package:blog_app/controller/singel_articel_info.dart';
import 'package:blog_app/main.dart';
import 'package:blog_app/screens/my_component.dart';
// import 'package:blog_app/views/singel_articel_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ArticleScreen extends StatelessWidget {
  ArticleScreen({Key? key}) : super(key: key);
  ArticelController articelController = Get.put(ArticelController());
  SingelArticelInfoController singelArticelInfoController =
      Get.put(SingelArticelInfoController());

  @override
  Widget build(BuildContext context) {
    // print(articelController.articelList[0].title);
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: myAppBar(context, title: 'مقالات جدید'),
      body: SizedBox(
        child: Obx(
          () => ListView.builder(
            itemCount: articelController.articelList.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      singelArticelInfoController.getSingelArticel(
                          articelController.articelList[index].id!);

                      Get.toNamed(NamedRoute.routeSingelArticelScreen);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: articelController.articelList[index].image!,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            width: Get.width / 3,
                            height: Get.height / 7,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16))),
                          );
                        },
                        placeholder: (context, url) {
                          return const MyLoadingWidget();
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey,
                            size: 32,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: SizedBox(
                      width: Get.width / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            articelController.articelList[index].title!,
                            style: textTheme.displayMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                articelController.articelList[index].author ??
                                    '',
                                style: textTheme.displaySmall,
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Text(
                                  '${articelController.articelList[index].view} بازدید ')
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
