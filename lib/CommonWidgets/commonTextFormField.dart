import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonFormField extends StatelessWidget {
  Widget? suffix;
  String title;bool obscureText;
  TextInputType type;
  TextEditingController controller;
  CommonFormField({
    super.key,
    required this.title,
    required this.type,
    required this.suffix, required this.obscureText, required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: type,
        decoration: InputDecoration(border: UnderlineInputBorder(),labelText: title,suffix: suffix,),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $title';
          }
          return null;
        },
      ),
    );
  }
}