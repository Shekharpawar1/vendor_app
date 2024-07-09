import 'package:get/get.dart';

class Homecontroller extends GetxController{
  RxString title=''.obs;
  void onInit(){
    super.onInit();
    getCalled();
  }


  getCalled(){
    title.value='shekhar';
    print("homeCalled");
    update();
  }
}