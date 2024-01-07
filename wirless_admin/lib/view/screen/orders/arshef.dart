// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';
import 'package:wirless_delivery/controller/orders/arshef.dart';
import 'package:wirless_delivery/core/class/handledata.dart';
import 'package:wirless_delivery/data/Models/orderpanding.dart';

class orderarshef extends StatelessWidget {
  const orderarshef({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Arshevscontroller());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 39, 39),
        title: const Text(
          "الـمـحـفـوظـات",
          style: TextStyle(
              fontFamily: 'myfont1',
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 39,
          ),
        ),
      ),
      body: Container(
        child: GetBuilder<Arshevscontroller>(
            builder: (controller) => Handledata(
                statusrequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => CardOrders(
                    listdata: controller.data[index],
                  ),
                ))),
      ),
    );
  }
}

class CardOrders extends GetView<Arshevscontroller> {
  final OrdersModel listdata;
  const CardOrders({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Card(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text("${listdata.oredersDatetime}"),
                  Lottie.asset(
                    "assest/lootis/succsesful.json",
                    height: 50,
                  ),

                  Text(
                    "432${listdata.oredersId} : رقم الطلب ",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
                color: const Color.fromARGB(255, 0, 37, 68),
                endIndent: 0,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ":",
                        style: TextStyle(
                            fontFamily: 'myfont1',
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.shopping_cart_checkout,
                        color: Colors.black,
                        size: 27,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "مـعـلـومـات الـطـلـب",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Online Pay",
                        style: TextStyle(
                            fontFamily: 'myfont1',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.payment_outlined),
                    ],
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    ": وسـيـلـة الـدفـع",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SAR ${listdata.oredersTotalprice!.toStringAsFixed(1)}",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    ": الـمبـلـغ الـاجـمـالـي",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${listdata.oredersAddress}",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    ": عـنـوان الـتـوصـيـل رقـم",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${listdata.addressPhone.toString()}",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    ": رقم العميل للتواصل",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "مجاني",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "سـعـر الـتـوصـيـل",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${controller.printorderstuts(listdata.oredersStatus.toString())}",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    ": حـالـة الـطـلـب",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
                color: const Color.fromARGB(255, 0, 37, 68),
                endIndent: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Container(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/ordersditiles", arguments: {
                            "ordermodel": listdata,
                          });
                        },
                        child: Container(
                          height: 45,
                          width: 110,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 39, 39),
                              borderRadius: BorderRadius.circular(13)),
                          child: Center(
                            child: Text(
                              "الـمـزيـد",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'myfont1'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
