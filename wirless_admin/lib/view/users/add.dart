// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/controller/Users/add.dart';
import 'package:wirless_delivery/core/class/handledata.dart';
import 'package:wirless_delivery/core/function/validator.dart';
import 'package:wirless_delivery/core/shared/formfild.dart';

class Usersadd extends StatelessWidget {
  const Usersadd({super.key});

  @override
  Widget build(BuildContext context) {
    Addusercontroller controller = Get.put(Addusercontroller());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(top: 10, bottom: 30, left: 15, right: 15),
          child: Container(
            child: InkWell(
              onTap: () {
                controller.adddata();
              },
              child: Container(
                height: 45,
                width: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 59, 0, 77),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text(
                    "Add User",
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
            'User Add',
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
        body: GetBuilder<Addusercontroller>(
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
                              lable: 'User Password',
                              iconData: Icons.edit,
                              mycontlloer: controller.password,
                              valid: (val) {
                                return validator(val!, 1, 20, "type");
                              },
                              isNumber: false),
                          SizedBox(
                            height: 15,
                          ),

                          GlobalForm(
                              lable: 'User email',
                              iconData: Icons.edit,
                              mycontlloer: controller.email,
                              valid: (val) {
                                return validator(val!, 1, 20, "type");
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
                            height: 40,
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
