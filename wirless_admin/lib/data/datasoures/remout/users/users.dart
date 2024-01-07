// ignore_for_file: file_names

import 'package:wirless_delivery/core/class/crud.dart';
import 'package:wirless_delivery/view/thetop/linkapi.dart';

class UsersData {
  Crud crud;
  UsersData(this.crud);

  view() async {
    var response = await crud.posdata(AppLink.usersview, {});
    return response.fold((l) => l, (r) => r);
  }

  delete(String id) async {
    var response = await crud.posdata(AppLink.deleteusers, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data) async {
    var response = await crud.posdata(AppLink.editusers, data);
    return response.fold((l) => l, (r) => r);
  }

  add(Map data) async {
    var response = await crud.posdata(AppLink.addusers, data);
    return response.fold((l) => l, (r) => r);
  }
}
