// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/controller/items/add.dart';
import 'package:wirless_delivery/core/class/handledata.dart';
import 'package:wirless_delivery/core/function/validator.dart';
import 'package:wirless_delivery/core/shared/customdropdown.dart';
import 'package:wirless_delivery/core/shared/formfild.dart';

class itemsadd extends StatelessWidget {
  const itemsadd({super.key});

  @override
  Widget build(BuildContext context) {
    Additemscontroller controller = Get.put(Additemscontroller());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(top: 10, bottom: 30, left: 15, right: 15),
          child: Container(
            child: InkWell(
              onTap: () {
                controller.getData();
              },
              child: Container(
                height: 45,
                width: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 59, 0, 77),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text(
                    "Add Items",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'myfont1'),
                  ),
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Items Add',
            style: TextStyle(
                fontFamily: 'myfont1',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 59, 0, 77),
                fontSize: 25),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.navigate_before,
                color: Color.fromARGB(255, 59, 0, 77),
                size: 35,
              )),
        ),
        body: GetBuilder<Additemscontroller>(
            builder: (controller) => Handledata(
                  statusrequest: controller.statusRequest!,
                  widget: Container(
                    margin: EdgeInsets.only(
                        top: 60, left: 15, right: 15, bottom: 10),
                    child: Form(
                      key: controller.formkey,
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.near_me,
                                size: 25,
                                color: Color.fromARGB(255, 59, 0, 77),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Write Items Ditiles",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 59, 0, 77),
                                    fontSize: 21),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GlobalForm(
                              lable: 'items Name',
                              iconData: Icons.edit,
                              mycontlloer: controller.name,
                              valid: (val) {
                                return validator(val!, 1, 20, "type");
                              },
                              isNumber: false),
                          SizedBox(
                            height: 15,
                          ),
                          GlobalForm(
                              lable: 'items desc',
                              iconData: Icons.text_increase_sharp,
                              mycontlloer: controller.desc,
                              valid: (val) {
                                return validator(val!, 1, 20, "type");
                              },
                              isNumber: false),
                          SizedBox(
                            height: 15,
                          ),
                          GlobalForm(
                              lable: 'items count',
                              iconData: Icons.numbers,
                              mycontlloer: controller.count,
                              valid: (val) {
                                return validator(val!, 1, 20, "type");
                              },
                              isNumber: true),
                          SizedBox(
                            height: 15,
                          ),
                          GlobalForm(
                              lable: 'items Price',
                              iconData: Icons.price_change,
                              mycontlloer: controller.price,
                              valid: (val) {
                                return validator(val!, 1, 20, "type");
                              },
                              isNumber: true),
                          SizedBox(
                            height: 15,
                          ),
                          GlobalForm(
                              lable: 'items discount',
                              iconData: Icons.discount,
                              mycontlloer: controller.discount,
                              valid: (val) {
                                return validator(val!, 1, 20, "type");
                              },
                              isNumber: true),
                          SizedBox(
                            height: 25,
                          ),
                          Dropdownlist(
                            title: 'Choose Category',
                            listdata: controller.dropdownList,
                            dropdownSelctedname: controller.catname,
                            dropdownSelctedid: controller.catid,
                            
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Divider(
                            color: Color.fromARGB(255, 59, 0, 77),
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.image,
                                size: 25,
                                color: Color.fromARGB(255, 59, 0, 77),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Choose items Image",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 59, 0, 77),
                                    fontSize: 21),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          MaterialButton(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(33)),
                            color: Color.fromARGB(255, 59, 0, 77),
                            onPressed: () {
                              controller.chooseImg();
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 7, bottom: 7),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add_a_photo,
                                    size: 29,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  Text(
                                    "Choose Image",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontFamily: 'Myfont1'),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          if (controller.file != null)
                            Image.file(
                              controller.file!,
                              height: 250,
                            ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
