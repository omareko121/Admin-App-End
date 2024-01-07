// ignore_for_file: file_names


import 'package:wirless_delivery/core/class/crud.dart';
import 'package:wirless_delivery/view/thetop/linkapi.dart';

class CheckEmailRES {
  Crud crud;
  CheckEmailRES(this.crud);

  postdata(String email) async {
    var response = await crud.posdata(AppLink.checkres, {
      "email" : email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
