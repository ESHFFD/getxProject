import 'package:blog_app/bindings/binding.dart';
import 'package:blog_app/constant/theme.dart';
import 'package:blog_app/screens/main_screen.dart';
import 'package:blog_app/views/manage_articel_screen.dart';
import 'package:blog_app/views/singel_articel_screen.dart';
// import 'package:blog_app/screens/main_screen.dart';
// import 'package:blog_app/views/article_screen.dart';
// import 'package:blog_app/views/singel_articel_screen.dart';
import 'package:blog_app/views/splash_screen.dart';
// import 'package:blog_app/views/test.dart';
// import 'package:blog_app/views/test.dart';
// import 'package:blog_app/views/splash_screen.dart';
// import 'package:blog_app/views/test.dart';

// import 'package:blog_app/views/splash_screen.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  await GetStorage.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: RegisterBindigs(),
      locale: const Locale('fa'),
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      home: const SplashScreen(),
      getPages: [
        GetPage(
          name: NamedRoute.routeMainScreen,
          page: () => const MainScreen(),
          binding: RegisterBindigs(),
        ),
        GetPage(
            name: NamedRoute.routeSingelArticelScreen,
            page: () => SingelArticle(),
            binding: ArticelBindings()),
        GetPage(
            name: NamedRoute.routeManageArticelScreen,
            page: () => ManageArticelScreen(),
            binding: ArticelManagementBunding())
      ],
    );
  }
}

class NamedRoute {
  static String routeMainScreen = '/mainScreen';
  static String routeSingelArticelScreen = '/singelArticelScreen';
  static String routeManageArticelScreen = '/ManageArticel';
}
