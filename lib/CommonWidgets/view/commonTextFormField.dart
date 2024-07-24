import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonFormField extends StatelessWidget {
  Widget? suffix;
  String title;bool obscureText;
  TextInputType type;
  TextEditingController controller;
  String?  Function(dynamic value)? validation;
  CommonFormField({
    super.key,
    required this.title,
    required this.type,
    required this.suffix,
    required this.obscureText,
    required this.controller,
    this.validation,
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
        validator: validation,
      ),
    );
  }
}