// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/data/Models/catogris.dart';
import 'package:wirless_delivery/data/datasoures/remout/cat/cat.dart';

class Viewcatcontroller extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<Catigoris> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.view();
    statusRequest = hundlingdata(response);
    print("------------------------------------$response");

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => Catigoris.fromJson(e)));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  GotoEditdata(Catigoris catigorismodel) {
    Get.toNamed("/categoriesEdit", arguments: {'datamodel': catigorismodel});
  }

  delete(String id, String imagename) {
    categoriesData.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
