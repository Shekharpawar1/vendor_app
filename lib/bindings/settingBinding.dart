
import 'package:get/get.dart';

import '../controller/settingController.dart';

class SettingBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<Settingcontroller>(()=>Settingcontroller());
  }

}