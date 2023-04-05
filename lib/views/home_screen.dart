import 'package:blog_app/constant/constant.dart';
import 'package:blog_app/constant/image_const.dart';
import 'package:blog_app/constant/string_constant.dart';
import 'package:blog_app/controller/articel_controller.dart';
import 'package:blog_app/controller/home_screen_controller.dart';
import 'package:blog_app/controller/singel_articel_info.dart';
import 'package:blog_app/main.dart';
import 'package:blog_app/models/main_page_map.dart';
import 'package:blog_app/screens/my_component.dart';
import 'package:blog_app/views/article_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePagePoster extends StatelessWidget {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  ArticelController articelController = Get.put(ArticelController());
  SingelArticelInfoController singelArticelInfoController =
      Get.put(SingelArticelInfoController());

  HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
    required this.badyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double badyMargin;

  @override
  Widget build(BuildContext context) {
    // homeScreenController.getHomeItem();
    return Obx(
      () => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: homeScreenController.isLoading.value == false
            ? Column(
                children: [
                  //poster
                  Center(child: _poster()),
                  // list of categoryies
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 0),
                      child: _tags()),
                  const SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ArticleScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: badyMargin),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const ImageIcon(
                            AssetImage(ConstantIcon.bluePen),
                            color: Colors.amber,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            ConstantString.hottestNews,
                            style: textTheme.displayLarge!
                                .copyWith(color: Colors.amber),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  ///List of blog post
                  _topVisited(),

                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: badyMargin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const ImageIcon(
                          AssetImage(ConstantIcon.microphoneIcon),
                          color: Colors.purpleAccent,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          ConstantString.hottestPodcats,
                          style: textTheme.displayLarge!
                              .copyWith(color: Colors.purpleAccent),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //top Podcast list in here !!
                  // _topPodcast(),

                  const SizedBox(
                    height: 100,
                  )
                ],
              )
            : const Center(
                child: SpinKitFadingCube(
                  color: ConstantSolidColor.primaryColor,
                  size: 32,
                ),
              ),
      ),
    );
  }

  Widget _tags() {
    return SizedBox(
      height: 65,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: (ctx, i) {
            return GestureDetector(
              onTap: () async {
                var tagId = homeScreenController.tagList[i].id!;
                await articelController.getArticelModelWithId(tagId);
                Get.to(ArticleScreen());
              },
              child: Padding(
                padding: EdgeInsets.only(right: i == 0 ? badyMargin : 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                        color: ConstantSolidColor.tagContainerColor, width: 2),
                  ),
                  child: Center(
                      child: Text(
                          Get.find<HomeScreenController>().tagList[i].title!)),
                ),
              ),
            );
          }),
    );
  }

  Widget _poster() {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: homeScreenController.poster.value.image!,
          imageBuilder: (context, imageProvider) => Container(
            width: size.width / 1.2,
            height: size.height / 4.2,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
            foregroundDecoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                    colors: ConsatntLinearGradiant.posteMainScreenGradiant,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
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
            bottom: 10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  homeScreenController.poster.value.title!,
                  style: textTheme.labelMedium,
                )
              ],
            ))
      ],
    );
  }

  // Widget _topPodcast() {
  //   return SizedBox(
  //     height: size.height / 3.8,
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: homeScreenController.podcastList.length,
  //       itemBuilder: ((context, index) {
  //         return Padding(
  //           padding: EdgeInsets.only(right: index == 0 ? badyMargin : 10),
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(0),
  //                 child: SizedBox(
  //                     width: size.height / 5.3,
  //                     height: size.width / 2.4,
  //                     child: CachedNetworkImage(
  //                       imageUrl:
  //                           homeScreenController.podcastList[index].poster ??
  //                               articelController.articelList[index].image!,
  //                       imageBuilder: (context, imageProvider) {
  //                         return Container(
  //                           decoration: BoxDecoration(
  //                               borderRadius:
  //                                   const BorderRadius.all(Radius.circular(10)),
  //                               image: DecorationImage(
  //                                   image: imageProvider, fit: BoxFit.cover)),
  //                         );
  //                       },
  //                       placeholder: (context, url) {
  //                         return const MyLoadingWidget();
  //                       },
  //                       errorWidget: (context, url, error) {
  //                         return const Icon(
  //                           Icons.image_not_supported_outlined,
  //                           color: Colors.grey,
  //                           size: 54,
  //                         );
  //                       },
  //                     )),
  //               ),
  //               const SizedBox(
  //                 height: 8,
  //               ),
  //               SizedBox(
  //                 width: size.width / 2.4,
  //                 child: Text(
  //                   homeScreenController.podcastList[index].title!,
  //                   overflow: TextOverflow.ellipsis,
  //                   maxLines: 2,
  //                   textAlign: TextAlign.start,
  //                   textDirection: TextDirection.rtl,
  //                 ),
  //               )
  //             ],
  //           ),
  //         );
  //       }),
  //     ),
  //   );
  // }

  Widget _topVisited() {
    return SizedBox(
      height: size.height / 3.8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeScreenController.blogList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              Get.find<SingelArticelInfoController>()
                  .getSingelArticel(homeScreenController.blogList[index].id!);

              Get.toNamed(NamedRoute.routeSingelArticelScreen);
            },
            child: Padding(
              padding: EdgeInsets.only(right: index == 0 ? badyMargin : 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: SizedBox(
                      width: size.height / 5.3,
                      height: size.width / 2.4,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                homeScreenController.blogList[index].image!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                              foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                      colors: ConsatntLinearGradiant
                                          .postBlogGradiant,
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)),
                            ),
                            placeholder: (context, url) {
                              return const SpinKitFadingCube(
                                color: ConstantSolidColor.primaryColor,
                                size: 32,
                              );
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
                                    homeScreenController
                                        .blogList[index].author!,
                                    style: textTheme.labelMedium),
                                Row(
                                  children: [
                                    Text(
                                      homeScreenController
                                          .blogList[index].view!,
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
                    width: size.width / 2.4,
                    child: Text(
                      homeScreenController.blogList[index].title!,
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
