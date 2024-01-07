import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/controller/Users/view.dart';
import 'package:wirless_delivery/controller/items/view.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/data/Models/usersmodel.dart';
import 'package:wirless_delivery/data/datasoures/remout/users/users.dart';

class UsersEditController extends GetxController {
  UsersData usersData = UsersData(Get.find());

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController verficode;

  Usersmodel? usersmodel;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;

  updateactivevalue(val) {
    active = val;
    update();
  }

  String? active;

  editusers() async {
    if (formkey.currentState!.validate()) {
      // if (file == null) {
      //   Get.snackbar("Error", "Image is required. Please select an image");
      // }

      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": usersmodel!.usersId,
        "name": name.text,
        "email": email.text,
        "phone": phone.text,
        "verifaidcode": verficode.text,
        "approve": active,
      };
      var response = await usersData.edit(data);
      statusRequest = hundlingdata(response);
      print("------------------------------------$response");

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed("/usersview");
          Viewuserscontroller c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.falier;
        }
      }

      update();
    } else {
      Get.snackbar("Error", "Please Write All ditiles To The item");
    }
  }

  mybake() {
    Get.offAllNamed("/homepage");
  }

  @override
  void onInit() {
    usersmodel = Get.arguments['usersmodel'];
    name = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    verficode = TextEditingController();

    // active = TextEditingController();
    name.text = usersmodel!.usersName!;
    phone.text = usersmodel!.usersPhone.toString();
    email.text = usersmodel!.usersEmail!;
    verficode.text = usersmodel!.usersVerifaidcode.toString();
    active = usersmodel!.usersApprove.toString();

    super.onInit();
  }
}
