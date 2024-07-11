import 'package:fun_n_food_vendor/controller/rating/review_list_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class Reviewlistbinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReviewListController>(()=>ReviewListController());
    // TODO: implement dependencies
  }

}