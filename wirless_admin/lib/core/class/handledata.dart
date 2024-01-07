import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';

class Handledata extends StatelessWidget {
  final StatusRequest statusrequest;
  final Widget widget;
  const Handledata(
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset("assest/lootis/animation_lnt2zzqr.json",
                height: 220, width: 220))
        : statusrequest == StatusRequest.internetfalier
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Lottie.asset(
                          "assest/lootis/animation_loehp3l9.json",
                          height: 250,
                          width: 250)),
                ],
              )
            : statusrequest == StatusRequest.serverfalier
                ?  Center(
                        child: Lottie.asset(
                            "assest/lootis/animation_loeivsut.json",
                            height: 250,
                            width: 250))
                : statusrequest == StatusRequest.falier
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Lottie.asset(
                                "assest/lootis/animation_loeivsut.json",
                                height: 300,
                                width: 300)),

                                Text("لا يوجد هنا سوى الغبار " , style: TextStyle(fontSize: 25 , fontFamily: 'myfont1' , fontWeight: FontWeight.bold),)
                      ],
                    )
                    : widget;
  }
}
