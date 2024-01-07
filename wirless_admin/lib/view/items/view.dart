// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/controller/cat/view.dart';
import 'package:wirless_delivery/controller/items/view.dart';
import 'package:wirless_delivery/core/class/handledata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wirless_delivery/data/Models/items.dart';
import 'package:wirless_delivery/view/cat/add.dart';
import 'package:wirless_delivery/view/thetop/linkapi.dart';

class itemsview extends StatelessWidget {
  const itemsview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Viewitemscontroller());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 59, 0, 77),
          onPressed: () {
            Get.toNamed("/itemsadd");
          },
          child: Center(
              child: Icon(
            Icons.plus_one_rounded,
            size: 34,
            color: Colors.white,
          )),
        ),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Products',
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
        body: GetBuilder<Viewitemscontroller>(
            builder: (controller) => Handledata(
                  statusrequest: controller.statusRequest,
                  widget: Container(
                      child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.only(left: 15, right: 15, bottom: 15),
                        child: Card(
                            child: Container(
                          margin:
                              EdgeInsets.only(top: 30, bottom: 30, left: 12),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${AppLink.itemsimgman}/${controller.data[index].itemsImg}',
                                    height: 90,
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
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
                                                                "Are you sure , You want to delete Category forever ?",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'myfont1',
                                                                    fontSize:
                                                                        20,
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
                                                                        top:
                                                                            30),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          controller.delete(
                                                                              controller.data[index].itemsId!,
                                                                              controller.data[index].itemsImg!);
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          padding: EdgeInsets.only(
                                                                              left: 33,
                                                                              right: 33),
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(22),
                                                                              color: Colors.red[800]),
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
                                                                              borderRadius: BorderRadius.circular(22),
                                                                              color: Color.fromARGB(255, 18, 153, 18)),
                                                                          padding: EdgeInsets.only(
                                                                              left: 33,
                                                                              right: 33),
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
                                              size: 26,
                                              color: Color.fromARGB(
                                                  255, 59, 0, 77),
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              controller.GotoEditdata(
                                                  controller.data[index]);
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                              size: 26,
                                              color: Color.fromARGB(
                                                  255, 59, 0, 77),
                                            )),
                                      ],
                                    ),
                                    title: Text(
                                      controller.data[index].itemsName!,
                                      style: TextStyle(
                                          fontFamily: 'myfont1',
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 59, 0, 77),
                                          fontSize: 19),
                                    ),
                                    subtitle: Text(
                                      controller.data[index].categoriesName!,
                                      style: TextStyle(
                                          fontFamily: 'myfont1',
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 59, 0, 77),
                                          fontSize: 15),
                                    ),
                                  )),
                            ],
                          ),
                        )),
                      );
                    },
                  )),
                )));
  }
}
