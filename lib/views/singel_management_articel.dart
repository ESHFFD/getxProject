// import 'package:blog_app/constant/constant.dart';
import 'package:blog_app/constant/image_const.dart';
import 'package:blog_app/constant/string_constant.dart';
import 'package:blog_app/controller/articel_controller.dart';
import 'package:blog_app/controller/manage_articel_controller.dart';
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
class SingelManagementArticle extends StatelessWidget {
  SingelManagementArticle({Key? key}) : super(key: key);
  // ArticelController articelController = Get.put(ArticelController());
  var manageSingelArticel = Get.find<ManageArticel>();

  // @override
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final double badyMargin = size.width / 15;
    // var textTheme = Theme.of(context).textTheme;
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
        () => Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://techblog.sasansafari.com/Techblog/assets/upload/images/article/valhalla.jpg',
                  // manageSingelArticel.singelArticel.value.image!
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
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 120,
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  topLeft: Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(ConstantString.selectphotoSingelArticel),
                              const Icon(Icons.add)
                            ],
                          ),
                        ),
                      ),
                    )),
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
            MyCustomSelectabbleIcon(
                text: ConstantString.editArticelTitle,
                icon: ConstantIcon.bluePen,
                badyMargin: badyMargin,
                textTheme: textTheme,
                onTap: () {
                  Get.toNamed('page');
                }),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(manageSingelArticel.singelArticel.value.title!),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Image(
                            image: AssetImage(ConstantImage.profileAvatar),
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: HtmlWidget(
                        """<h4>${manageSingelArticel.singelArticel.value.content}</h4> """,
                        enableCaching: true,
                        onLoadingBuilder: (context, element, loadingProgress) {
                          return const MyLoadingWidget();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    _tags(),

                    // const SizedBox(
                    //   height: 64,
                    // )
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
          itemCount: manageSingelArticel.tags.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () async {
                var tagId = manageSingelArticel.tags[index].id!;
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
}
