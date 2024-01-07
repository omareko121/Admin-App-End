// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wirless_delivery/controller/auth/VEmail.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';


class Virevaycode extends StatelessWidget {
  const Virevaycode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Vircodepasewowrimp contlloer = Get.put(Vircodepasewowrimp());
    return Scaffold(
        body: GetBuilder<Vircodepasewowrimp>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? Center(
              child: Lottie.asset("assest/lootis/animation_lnt2zzqr.json",
                  height: 250, width: 250))
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView(children: [
                SizedBox(
                  height: 180,
                ),
                Text(
                  "تم ارسال الرمز الى عنوان البريد   ${contlloer.email} الرجاء التحقق من ",
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: OtpTextField(
                    fieldWidth: 55,
                    borderRadius: BorderRadius.circular(12),
                    margin: EdgeInsets.only(left: 10),
                    numberOfFields: 5,
                    borderColor: Color.fromARGB(255, 23, 3, 70),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      contlloer.gotresetpaswv(verificationCode);
                    }, // end onSubmit
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ]),
            ),
    ));
  }
}
