import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CommonButton extends StatelessWidget {
  String title;
  Color color;
  double? height;
  double? width;
  Function() onPressed;
  CommonButton({
    super.key, required this.title,
    required this.onPressed,
    required this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: ()=>onPressed(),
      color:color,
      height: height?? 20,
      minWidth:width?? 80,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        title,
        // language.lblBookNow,
        textScaleFactor: 1,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}