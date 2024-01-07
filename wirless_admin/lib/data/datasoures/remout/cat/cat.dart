import 'dart:io';
import 'package:wirless_delivery/core/class/crud.dart';
import 'package:wirless_delivery/view/thetop/linkapi.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  add(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.addcat, data, file);
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.posdata(AppLink.deleteCat, data);
    return response.fold((l) => l, (r) => r);
  }

  view() async {
    var response = await crud.posdata(AppLink.catveiw, {});
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.posdata(AppLink.editCat, data);
    } else {
      response = await crud.addRequestWithImageOne(AppLink.editCat, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }
}
