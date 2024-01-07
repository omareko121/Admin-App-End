// ignore_for_file: prefer_const_constructors, deprecated_member_use, await_only_futures, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/bindinges/binding.dart';
import 'package:wirless_delivery/core/serve/serveise.dart';
import 'package:wirless_delivery/view/thetop/Routs.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServese();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    Get.put(Myserveses());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: TextTheme()),
      // home: const Onbording(),
      initialBinding: Ininilbindings(),
      // routes: routes,
      getPages: routes,
    );
  }
}
