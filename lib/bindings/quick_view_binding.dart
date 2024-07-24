import 'package:fun_n_food_vendor/features/Booking/controller/quick_view_controller.dart';
import 'package:get/get.dart';

class QuickViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<QuickViewController>(()=>QuickViewController());
    // TODO: implement dependencies
  }

}