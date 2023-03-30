import 'package:blog_app/constant/constant.dart';
import 'package:blog_app/constant/image_const.dart';
import 'package:blog_app/constant/string_constant.dart';
import 'package:blog_app/screens/my_component.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    // final double badyMargin = size.width / 15;
    return Scaffold(
      // appBar: _appBar(size),
      body: Stack(children: [
        Positioned.fill(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  const Image(
                    image: AssetImage(ConstantImage.profileAvatar),
                    height: 100,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ImageIcon(
                        AssetImage(ConstantIcon.bluePen),
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        ConstantString.editProfile,
                        style: textTheme.displayMedium,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  MyDivider(size: size),
                  InkWell(
                    splashColor: ConstantSolidColor.primaryColor,
                    onTap: () {},
                    child: const SizedBox(
                      height: 64,
                      child: Center(child: Text(ConstantString.myFavArticle)),
                    ),
                  ),
                  MyDivider(size: size),
                  InkWell(
                    splashColor: ConstantSolidColor.primaryColor,
                    onTap: () {},
                    child: const SizedBox(
                      height: 64,
                      child: Center(child: Text(ConstantString.myFavPodcast)),
                    ),
                  ),
                  MyDivider(size: size),
                  InkWell(
                    splashColor: ConstantSolidColor.primaryColor,
                    onTap: () {},
                    child: const SizedBox(
                      height: 64,
                      child: Center(child: Text(ConstantString.logOute)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

//   _appBar(Size size) {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: Colors.white,
//       leading: IconButton(
//         icon: const Icon(Icons.search),
//         onPressed: () {},
//       ),
//       title: Image(
//         image: const AssetImage(ConstantImage.logo),
//         height: size.height / 13.6,
//       ),
//       actions: [
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.menu),
//         )
//       ],
//     );
//   }
// }
}
