import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/work_order_controller.dart';

class WorkOrderListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WorkOrderController>(()=>WorkOrderController());
    // TODO: implement dependencies
  }

}