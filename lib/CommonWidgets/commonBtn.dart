import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonButton extends StatelessWidget {
  String title;
  Color color;
  Function() onPressed;
   CommonButton({
    super.key, required this.title,
    required this.onPressed,
     required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: ()=>onPressed(),
      color:color,
      height: 15.w,
      minWidth: 80.w,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        // language.lblBookNow,
        textScaleFactor: 1,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}