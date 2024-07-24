import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../features/edit_guest_info/controller/editGuestController.dart';

class Editguestbinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<EditGuestController>(()=>EditGuestController());
  }
}