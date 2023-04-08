// import 'package:blog_app/constant/constant.dart';
// import 'package:blog_app/bindings/binding.dart';
import 'package:blog_app/constant/image_const.dart';
import 'package:blog_app/constant/string_constant.dart';
import 'package:blog_app/controller/manage_articel_controller.dart';
// import 'package:blog_app/controller/register_controller.dart';
import 'package:blog_app/main.dart';
import 'package:blog_app/screens/my_component.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:blog_app/views/select_category.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:validators/validators.dart';

// ignore: must_be_immutable
class ManageArticelScreen extends StatelessWidget {
  // RegisterController registerController = Get.put(RegisterController());
  var articelManagementController = Get.find<ManageArticel>();
  ManageArticelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: myAppBar(context, title: ConstantString.articelManagement),
      body: Obx(
        () => articelManagementController.isLoading.value
            ? const MyLoadingWidget()
            : articelManagementController.articelList.isNotEmpty
                ? ListView.builder(
                    itemCount: articelManagementController.articelList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await articelManagementController
                                  .getManagedArticel();

                              Get.toNamed(NamedRoute.routeSingelArticelScreen);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CachedNetworkImage(
                                imageUrl: articelManagementController
                                    .articelList[index].image!,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    width: Get.width / 3,
                                    height: Get.height / 7,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16))),
                                  );
                                },
                                placeholder: (context, url) {
                                  return const MyLoadingWidget();
                                },
                                errorWidget: (context, url, error) {
                                  return Icon(
                                    Icons.image_not_supported_outlined,
                                    color: Colors.grey,
                                    size: Get.width / 3,
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
                                    articelManagementController
                                        .articelList[index].title!,
                                    style: textTheme.displayMedium,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                  const SizedBox(height: 32),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        articelManagementController
                                                .articelList[index].author ??
                                            '',
                                        style: textTheme.displaySmall,
                                      ),
                                      const SizedBox(
                                        width: 32,
                                      ),
                                      Text(
                                          '${articelManagementController.articelList[index].view} بازدید ')
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  )
                : EmptyArticel(textTheme: textTheme),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(Get.width / 3, Get.height / 15)),
            onPressed: () {
              print('clicked');
              Get.toNamed(NamedRoute.routeManageSingelArticelScreen);
            },
            child: Text(
              ConstantString.emptyArticelManagement,
              style: textTheme.displayLarge!.copyWith(color: Colors.white),
            )),
      ),
    );
  }
}

class EmptyArticel extends StatelessWidget {
  const EmptyArticel({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ConstantImage.emptyTechBot,
            height: 120,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: ConstantString.articleEmpty,
                    style: textTheme.displayMedium)),
          ),
        ],
      ),
    );
  }
}
