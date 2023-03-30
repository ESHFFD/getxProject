// import 'package:blog_app/constant/constant.dart';
// import 'package:blog_app/bindings/binding.dart';
import 'package:blog_app/constant/image_const.dart';
import 'package:blog_app/constant/string_constant.dart';
import 'package:blog_app/controller/register_controller.dart';
// import 'package:blog_app/views/select_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:validators/validators.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  // RegisterController registerController = Get.put(RegisterController());
  var registerController = Get.find<RegisterController>();
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ConstantImage.techBot,
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: ConstantString.welcome,
                      style: textTheme.displayMedium)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                  onPressed: () {
                    _showEmailMyModelBottom(context, size,
                        textTheme.displayMedium!, registerController);
                  },
                  child: const Text(ConstantString.letsGo)),
            )
          ],
        ),
      ),
    );
  }
}

void _showEmailMyModelBottom(BuildContext context, Size size, TextStyle theme,
    RegisterController registerController) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ConstantString.inputYourEmail,
                    style: theme,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextField(
                      controller: registerController.emailController,
                      onChanged: (value) {
                        debugPrint(isEmail(value).toString());
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: ConstantString.exampleEmail),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        registerController.register();
                        Navigator.pop(context);
                        _showActiveCodeMyModelBottom(
                            context, size, theme, registerController);
                      },
                      child: const Text(ConstantString.continupTextFiled))
                ],
              ),
            ),
          ),
        );
      });
}

void _showActiveCodeMyModelBottom(BuildContext context, Size size,
    TextStyle theme, RegisterController registerController) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ConstantString.activeCode,
                    style: theme,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextField(
                      controller: registerController.activeCodeController,
                      onChanged: (value) {
                        // debugPrint(isEmail(value).to);
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: ConstantString.starCode),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        registerController.verify();
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const SelectCatgegory()));
                      },
                      child: const Text(ConstantString.continupTextFiled))
                ],
              ),
            ),
          ),
        );
      });
}
