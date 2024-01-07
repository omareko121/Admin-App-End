import 'dart:io';
import 'package:wirless_delivery/core/class/crud.dart';
import 'package:wirless_delivery/view/thetop/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  add(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.itemsadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.posdata(AppLink.itemsdelete, data);
    return response.fold((l) => l, (r) => r);
  }

  view() async {
    var response = await crud.posdata(AppLink.itemsview, {});
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.posdata(AppLink.itemsEdit, data);
    } else {
      response = await crud.addRequestWithImageOne(AppLink.itemsEdit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }
}
