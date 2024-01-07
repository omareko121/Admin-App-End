// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/controller/homescreen_controller.dart';
import 'package:wirless_delivery/view/Widgets/butoonbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImb());

    return GetBuilder<HomeScreenControllerImb>(
      builder: (controller) => Scaffold(
          bottomNavigationBar: BottomAppBar(
              color: Color.fromARGB(255, 255, 255, 255),
              height: 78,
              shadowColor: Colors.black,
              shape: CircularNotchedRectangle(),
              notchMargin: 8,
              child: Row(children: [
                Expanded(
                  child: Butoombar(
                    onPressed: () {
                      controller.chnagepage(0);
                      controller.update();
                    },
                    iconData: Icons.timer,
                    tetxapp: 'Pending',
                    active: controller.curuntpage == 0 ? true : false,
                  ),
                ),
                Expanded(
                  child: Butoombar(
                    onPressed: () {
                      Get.toNamed("/Accepted");
                      
                    },
                    iconData: Icons.done_all,
                    tetxapp: 'Accepted',
                    active: controller.curuntpage == 1 ? true : false,
                  ),
                ),

                Expanded(
                  child: Butoombar(
                    onPressed: () {
                      Get.toNamed("/archive");
                      
                    },
                    iconData: Icons.archive,
                    tetxapp: 'Archive',
                    active: controller.curuntpage == 1 ? true : false,
                  ),
                ),
                
                
              ])),
          body: controller.listpage.elementAt(controller.curuntpage)),
    );
  }
}
