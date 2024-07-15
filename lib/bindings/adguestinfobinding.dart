import 'package:fun_n_food_vendor/controller/add_guest_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class Adguestinfobinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddGuestController>(()=>AddGuestController());
    // TODO: implement dependencies
  }

}