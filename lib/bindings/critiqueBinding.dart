import 'package:fun_n_food_vendor/controller/critiquedashboardcontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class CritiqueBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<Critiquedashboardcontroller>(()=>Critiquedashboardcontroller());
    // TODO: implement dependencies
  }

}