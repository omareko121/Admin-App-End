import 'package:wirless_delivery/core/class/crud.dart';
import 'package:wirless_delivery/view/thetop/linkapi.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);

  orderspanding() async {
    var response = await crud.posdata(AppLink.view, {});
    return response.fold((l) => l, (r) => r);
  }

  approve(String orderid, String userid) async {
    var response = await crud.posdata(AppLink.approve, {
      "ordersid": orderid,
      "usersid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  ditiles(String orderid) async {
    var response = await crud.posdata(AppLink.details, {
      "id": orderid,
    });
    return response.fold((l) => l, (r) => r);
  }

  archive() async {
    var response = await crud.posdata(AppLink.archive, {});
    return response.fold((l) => l, (r) => r);
  }

  perper(String orderid, String userid) async {
    var response = await crud.posdata(AppLink.perper, {
      "ordersid": orderid,
      "usersid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewaccepted() async {
    var response = await crud.posdata(AppLink.viewaccpted, {});
    return response.fold((l) => l, (r) => r);
  }
}
