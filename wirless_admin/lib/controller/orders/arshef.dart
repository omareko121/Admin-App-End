import 'package:get/get.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/core/serve/serveise.dart';
import 'package:wirless_delivery/data/Models/orderpanding.dart';
import 'package:wirless_delivery/data/datasoures/remout/orders/order.dart';

class Arshevscontroller extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());

  List<OrdersModel> data = [];

  Myserveses myserveses = Get.find();

  late StatusRequest statusRequest;

  printpaymentmethod(int val) {
    if (val == 0) {
      return "Credit Card";
    } else if (val == 1) {
      return "PayPal";
    }
  }

  printorderstuts(String val) {
    if (val == "1") {
      return "في قائمة الانتظار";
    } else if (val == "2") {
      return "قيد التنفيذ";
    } else if (val == "3") {
      return " 🔥 في الطريق ";
    } else if (val == "4") {
      return "تم التوصيل";
    }
  }

  getorders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.archive();
    statusRequest = hundlingdata(response);
    print("--------------------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }



  refreshe() {
    getorders();
  }

  @override
  void onInit() {
    getorders();
    super.onInit();
  }
}
