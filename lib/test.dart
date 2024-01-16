// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'features/auth/presentation/controllers/login_controller.dart';
// import 'injection_container.dart' as di;

// class YourPage extends StatelessWidget {
//   final LoginController apiController = Get.put(di.sl<LoginController>());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your App'),
//       ),
//       body: Center(
//         child: Obx(
//           () {
//             if (apiController.isLoading.value) {
//               return CircularProgressIndicator();
//             } else if (apiController.isError.value) {
//               return Text(apiController.errorMessage.value);
//             } else if (apiController.authenticatedUser != null) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Name: ${apiController}'),
//                   Text('Age: ${apiController}'),
//                 ],
//               );
//             } else {
//               return Text('No data available');
//             }
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => apiController.login(
//           context: context,
//           countryCode: '+20',
//           deviceToken: '123sahdsahd',
//           phone: '01011499336',
//           dviceType: 'A',
//           signUpType: 'S',
//         ),
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }
