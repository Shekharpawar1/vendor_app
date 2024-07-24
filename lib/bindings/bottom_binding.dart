import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../controller/ProfileController.dart';
import '../features/home/controller/bottomController.dart';
import '../controller/settingController.dart';
import '../features/home/controller/homeController.dart';

class BottomNavBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(Homecontroller());
    Get.put(Profilecontroller());
    Get.put(Settingcontroller());
  }
}