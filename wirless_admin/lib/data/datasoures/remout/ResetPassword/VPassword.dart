
import 'package:wirless_delivery/core/class/crud.dart';
import 'package:wirless_delivery/view/thetop/linkapi.dart';

class Vpassword {
  Crud crud;
  Vpassword(this.crud);

  postdata(String email , String Verfiycode) async {
    var response = await crud.posdata(AppLink.vpasswordresset, {
      "email" : email , 
      "verfiycode" : Verfiycode , 
    });
    return response.fold((l) => l, (r) => r);
  }
}
