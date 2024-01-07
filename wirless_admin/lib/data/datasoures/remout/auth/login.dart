
import 'package:wirless_delivery/core/class/crud.dart';
import 'package:wirless_delivery/view/thetop/linkapi.dart';

class Logindata {
  Crud crud;
  Logindata(this.crud);

  postdata(String email , String password) async {
    var response = await crud.posdata(AppLink.login, {
      "email" : email , 
      "password" : password , 
    });
    return response.fold((l) => l, (r) => r);
  }
}
