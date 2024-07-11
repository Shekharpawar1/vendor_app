import 'package:fun_n_food_vendor/controller/rating/rating_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class RatingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RatingController>(()=>RatingController());
    // TODO: implement dependencies
  }

}