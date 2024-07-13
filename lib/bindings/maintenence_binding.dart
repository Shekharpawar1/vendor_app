import 'package:fun_n_food_vendor/controller/maintainence_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class MaintenenceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MaintenenceBlockController>(()=>MaintenenceBlockController());
    // TODO: implement dependencies
  }

}