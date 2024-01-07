

import 'package:wirless_delivery/core/class/crud.dart';
import 'package:wirless_delivery/view/thetop/linkapi.dart';

class verefiycodeemail {
  Crud crud;
  verefiycodeemail(this.crud);

  postdata(String email ,String verifycode , ) async {
    var response = await crud.posdata(AppLink.vemail, {
      "email" : email, 
      "verfiycode" : verifycode, 
    });
    return response.fold((l) => l, (r) => r);
  }




  resend(String email)async{
        var response = await crud.posdata(AppLink.resndVerfycode, {
      "email" : email, 
    });
    return response.fold((l) => l, (r) => r);
  }
}
