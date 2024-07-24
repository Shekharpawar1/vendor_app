import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../CommonWidgets/view/commonBtn.dart';
import '../../../CommonWidgets/view/commonTextFormField.dart';
import '../../../main.dart';
import '../../../utils/helper/colors.dart';
import '../../../utils/helper/images.dart';
import '../controller/login_controller.dart';

class Loginscreen extends GetView<LoginController> {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ResponsiveSizer(builder: (context, screenType, orientation) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 75),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(app_logo),
                  SizedBox(
                    height: 5.h,
                  ),
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
                                  controller: controller.UsernameController,
                                  title: language.lblFormHint1,
                                  type: TextInputType.text,
                                  suffix: null, obscureText: false,
                                  validation: (value) {
                                    if (value.isEmpty) {
                                      return "please enter username";
                                    }
                                      return null;

                                  },
                                  // Add validation and controller as needed
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Obx(() => CommonFormField(
                                      title: language.lblFormHint2,
                                      obscureText: controller.isVisible.value,
                                      suffix: controller.isVisible.value
                                          ? IconButton(
                                              onPressed: () => controller
                                                  .isPasswordVisible(),
                                              icon: Icon(Icons.visibility_off),
                                            )
                                          : IconButton(
                                              onPressed: () => controller
                                                  .isPasswordVisible(),
                                              icon: Icon(Icons.visibility),
                                            ),
                                      type: TextInputType.text,
                                      controller: controller.PasswordController,
                                  // validation: (value) {
                                  //   if(value.isEmpty || value.length<6){
                                  //     return "please enter password";
                                  //   }
                                  //   else
                                  //   if (controller.passReg.hasMatch(value)) {
                                  //     return null;
                                  //   }
                                  //   else {
                                  //     return "Use 1 special character(!@#\$&*~),Cap letter and number";
                                  //   }
                                  // },
                                  // Add validation and controller as needed
                                )),
                                SizedBox(height: 4.h,),
                                CommonFormField(
                                  controller: controller.HotelCodeController,
                                  title: language.lblFormHint3,
                                  type: TextInputType.text,
                                  suffix: null,
                                  obscureText: false,
                                  validation: (value) {
                                    if (value.isEmpty || value.length < 6) {
                                      return "please enter hotel code ";
                                    }
                                   return null;

                                  },
                                    // Add validation and controller as needed
                                    ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CommonButton(
                                  title: language.lblLogin,
                                  onPressed: controller.formValidation,
                                  // onPressed:()=> Get.offAllNamed("/login"),
                                  color: primaryColor,
                                  width: 80.w,
                                  height: 6.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text(language.lblAds,
                        style: TextStyle(fontSize: 15.sp, color: Colors.black)),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
