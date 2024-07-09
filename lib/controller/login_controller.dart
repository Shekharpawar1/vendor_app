import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
   TextEditingController UsernameController=TextEditingController();
   TextEditingController PasswordController=TextEditingController();
   TextEditingController HotelCodeController=TextEditingController();
  final Formkey=GlobalKey<FormState>();
  RxBool isVisible=false.obs;

   isPasswordVisible(){
     print("function called");
    isVisible.toggle();
    update();
  }


  formValidation(){
    bool resp=true;
     if (Formkey.currentState!.validate()) {
      // Valid form, handle submission
      resp=validator();
      print("response $resp");
      if(resp==false){
        return resp;
      }
      else{
        Get.offAllNamed("/home");
      }

    }
    else{
      return false;
    }



  }

   validator(){
     if(PasswordController.text.length<6){
       return false;
     }
     else{
       return true;
     }

   }





}