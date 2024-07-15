import 'package:fun_n_food_vendor/controller/add_guest_controller.dart';
import 'package:fun_n_food_vendor/controller/editGuestController.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class Editguestbinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditGuestController>(()=>EditGuestController());
    // TODO: implement dependencies
  }

}