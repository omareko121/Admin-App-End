// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:wirless_delivery/controller/auth/login.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/validator.dart';
import 'package:wirless_delivery/view/Widgets/auth/formfeld.dart';
import 'package:wirless_delivery/view/screen/auth/button.dart';

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Logincontrollerimb contlloer = Get.put(Logincontrollerimb());
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'تسجيل الدخول',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Myfont1',
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: GetBuilder<Logincontrollerimb>(
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? Center(
                  child: Lottie.asset("assest/lootis/animation_lnt2zzqr.json",
                      height: 250, width: 250))
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: Form(
                    key: contlloer.formstate,
                    child: ListView(children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "اهلا بك عزيزي",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontFamily: 'Myfont1',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "هنا العاملين لدى ويرلس الرجاء تسجيل الدخول بالحساب الخاص بك عزيزي",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Myfont1',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      FormFeld(
                        isNumber: false,
                        iconData: Icons.email_outlined,
                        lable: 'البريد الالكتروني',
                        mycontlloer: contlloer.email,
                        valid: (val) {
                          return validator(val!, 5, 100, "email");
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GetBuilder<Logincontrollerimb>(
                        builder: (contlloer) => FormFeld(
                          isNumber: false,
                          valid: (val) {
                            return validator(val!, 5, 30, "password");
                          },
                          Visiablity: contlloer.isvis,
                          onTap: () {
                            contlloer.showpassword();
                          },
                          iconData: contlloer.isvis
                              ? Icons.visibility_off
                              : Icons.visibility,
                          lable: 'كلمه المرور',
                          mycontlloer: contlloer.paswword,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            contlloer.forgetpasgoto();
                          },
                          child: Text(
                            "نسيت كلمه المرور ؟",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'myfont1',
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Buttonoflogin(
                        text: 'تسجيل الدخول',
                        onPressed: () {
                          contlloer.login();
                        },
                      ),
                      
                    ]),
                  ),
                ),
        ));
  }
}
