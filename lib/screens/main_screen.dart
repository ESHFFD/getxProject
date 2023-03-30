// import 'package:blog_app/constant/api_constant.dart';
import 'package:blog_app/constant/image_const.dart';
import 'package:blog_app/constant/string_constant.dart';
import 'package:blog_app/screens/my_component.dart';
// import 'package:blog_app/services/dio_service.dart';
import 'package:blog_app/views/home_screen.dart';
import 'package:blog_app/views/profile_screen.dart';
// import 'package:blog_app/views/register/register_screen.dart';
import 'package:blog_app/widgets/bottom_navbardart.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:share_plus/share_plus.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

RxInt selectedIndex = 0.obs;

class MainScreen extends StatelessWidget {
  // var selectedIndex = 0;

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final double badyMargin = size.width / 15;

    return Scaffold(
      key: _key,
      appBar: _appBar(
          size: size,
          onTap: () {
            _key.currentState!.openDrawer();
            // print('cliked');
          }),
      drawer: Drawer(
          child: Padding(
        padding: EdgeInsets.only(right: badyMargin, left: badyMargin),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: Image.asset(
              ConstantImage.logo,
              scale: 2,
            )),
            ListTile(
              title: Text(
                ConstantString.profileUser,
                style: textTheme.displayMedium,
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(
                ConstantString.aboutTec,
                style: textTheme.displayMedium,
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(
                ConstantString.shareTec,
                style: textTheme.displayMedium,
              ),
              onTap: () async {
                await Share.share(ConstantString.shareText);
              },
            ),
            const Divider(),
            ListTile(
              title: Text(
                ConstantString.gitTec,
                style: textTheme.displayMedium,
              ),
              onTap: () {
                myLuncher(url: ConstantString.viewGitHubRepo);
              },
            ),
            const Divider(),
          ],
        ),
      )),
      body: Stack(children: [
        Positioned.fill(
            child: Obx(
          () => IndexedStack(index: selectedIndex.value, children: [
            HomePagePoster(
                size: size, textTheme: textTheme, badyMargin: badyMargin), //0
            const ProfileScreen(), //1,
            //TODO: change it latar
            // RegisterScreen() //2
          ]),
        )),
        Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: MyBottomNavBar(
              size: size,
              pageIndex: (int val) {
                selectedIndex.value = val;
              },
            ))
      ]),
    );
  }
}

_appBar({required Size size, required VoidCallback onTap}) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Colors.white,
    leading: IconButton(
      onPressed: onTap,
      icon: const Icon(
        Icons.menu,
        size: 20,
      ),
    ),
    title: Image(
      image: const AssetImage(ConstantImage.logo),
      height: size.height / 13.6,
    ),
    actions: [
      IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.search,
          size: 20,
        ),
      )
    ],
  );
}

//  Positioned(right: 0,bottom: 0,left: 0,child: MyBottomNavBar(size: size))
