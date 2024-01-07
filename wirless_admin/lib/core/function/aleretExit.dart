// ignore_for_file: prefer_const_constructors, file_names

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

Future<bool> aleartExit() {
  Get.defaultDialog(
      title: "تنبيه",
      titleStyle: const TextStyle(fontWeight: FontWeight.bold , fontFamily: 'myfont1' , fontSize: 20 , color: Color.fromARGB(255, 0, 0, 0)),
      middleText: "هل تريد الخروج من التطبيق",
      middleTextStyle: const TextStyle(fontWeight: FontWeight.bold , fontFamily: 'myfont1' , fontSize: 17 , color: Color.fromARGB(255, 0, 0, 0)),
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text("نعم"  , style: TextStyle(fontSize: 18 , color: Colors.white , fontFamily: "myfont1" , fontWeight: FontWeight.bold),)),
            SizedBox(width: 10,),
        ElevatedButton(
          
        
            onPressed: () {
              Get.back();
            },
            child: Text("لا" , style: TextStyle(fontSize: 18 , color: Colors.white , fontFamily: "myfont1" , fontWeight: FontWeight.bold),)),
      ]);
  return Future.value(true);
}
