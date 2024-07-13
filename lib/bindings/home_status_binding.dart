import 'package:get/get.dart';

import '../controller/home_Status_controller.dart';

class HomeStatusBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HouseStatusController>(()=>HouseStatusController());
    // TODO: implement dependencies
  }

}