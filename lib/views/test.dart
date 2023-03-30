// import 'package:blog_app/controller/test_controller.dart';
// import 'package:blog_app/models/model_test.dart';
// import 'package:blog_app/views/test_secod.dart';
// import 'package:flutter/material.dart';
// import 'package:get/instance_manager.dart';
// import 'package:get/route_manager.dart';
// import 'package:get/state_manager.dart';

// class TestScreen extends StatelessWidget {
//   const TestScreen({Key? key}) : super(key: key);

//   // var counter = 0.obs;

//   @override
//   Widget build(BuildContext context) {
//     print('rebuild');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Test'),
//       ),
//       body: ListView.builder(
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               Get.find<TestController>().setNewProduct(index);
//             },
//             child: Container(
//               margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//               decoration: BoxDecoration(
//                   // color: ,
//                   borderRadius: BorderRadius.circular(1),
//                   border: Border.all(width: 1)),
//               child:
//                   Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//                 GetBuilder<TestController>(
//                     id: index,
//                     init: TestController(),
//                     builder: (TestController testController) {
//                       return Column(
//                         children: [
//                           Text(
//                             '${testController.dataGx.id}',
//                             style:
//                                 TextStyle(color: testController.dataGx.colore),
//                           ),
//                           Text(testController.dataGx.title),
//                           Text('${testController.dataGx.price}')
//                         ],
//                       );
//                     }),

//                 // ElevatedButton(
//                 //     onPressed: () {
//                 //       Get.find<TestController>().setNewProduct();
//                 //     },
//                 //     child: const Text('add')),
//                 // ElevatedButton(onPressed: () {}, child: const Text('next page')),
//               ]),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: 100,
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Text('$index.test');
                  }),
            ),
          )
        ],
      ),
    );
  }
}
