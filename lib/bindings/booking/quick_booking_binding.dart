import 'package:fun_n_food_vendor/controller/booking/quick_booking_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class QuickBookingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<QuickBookingController>(()=>QuickBookingController());
    // TODO: implement dependencies
  }

}