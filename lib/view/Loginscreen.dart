import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fun_n_food_vendor/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../CommonWidgets/commonBtn.dart';
import '../CommonWidgets/commonTextFormField.dart';
import '../helper/colors.dart';
import '../helper/images.dart';
import '../main.dart';
class Loginscreen extends GetView<LoginController> {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ResponsiveSizer(
        builder:(context,screenType,orientation){
           return Scaffold(
             body: SingleChildScrollView(
               physics: BouncingScrollPhysics(),
               child: Padding(
                 padding: const EdgeInsets.symmetric(vertical: 75),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Image.asset(app_logo),
                     SizedBox(height: 5.h,),
                     Center(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         // mainAxisAlignment: MainAxisAlignment.center,
                         children: [


                           Form(
                             key: controller.Formkey,
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 children: <Widget>[
                                   CommonFormField(
                                     controller:controller.UsernameController,
                                     title:language.lblFormHint1,
                                     type: TextInputType.text,
                                     suffix: null, obscureText: false,
                                     // Add validation and controller as needed
                                   ),
                                   SizedBox(height: 2.h,),
                                   Obx(() => CommonFormField(
                                     title:language.lblFormHint2,
                                     obscureText:controller.isVisible.value,
                                     suffix: controller.isVisible.value
                                         ? IconButton(
                                       onPressed:()=> controller.isPasswordVisible(),
                                       icon: Icon(Icons.visibility_off),
                                     )
                                         : IconButton(
                                       onPressed:()=> controller.isPasswordVisible(),
                                       icon: Icon(Icons.visibility),
                                     ), type: TextInputType.text, controller: controller.PasswordController,
                                     // Add validation and controller as needed
                                   )),
                                   SizedBox(height: 4.h,),
                                   CommonFormField(
                                     controller:controller.HotelCodeController,
                                     title:language.lblFormHint3,
                                     type: TextInputType.text,
                                     suffix: null, obscureText: false,
                                     // Add validation and controller as needed
                                   ),
                                   SizedBox(height: 10.h,),
                                   CommonButton(title:language.lblLogin,onPressed:
                                   controller.formValidation, color: primaryColor,
                                   ),
                                 ],
                               ),
                             ),
                           ),

                         ],
                       ),
                     ),
                     SizedBox(height: 5.h,),
                     Padding(
                       padding: EdgeInsets.only(bottom: 0),
                       child: Text(language.lblAds,style:TextStyle(fontSize: 15.sp,color: Colors.black)),
                     )
                   ],
                 ),
               ),
             ),

           );
        }

      ),
    );
  }
}




