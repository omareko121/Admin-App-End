// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:wirless_delivery/core/medele/mymedele.dart';
import 'package:wirless_delivery/view/cat/add.dart';
import 'package:wirless_delivery/view/cat/edit.dart';
import 'package:wirless_delivery/view/cat/view.dart';
import 'package:wirless_delivery/view/items/add.dart';
import 'package:wirless_delivery/view/items/edit.dart';
import 'package:wirless_delivery/view/items/view.dart';
import 'package:wirless_delivery/view/notification/add.dart';
import 'package:wirless_delivery/view/notification/toall.dart';
import 'package:wirless_delivery/view/screen/accepted.dart';
import 'package:wirless_delivery/view/screen/auth/login.dart';
import 'package:wirless_delivery/view/screen/homepage.dart';
import 'package:wirless_delivery/view/screen/homescreen.dart';
import 'package:wirless_delivery/view/screen/orders/ditiles.dart';
import 'package:wirless_delivery/view/screen/orders/arshef.dart';
import 'package:wirless_delivery/view/users/add.dart';
import 'package:wirless_delivery/view/users/edit.dart';
import 'package:wirless_delivery/view/users/view.dart';


import '../../data/Models/catogris.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(name: "/", page: () => const Login(), middlewares: [Mymedele()]),
  GetPage(name: "/", page: () => const homepage()),
  GetPage(name: "/HomeScreenOrders", page: () => const HomeScreen()),
  GetPage(name: "/archive", page: () => const orderarshef()),
  GetPage(name: "/login", page: () => const Login()),
  GetPage(name: "/ordersditiles", page: () => const ordersditles()),
  GetPage(name: "/Accepted", page: () =>     Accepted(),),
  GetPage(name: "/categories", page: () =>     Catview(),),
  GetPage(name: "/categoriesEdit", page: () =>     CatEdit(),),
  GetPage(name: "/categoriesAdd", page: () =>     Catadd(),),
  GetPage(name: "/itemsview", page: () =>     itemsview(),),
  GetPage(name: "/itemsadd", page: () =>     itemsadd(),),
  GetPage(name: "/itemsEdit", page: () =>     itemsEdit(),),
  GetPage(name: "/usersview", page: () =>     Usersview(),),
  GetPage(name: "/usersedit", page: () =>     UsersEdit(),),
  GetPage(name: "/usersadd", page: () =>     Usersadd(),),
  GetPage(name: "/sendtoperson", page: () =>     Notisendtoperson(),),
  GetPage(name: "/notisendtoall", page: () =>     Notisendtoall(),),


  // GetPage(name: "/", page: () =>  momo()),
  // GetPage(name: "/", page: () =>  tappayment()),
];
