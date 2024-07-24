import 'package:get/get.dart';
import '../../../controller/ProfileController.dart';
import '../../../controller/settingController.dart';
import 'homeController.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  Homecontroller homecontroller = Get.put(Homecontroller());
  Settingcontroller settingcontroller = Get.put(Settingcontroller());
  Profilecontroller profilecontroller = Get.put(Profilecontroller());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  updateValue(value) {
    selectedIndex.value = value;
    changePage(value);
  }

  void changePage(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        homecontroller.onInit();
        break;
      case 1:
        settingcontroller.onInit();
        break;
      case 2:
        profilecontroller.onInit();
      default:
        homecontroller.onInit();
        break;
    }
    update();
    print("index $index");
  }
}
