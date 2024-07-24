
import 'package:fun_n_food_vendor/features/home/controller/bottomController.dart';
import 'package:get/get.dart';

import '../controller/settingController.dart';

class SettingBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(Settingcontroller());

   Get.put(BottomNavController());
  }

}