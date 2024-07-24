import 'package:fun_n_food_vendor/features/booking_details/controller/commonappbar2controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class BookingDetailsbinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CommonAppBar2Controller>(()=>CommonAppBar2Controller());
  }

}