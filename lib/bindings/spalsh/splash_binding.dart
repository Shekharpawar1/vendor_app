import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../../features/splah/controller/splash_Controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<SplashController>(()=>SplashController());
  }
}