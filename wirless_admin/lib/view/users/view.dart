// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/controller/Users/view.dart';
import 'package:wirless_delivery/controller/cat/view.dart';
import 'package:wirless_delivery/controller/items/view.dart';
import 'package:wirless_delivery/core/class/handledata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wirless_delivery/data/Models/items.dart';
import 'package:wirless_delivery/data/Models/usersmodel.dart';
import 'package:wirless_delivery/view/cat/add.dart';
import 'package:wirless_delivery/view/thetop/linkapi.dart';

class Usersview extends StatelessWidget {
  const Usersview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Viewuserscontroller());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 0, 49, 88),
          onPressed: () {
            Get.toNamed('/usersadd');
          },
          child: Center(
              child: Icon(
            Icons.person_add_alt,
            size: 34,
            color: Colors.white,
          )),
        ),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Users',
            style: TextStyle(
                fontFamily: 'myfont1',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 59, 0, 77),
                fontSize: 25),
          ),
          leading: IconButton(
              onPressed: () {
                Get.offAllNamed("/homepage");
              },
              icon: Icon(
                Icons.navigate_before,
                color: Color.fromARGB(255, 59, 0, 77),
                size: 35,
              )),
        ),
        body: GetBuilder<Viewuserscontroller>(
            builder: (controller) => Handledata(
                  statusrequest: controller.statusRequest,
                  widget: Container(
                      child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.only(top: 30, right: 30),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: const Color.fromARGB(255, 0, 49, 88)),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "${controller.data[index].usersId}",
                                          style: TextStyle(
                                              fontFamily: 'myfont1',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(" : عميل رقم ",
                                        style: TextStyle(
                                            fontFamily: 'myfont1',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 165, 215, 255))),
                                  ],
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${controller.data[index].usersName}",
                                      style: TextStyle(
                                          fontFamily: 'myfont1',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      " : الاسم",
                                      style: TextStyle(
                                          fontFamily: 'myfont1',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${controller.data[index].usersEmail}",
                                      style: TextStyle(
                                          fontFamily: 'myfont1',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      ": الايميل",
                                      style: TextStyle(
                                          fontFamily: 'myfont1',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${controller.data[index].usersPhone}",
                                      style: TextStyle(
                                          fontFamily: 'myfont1',
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      ": رقم الهاتف",
                                      style: TextStyle(
                                          fontFamily: 'myfont1',
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${controller.data[index].usersApprove}",
                                      style: TextStyle(
                                          fontFamily: 'myfont1',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      " : رقم التفعيل",
                                      style: TextStyle(
                                          fontFamily: 'myfont1',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 187, 12, 0),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(22),
                                            topLeft: Radius.circular(22),
                                          )),
                                      child: IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        22)),
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: Container(
                                                      height: 240,
                                                      width: double.infinity,
                                                      margin: EdgeInsets.only(
                                                          top: 20,
                                                          left: 4,
                                                          right: 4),
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              " هل انت متاكد انك تريد حذف المستخدم بشكل نهائي ؟ ",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'myfont1',
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      0,
                                                                      0,
                                                                      0)),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        controller.delete(controller
                                                                            .data[index]
                                                                            .usersId!);
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        padding: EdgeInsets.only(
                                                                            left:
                                                                                33,
                                                                            right:
                                                                                33),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(22),
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              18,
                                                                              153,
                                                                              18),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          "نعم",
                                                                          style: TextStyle(
                                                                              fontFamily: 'myfont1',
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 22,
                                                                              color: Color.fromARGB(255, 255, 255, 255)),
                                                                        ),
                                                                      )),
                                                                  SizedBox(
                                                                    width: 55,
                                                                  ),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(22),
                                                                            color: Colors.red[800]),
                                                                        padding: EdgeInsets.only(
                                                                            left:
                                                                                33,
                                                                            right:
                                                                                33),
                                                                        child:
                                                                            Text(
                                                                          "لا",
                                                                          style: TextStyle(
                                                                              fontFamily: 'myfont1',
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 22,
                                                                              color: Color.fromARGB(255, 255, 255, 255)),
                                                                        ),
                                                                      )),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 39, 0, 90),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(22),
                                            topLeft: Radius.circular(22),
                                          )),
                                      child: IconButton(
                                          onPressed: () {
                                            controller.gotoEditdata(
                                                controller.data[index]);
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ));
                    },
                  )),
                )));
  }
}
