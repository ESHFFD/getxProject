import 'package:blog_app/constant/image_const.dart';
import 'package:blog_app/constant/string_constant.dart';
import 'package:blog_app/models/main_page_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/constant.dart';

class SelectCatgegory extends StatefulWidget {
  const SelectCatgegory({Key? key}) : super(key: key);

  @override
  State<SelectCatgegory> createState() => _SelectCatgegoryState();
}

class _SelectCatgegoryState extends State<SelectCatgegory> {
  List newList = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height / 12,
            ),
            SvgPicture.asset(
              ConstantImage.techBot,
              height: 120,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              ConstantString.successCode,
              style: textTheme.displayMedium,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: TextField(
                  onChanged: (value) {
                    // print(isEmail(value));
                  },
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: ConstantString.yourNameAndFamilyName),
                )),
            const SizedBox(
              height: 8,
            ),
            Text(
              ConstantString.chooseCategory,
              style: textTheme.displayMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.only(right: 24, left: 24),
              width: double.infinity,
              height: 120,
              child: GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 3,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (ctx, i) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (!mySelectedTag.contains(tagList[i])) {
                            mySelectedTag.add(tagList[i]);
                          } else {
                            // print('this item is exist yet');
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border: Border.all(
                              color: ConstantSolidColor.tagContainerColor,
                              width: 2),
                        ),
                        child: Center(child: Text(tagList[i].title!)),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 24,
            ),
            Image.asset(
              ConstantIcon.downCategoryArrow,
              scale: 2,
            ),
            const SizedBox(
              height: 16,
            ),
            (mySelectedTag.isNotEmpty)
                ? SizedBox(
                    // margin: const EdgeInsets.only(right: 24, left: 24),
                    width: double.infinity,
                    height: 100,
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mySelectedTag.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.23,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (ctx, i) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              border: Border.all(
                                  color: ConstantSolidColor.primaryColor,
                                  width: 2),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    mySelectedTag[i].title!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            mySelectedTag.removeAt(i);
                                          });
                                        },
                                        child: const Icon(
                                          CupertinoIcons.delete,
                                          color: Colors.black,
                                          size: 20,
                                        )),
                                  )
                                ]),
                          );
                        }),
                  )
                : const Text(
                    'NOT SELECTED YET',
                    style: TextStyle(color: Colors.black),
                  ),
          ],
        ),
      ),
    ));
  }
}
