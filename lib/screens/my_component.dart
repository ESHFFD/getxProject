import 'dart:developer';

import 'package:blog_app/constant/constant.dart';
// import 'package:blog_app/main.dart';
// import 'package:blog_app/screens/main_screen.dart';
// import 'package:blog_app/screens/main_screen.dart';
// import 'package:blog_app/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// my custom divider
class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: size.width / 6,
      endIndent: size.width / 6,
      color: Colors.grey,
    );
  }
}

// my custom url launcher
myLuncher({required String url}) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log('can not find this site : ${url.toString()}');
  }
}

PreferredSize myAppBar(BuildContext context, {required String title}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Center(
            child: Text(
              'مقالات جدید',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: ConstantSolidColor.primaryColor),
            ),
          ),
        )
      ],
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: ConstantSolidColor.primaryColor),
            child: const Icon(
              Icons.keyboard_arrow_right,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

class MyLoadingWidget extends StatelessWidget {
  const MyLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: ConstantSolidColor.primaryColor,
      size: 52,
    );
  }
}
