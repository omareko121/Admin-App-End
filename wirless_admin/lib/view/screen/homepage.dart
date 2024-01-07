// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/view/Widgets/card.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Home Page',
          style: TextStyle(
              fontFamily: 'myfont1',
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 59, 0, 77),
              fontSize: 25),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        child: ListView(children: [
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 150),
            children: [
              Cardhome(
                title: 'Orders',
                onTap: () {
                  Get.toNamed("/HomeScreenOrders");
                },
                img: 'order.png',
              ),
              Cardhome(
                title: 'Products',
                onTap: () {
                  Get.toNamed("/itemsview");
                },
                img: '004-box.png',
              ),
              Cardhome(
                title: 'Categories',
                onTap: () {
                  Get.toNamed("/categories");
                },
                img: 'category_3502688.png',
              ),
              Cardhome(
                title: 'Users',
                onTap: () {
                  Get.toNamed("/usersview");
                },
                img:
                    '—Pngtree—businessman user avatar wearing suit_8385663.png',
              ),
              Cardhome(
                title: 'Notification',
                onTap: () {
                  Get.toNamed("/notisendtoall");
                },
                img: '1827301.png',
              ),
              Cardhome(
                title: 'NotiToPerson',
                onTap: () {
                  Get.toNamed("/sendtoperson");
                },
                img: 'notify.png',
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 30),
              child: Card(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 30),
                  child: Column(
                    children: [
                      Icon(
                        Icons.data_exploration_sharp,
                        size: 45,
                        color: Color.fromARGB(255, 59, 0, 77),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Center(
                            child: Text(
                          "We All work here only for customer satisfaction, So do not be busy with anything else !",
                          style: TextStyle(
                              fontFamily: 'myfont1',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 59, 0, 77),
                              fontSize: 17),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ],
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
