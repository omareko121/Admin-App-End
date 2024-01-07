// import 'package:get/get.dart';
// import 'package:wirless_delivery/core/class/statusRequest.dart';
// import 'package:wirless_delivery/core/function/hundlingdata.dart';
// import 'package:wirless_delivery/data/datasoures/remout/cat/cat.dart';

// class Deletecatcontroller extends GetxController {
//   CategoriesData categoriesData = CategoriesData(Get.find());

//   List data = [];

//   late StatusRequest statusRequest;

//   getData() async {
//     statusRequest = StatusRequest.loading;
//     var response = await categoriesData.delete();
//     statusRequest = hundlingdata(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == 'success') {
//         data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.falier;
//       }
//     }

//     update();
//   }

//   @override
//   void onInit() {
//     getData();
//     super.onInit();
//   }
// }
