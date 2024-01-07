import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/core/serve/serveise.dart';
import 'package:wirless_delivery/data/Models/orderpanding.dart';
import 'package:wirless_delivery/data/datasoures/remout/orders/order.dart';

class pandingordercontroller extends GetxController {
  OrdersData orderdata = OrdersData(Get.find());

  List<OrdersModel> data = [];

  Myserveses myserveses = Get.find();

  late StatusRequest statusRequest;

  printpaymentmethod(int val) {
    if (val == 0) {
      return "Online Pay";
    } else if (val == 1) {
      return "PayPal";
    }
  }

  printorderstuts(String val) {
    if (val == "0") {
      return "قائمة الانتظار";
    } else if (val == "1") {
      return "قيد التنفيذ";
    } else if (val == "2") {
      return "ركب الطيارة";
    } else if (val == "3") {
      return " 🔥في الطريق ";
    } else if (val == "4") {
      return "تم التوصيل";
    }
  }

  getorders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderdata.orderspanding();
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

  abbroveorder(String userid, String ordersId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderdata.approve(
      ordersId,
      userid,
    
    );
    statusRequest = hundlingdata(response);
    print("--------------------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getorders();
        Get.rawSnackbar(
            duration: const Duration(seconds: 4),
            backgroundColor: Color.fromARGB(255, 255, 39, 39),
            messageText: const Text(
                "تم  توصيل الطلب واكمال عملية التوصيل شكرا لك",
                style: TextStyle(
                    fontFamily: 'myfont1',
                    fontSize: 0,
                    color: Color.fromARGB(255, 255, 255, 255))),
            titleText: const Text(
              "تم استلام الطلب بنجاح الرجاء توصيل الطلب فورا",
              style: TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ));
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
