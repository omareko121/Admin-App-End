// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/controller/Users/edit.dart';
import 'package:wirless_delivery/controller/items/edit.dart';
import 'package:wirless_delivery/core/class/handledata.dart';
import 'package:wirless_delivery/core/function/validator.dart';
import 'package:wirless_delivery/core/shared/customdropdown.dart';
import 'package:wirless_delivery/core/shared/formfild.dart';

class UsersEdit extends StatelessWidget {
  const UsersEdit({super.key});

  @override
  Widget build(BuildContext context) {
    UsersEditController controller = Get.put(UsersEditController());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(top: 10, bottom: 30, left: 15, right: 15),
          child: Container(
            child: InkWell(
              onTap: () {
                controller.editusers();
              },
              child: Container(
                height: 45,
                width: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 59, 0, 77),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text(
                    "Edit User",
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
            'User Edit',
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
        body: GetBuilder<UsersEditController>(
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
                                "Write User Ditiles",
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
                              lable: 'User Name',
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
                              lable: 'User email',
                              iconData: Icons.numbers,
                              mycontlloer: controller.email,
                              valid: (val) {
                                return validator(val!, 1, 100, "type");
                              },
                              isNumber: false),
                          SizedBox(
                            height: 15,
                          ),
                          GlobalForm(
                              lable: 'User Phone',
                              iconData: Icons.price_change,
                              mycontlloer: controller.phone,
                              valid: (val) {
                                return validator(val!, 1, 20, "type");
                              },
                              isNumber: true),
                          SizedBox(
                            height: 15,
                          ),
                          GlobalForm(
                              lable: 'User Verfiycode',
                              iconData: Icons.discount,
                              mycontlloer: controller.verficode,
                              valid: (val) {
                                return validator(val!, 5, 5, "type");
                              },
                              isNumber: true),
                          SizedBox(
                            height: 25,
                          ),
                          RadioListTile(
                              title: Text(
                                "active",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 190, 41),
                                    fontSize: 17),
                              ),
                              value: ("1"),
                              groupValue: controller.active,
                              onChanged: (val) {
                                controller.updateactivevalue(val);
                              }),
                          RadioListTile(
                              title: Text(
                                "hidden",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 155, 0, 0),
                                    fontSize: 17),
                              ),
                              value: ("0"),
                              groupValue: controller.active,
                              onChanged: (val) {
                                controller.updateactivevalue(val);
                              }),
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
