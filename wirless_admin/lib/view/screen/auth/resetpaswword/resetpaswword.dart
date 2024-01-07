// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/controller/auth/resetpaswoord.dart';
import 'package:wirless_delivery/core/function/validator.dart';
import 'package:wirless_delivery/view/Widgets/auth/formfeld.dart';
import 'package:wirless_delivery/view/screen/auth/button.dart';


class Resetpaswword extends StatelessWidget {
  const Resetpaswword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    resetpascontllerimp contlloer = Get.put(resetpascontllerimp());

    return Scaffold(
      body: Form(
        key: contlloer.formstate,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: ListView(children: [
            SizedBox(
              height: 180,
            ),
            Text(
              "تم التحقق بنجاح الرجاء ادخال كلمه المرور المراد استخدامها",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontFamily: 'myfont1',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
            ),
            GetBuilder<resetpascontllerimp>(builder: (contlloer) => FormFeld(
                isNumber: false,
                valid: (val) {
                  return validator(val!, 5, 30, "password");
                },
                Visiablity: contlloer.isvis,
                onTap: () {
                  contlloer.showpassword();
                },
                iconData: contlloer.isvis? Icons.visibility_off: Icons.visibility ,
                lable: 'كلمه المرور',
                mycontlloer: contlloer.newpaswword,
              ),),
            SizedBox(
              height: 20,
            ),
            FormFeld(
              Visiablity: true,
              isNumber: false,
              valid: (val) {
                return validator(val!, 5, 30, "password");
              },
              iconData: Icons.lock_outline,
              lable: 'اعد ادخال باسوورد',
              mycontlloer: contlloer.Renewpaswword,
            ),
            SizedBox(
              height: 30,
            ),
            Buttonoflogin(
              text: 'حفظ المعلومات',
              onPressed: () {
                contlloer.gotopaswwordpage();
              },
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
