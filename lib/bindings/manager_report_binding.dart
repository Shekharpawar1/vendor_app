import 'package:fun_n_food_vendor/controller/manager_report_controller.dart';
import 'package:get/get.dart';

class ManagerReportBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ManagerReportController>(()=>ManagerReportController());
    // TODO: implement dependencies
  }

}