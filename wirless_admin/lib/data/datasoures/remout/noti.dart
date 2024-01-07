// ignore_for_file: file_names

import 'package:wirless_delivery/core/class/crud.dart';
import 'package:wirless_delivery/view/thetop/linkapi.dart';

class Notidata {
  Crud crud;
  Notidata(this.crud);

  toall(String title, String body) async {
    var response = await crud.posdata(AppLink.notification, {
      "title": title,
      "body": body,
    });
    return response.fold((l) => l, (r) => r);
  }

  toperson(String id, String title, String body) async {
    var response = await crud.posdata(AppLink.notitoperson, {
      "id": id,
      "title": title,
      "body": body,
    });
    return response.fold((l) => l, (r) => r);
  }
}
