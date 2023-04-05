// import 'package:blog_app/constant/constant.dart';
import 'package:blog_app/constant/image_const.dart';
import 'package:blog_app/controller/articel_controller.dart';
// import 'package:blog_app/controller/articel_controller.dart';
import 'package:blog_app/controller/singel_articel_info.dart';
import 'package:blog_app/screens/my_component.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:blog_app/views/article_screen.dart';
// ArticelController articelController = Get.put(ArticelController());

// ignore: must_be_immutable
class SingelArticle extends StatelessWidget {
  SingelArticle({Key? key}) : super(key: key);
  // ArticelController articelController = Get.put(ArticelController());
  var singelArticelInfo = Get.find<SingelArticelInfoController>();

  // @override
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.keyboard_arrow_left),
      //       onPressed: () {
      //         Get.back();
      //       },
      //     )
      //   ],
      // ),
      body: Obx(
        () => singelArticelInfo.singelArticel.value.image == null
            ? const Center(
                child: MyLoadingWidget(),
              )
            : Column(
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: singelArticelInfo.singelArticel.value.image!,
                        imageBuilder: (context, imageProvider) => Container(
                          width: double.infinity,
                          height: Get.height / 3.5,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: const BorderRadius.only(),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                          // foregroundDecoration: const BoxDecoration(
                          //     color: Colors.red,
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(10)),
                          //     gradient: LinearGradient(
                          //         colors: ConsatntLinearGradiant
                          //             .posteMainScreenGradiant,
                          //         begin: Alignment.bottomCenter,
                          //         end: Alignment.topCenter)),
                        ),
                        placeholder: (context, url) {
                          return const MyLoadingWidget();
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(
                            Icons.image_not_supported_outlined,
                            size: 54,
                          );
                        },
                      ),
                      Positioned(
                          right: 2,
                          top: 40,
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_right,
                                size: 32,
                                color: Colors.white,
                              ))),
                      Positioned(
                          left: 2,
                          top: 40,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.bookmark_outline,
                                size: 32,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.share,
                                size: 32,
                                color: Colors.white,
                              ),
                            ],
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(singelArticelInfo.singelArticel.value.title!),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Image(
                                  image:
                                      AssetImage(ConstantImage.profileAvatar),
                                  width: 25,
                                  height: 25,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(singelArticelInfo
                                        .singelArticel.value.author ??
                                    ''),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  singelArticelInfo
                                      .singelArticel.value.createdAt!,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: HtmlWidget(
                              """<h4>${singelArticelInfo.singelArticel.value.content}</h4> """,
                              enableCaching: true,
                              onLoadingBuilder:
                                  (context, element, loadingProgress) {
                                return const MyLoadingWidget();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          _tags(),
                          const SizedBox(
                            height: 64,
                          ),
                          _relatedPost(textTheme),
                          const SizedBox(
                            height: 64,
                          )
                        ],
                      ),
                    ),
                  )

                  // +
                ],
              ),
      ),
    );
  }

  Widget _tags() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: singelArticelInfo.tags.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () async {
                var tagId = singelArticelInfo.tags[index].id!;
                await Get.find<ArticelController>()
                    .getArticelModelWithId(tagId);

                Get.to(() => ArticleScreen());
              },
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? 12 : 5),
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 25),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 199, 199, 199),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Center(
                      child: Text(Get.find<SingelArticelInfoController>()
                          .tags[index]
                          .title!)),
                ),
              ),
            );
          })),
    );
  }

  Widget _relatedPost(TextTheme textTheme) {
    return SizedBox(
      height: Get.height / 3.8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: singelArticelInfo.relatedArticel.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              singelArticelInfo.getSingelArticel(
                  singelArticelInfo.relatedArticel[index].id!);
            },
            child: Padding(
              padding: EdgeInsets.only(right: index == 0 ? 12 : 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: SizedBox(
                      width: Get.height / 5.3,
                      height: Get.width / 2.4,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                singelArticelInfo.relatedArticel[index].image!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, url) {
                              return const MyLoadingWidget();
                            },
                            errorWidget: (context, url, error) {
                              return const Icon(
                                Icons.image_not_supported_outlined,
                                size: 54,
                                color: Colors.grey,
                              );
                            },
                          ),
                          Positioned(
                            bottom: 8,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    singelArticelInfo
                                            .relatedArticel[index].author ??
                                        '',
                                    style: textTheme.labelMedium),
                                Row(
                                  children: [
                                    Text(
                                      singelArticelInfo
                                          .relatedArticel[index].view!,
                                      style: textTheme.displayLarge,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(Icons.remove_red_eye)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: Get.width / 2.4,
                    child: Text(
                      singelArticelInfo.relatedArticel[index].title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
