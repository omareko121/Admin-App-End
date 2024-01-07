// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/validator.dart';
import 'package:wirless_delivery/view/Widgets/auth/formfeld.dart';
import 'package:wirless_delivery/view/screen/auth/button.dart';


import '../../../../controller/auth/forgetpaswword.dart';

class ForgetPaswwored extends StatelessWidget {
  const ForgetPaswwored({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    forgetpaswoordcontrollerimp contlloer =
        Get.put(forgetpaswoordcontrollerimp());
    return Scaffold(
      body: Form(
        key: contlloer.formstate,
        child: GetBuilder<forgetpaswoordcontrollerimp>(builder: (controller) => 
        controller.statusRequest == StatusRequest.loading?
         Center(
            child: Lottie.asset("assest/lootis/animation_lnt2zzqr.json" , height: 250 , width: 250))
        :
        Container(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: ListView(children: [
            SizedBox(
              height: 180,
            ),
            Text(
              "التحقق من الايميل ل اعاده تعيين كلمه المرور",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
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
            FormFeld(
              isNumber: false,
              valid: (val) {
                return validator(val!, 5, 30, "email");
              },
              iconData: Icons.email_outlined,
              lable: 'البريد الالكتروني',
              mycontlloer: contlloer.email,
            ),
            SizedBox(
              height: 30,
            ),
            Buttonoflogin(
              text: 'التحقق الان',
              onPressed: () {
                contlloer.gotov();
              },
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),)
      ),
    );
  }
}
