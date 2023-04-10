// import 'package:blog_app/constant/constant.dart';
import 'dart:io';

import 'package:blog_app/constant/constant.dart';
import 'package:blog_app/constant/image_const.dart';
import 'package:blog_app/constant/string_constant.dart';
import 'package:blog_app/controller/articel_controller.dart';
import 'package:blog_app/controller/file_picker_controller.dart';
import 'package:blog_app/controller/manage_articel_controller.dart';
// import 'package:blog_app/controller/articel_controller.dart';
import 'package:blog_app/controller/singel_articel_info.dart';
import 'package:blog_app/screens/my_component.dart';
import 'package:blog_app/services/file_picker.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:blog_app/views/article_screen.dart';
import 'package:get_storage/get_storage.dart';
// ArticelController articelController = Get.put(ArticelController());

// ignore: must_be_immutable
class SingelManagementArticle extends StatelessWidget {
  SingelManagementArticle({Key? key}) : super(key: key);
  // ArticelController articelController = Get.put(ArticelController());
  var manageSingelArticel = Get.find<ManageArticel>();
  // FilePickerController filePickerController = Get.put(FilePickerController());
  FilePickerController filePickerController = Get.put(FilePickerController());

  getNewTitle() {
    Get.defaultDialog(
        title: 'عنوان مقاله',
        content: TextFormField(
          controller: manageSingelArticel.titleEditing,
          keyboardType: TextInputType.text,
          decoration:
              const InputDecoration(hintText: 'عنوان مقالتو اینجا بنویس'),

        ),
        confirm: ElevatedButton(
            onPressed: () {
              manageSingelArticel.updateArticleTitle();
              Get.back();
            },
            child: const Text('ثبت')));
  }

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
                filePickerController.file.value.name == 'nothing'
                    ? CachedNetworkImage(
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
                      )
                    : Image.file(
                        File(filePickerController.file.value.path!),
                        height: Get.height / 3.5,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          pickFile();
                        },
                        child: Container(
                          height: 30,
                          width: 120,
                          decoration: const BoxDecoration(
                              color: ConstantSolidColor.primaryColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  topLeft: Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                ConstantString.selectphotoSingelArticel,
                                style: textTheme.displayMedium!
                                    .copyWith(color: Colors.white),
                              ),
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 22,
                              )
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
                  getNewTitle();
                }),
            const SizedBox(
              height: 16,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(manageSingelArticel.singelArticel.value.title!),

                    const SizedBox(
                      height: 16,
                    ),
                    MyCustomSelectabbleIcon(
                        text: ConstantString.editMainArticelTitle,
                        icon: ConstantIcon.bluePen,
                        badyMargin: badyMargin,
                        textTheme: textTheme,
                        onTap: () {
                          Get.toNamed('page');
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: badyMargin,
                      ),
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
                    MyCustomSelectabbleIcon(
                        text: ConstantString.selectCategorySingelEditScreen,
                        icon: ConstantIcon.bluePen,
                        badyMargin: badyMargin,
                        textTheme: textTheme,
                        onTap: () {
                          Get.toNamed('page');
                        }),
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
