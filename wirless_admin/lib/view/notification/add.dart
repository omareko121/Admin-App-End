// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/controller/notification/toperson.dart';
import 'package:wirless_delivery/core/class/handledata.dart';
import 'package:wirless_delivery/core/function/validator.dart';
import 'package:wirless_delivery/core/shared/customdropdown.dart';
import 'package:wirless_delivery/core/shared/formfild.dart';

class Notisendtoperson extends StatelessWidget {
  const Notisendtoperson({super.key});

  @override
  Widget build(BuildContext context) {
    Notivicationcontrollertoperson controller = Get.put(Notivicationcontrollertoperson());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(top: 10, bottom: 30, left: 15, right: 15),
          child: Container(
            child: InkWell(
              onTap: () {
                controller.send();
              },
              child: Container(
                height: 45,
                width: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 59, 0, 77),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text(
                    "Send notification",
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
            'Notification To Person',
            style: TextStyle(
                fontFamily: 'myfont1',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 59, 0, 77),
                fontSize: 17),
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
        body: GetBuilder<Notivicationcontrollertoperson>(
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
                                "Write Notification Details",
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
                              lable: 'title',
                              iconData: Icons.edit,
                              mycontlloer: controller.title,
                              valid: (val) {
                                return validator(val!, 1, 70, "type");
                              },
                              isNumber: false),
                          SizedBox(
                            height: 15,
                          ),
                          GlobalForm(
                              lable: 'body , message',
                              iconData: Icons.text_increase_sharp,
                              mycontlloer: controller.body,
                              valid: (val) {
                                return validator(val!, 1, 500, "type");
                              },
                              isNumber: false),
                        
                          SizedBox(
                            height: 25,
                          ),
                          Dropdownlist(
                            title: 'Choose Person',
                            listdata: controller.dropdownList,
                            dropdownSelctedname: controller.username,
                            dropdownSelctedid: controller.userid,
                            
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
                        
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
