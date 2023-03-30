// import 'package:blog_app/controller/test_controller.dart';
// import 'package:blog_app/models/model_test.dart';
// import 'package:flutter/material.dart';
// import 'package:get/instance_manager.dart';
// import 'package:get/route_manager.dart';
// import 'package:get/state_manager.dart';

// class TestSecond extends StatelessWidget {
//   TestSecond({Key? key}) : super(key: key);

//   TestController secondTestController = Get.put(
//       TestController(dataGx: TestModel(id: 1, title: ' title', price: 1).obs));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('second page'),
//       ),
//       body: Center(
//         child: Column(mainAxisAlignment: MinAxisAlignment.center, children: [
//           Obx(() {
//             return Column(
//               children: [
//                 Text('${secondTestController.dataGx.value.id}'),
//                 Text(secondTestController.dataGx.value.title),
//                 Text('${secondTestController.dataGx.value.price}')
//               ],
//             );
//           }),
//           const SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 secondTestController.dataGx.update((val) {
//                   val!.id = 2;
//                   val.title = 'another Test';
//                   val.price = 2000;
//                 });
//               },
//               child: const Text('add')),
//           ElevatedButton(
//               onPressed: () {
//                 Get.back();
//               },
//               child: const Text('add')),
//         ]),
//       ),
//     );
//   }
// }
