import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'colors.dart';



//////text style
final TextStyle Text1=TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.w500,);
final TextStyle Text2=TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600,);
final TextStyle Text3=TextStyle(color: Colors.orange,fontSize: 18.sp,fontWeight: FontWeight.w600,);
final TextStyle Text4=TextStyle(color: primaryColor,fontSize: 18.sp,fontWeight: FontWeight.w600,);
final TextStyle Text5=TextStyle(color: Colors.cyan,fontSize: 18.sp,fontWeight: FontWeight.w600,);
final TextStyle Text6=TextStyle(color: Colors.green,fontSize: 18.sp,fontWeight: FontWeight.w600,);
final TextStyle Text7=TextStyle(color: Colors.grey,fontSize: 17.sp,fontWeight: FontWeight.w400,);
final TextStyle Text8=TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w500,);
final TextStyle Text9=TextStyle(color: primaryColor,fontSize: 16.sp,fontWeight: FontWeight.w600,);
final TextStyle Text10=TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400,);
final TextStyle Text11=TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400,);
final TextStyle Text12=TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400,);
final TextStyle Text13=TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400,);
final TextStyle Text14=TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400,);
final TextStyle Text15=TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w400,);
final TextStyle Text16=TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w400,);
////background decoration
final BoxDecoration boxDecoration1=BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1), // Lower opacity for a subtle shadow
      spreadRadius: 1,
      blurRadius: 5,
      offset: Offset(2, 2), // Shadow position
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.1), // Lower opacity for a subtle shadow
      spreadRadius: 1,
      blurRadius: 5,
      offset: Offset(-2, -2), // Shadow position
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.1), // Lower opacity for a subtle shadow
      spreadRadius: 1,
      blurRadius: 5,
      offset: Offset(2, -2), // Shadow position
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.1), // Lower opacity for a subtle shadow
      spreadRadius: 1,
      blurRadius: 5,
      offset: Offset(-2, 2), // Shadow position
    ),
  ],
  borderRadius: BorderRadius.circular(10),
  color: Colors.white,
);
final BoxDecoration boxDecoration2=BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1), // Lower opacity for a subtle shadow
      spreadRadius: 1,
      blurRadius: .5,
      offset: Offset(2, 2), // Shadow position
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.1), // Lower opacity for a subtle shadow
      spreadRadius: 1,
blurRadius: .5,
      offset: Offset(-2, -2), // Shadow position
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.1), // Lower opacity for a subtle shadow
      spreadRadius: 1,
blurRadius: .5,
      offset: Offset(2, -2), // Shadow position
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.1), // Lower opacity for a subtle shadow
      spreadRadius: 1,
blurRadius: .5,
      offset: Offset(-2, 2), // Shadow position
    ),
  ],
  // borderRadius: BorderRadius.circular(100),
  color: Colors.white,
);

/////spacer in sliver
final SliverToBoxAdapter spacer1= SliverToBoxAdapter(
  child: SizedBox(
  height: 6.h,
));
final SliverToBoxAdapter spacer2= SliverToBoxAdapter(
  child: SizedBox(
    height: 4.h,
  ),
);
final SliverToBoxAdapter spacer3= SliverToBoxAdapter(
  child: SizedBox(
    height: 2.h,
  ),
);

final SliverToBoxAdapter spacer4=SliverToBoxAdapter(
    child: SizedBox(
      height: 3.h,
    ));

final SliverToBoxAdapter spacer5= SliverToBoxAdapter(
  child: SizedBox(
    height: .1.h,
  ),
);