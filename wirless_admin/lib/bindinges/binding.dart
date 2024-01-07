import 'package:get/get.dart';
import 'package:wirless_delivery/core/class/crud.dart';

class Ininilbindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
