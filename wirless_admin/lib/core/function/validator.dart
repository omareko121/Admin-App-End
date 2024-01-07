import 'package:get/get.dart';

validator(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "الرجاء ادخال اسم صحيح";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "الرجاء ادخال بريد الكتروني صحيح";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "الرجاء ادخال رقم هاتف صحيح";
    }
  }


    if (val.isEmpty) {
    return "الرجاء ادخال جميع الحقول ب الشكل الصحيح";
  }

  if (val.length < min) {
    return "الرجاء ادخال عدد اكثر من الاحرف";
  }


  if (val.length > max) {
    return "الرجاء ادخال عدد اقل من الاحرف";
  }
}
