import 'package:get/get.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/core/serve/serveise.dart';
import 'package:wirless_delivery/data/Models/cartmodel.dart';
import 'package:wirless_delivery/data/Models/orderpanding.dart';
import 'package:wirless_delivery/data/datasoures/remout/orders/order.dart';


class orderconroller extends GetxController {
  OrdersModel? listmodel;

  OrdersData DitilesData = OrdersData(Get.find());

  List<cartmodel> data = [];

  late StatusRequest statusRequest;
  Myserveses myserveses = Get.find();

  @override
  void onInit() {
    listmodel = Get.arguments['ordermodel'];
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await DitilesData.ditiles(listmodel!.oredersId.toString());
    statusRequest = hundlingdata(response);
    print("--------------------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => cartmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  
}
