import 'package:blog_app/constant/constant.dart';
import 'package:blog_app/constant/image_const.dart';
import 'package:blog_app/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key, required this.size, required this.pageIndex})
      : super(key: key);
  final Size size;
  final Function(int) pageIndex;
  // RegisterController registerController =
  //     Get.put(RegisterController(), permanent: false);

  // final VoidCallback onTap;
  // final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 10,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: ConsatntLinearGradiant.bottomNavBackground)),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: size.height / 45,
            left: size.width / 20,
            right: size.width / 20),
        child: Container(
          height: size.height / 8,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(colors: ConsatntLinearGradiant.botNav)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
              onPressed: () {
                pageIndex(0);
              },
              icon: Image.asset(ConstantIcon.home),
            ),
            IconButton(
              onPressed: () {
                Get.find<RegisterController>().toggelLogin();
                // pageIndex(2);
              },
              icon: Image.asset(ConstantIcon.writer),
            ),
            IconButton(
              onPressed: () {
                pageIndex(1);
              },
              icon: Image.asset(ConstantIcon.account),
            ),
          ]),
        ),
      ),
    );
  }
}
//  buttonIconBottom(Widget icon , VoidCallback onTap){
  
//  }


