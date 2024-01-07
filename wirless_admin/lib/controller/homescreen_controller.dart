// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/view/screen/accepted.dart';
import 'package:wirless_delivery/view/screen/homepage.dart';
import 'package:wirless_delivery/view/screen/orders/orders.dart';
import 'package:wirless_delivery/view/screen/siiting.dart';

abstract class HomeScreenController extends GetxController {
  chnagepage(int creenutpage);
}

class HomeScreenControllerImb extends HomeScreenController {
  int curuntpage = 0;

  List<Widget> listpage = [
    orderspanding(),
  ];

  @override
  chnagepage(int i) {
    curuntpage = i;
    update();
  }
}
