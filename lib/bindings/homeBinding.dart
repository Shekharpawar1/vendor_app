import 'package:get/get.dart';
import '../features/home/controller/homeController.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<Homecontroller>(()=>Homecontroller());
  }

}