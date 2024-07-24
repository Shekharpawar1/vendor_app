import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/helper/colors.dart';
import '../../utils/helper/styles.dart';

SliverAppBar CommonSliverAppBar(title,icon1,icon2,onTap1,onTap2,isleading,onTap3) {
  return SliverAppBar(
    elevation: 0,
    automaticallyImplyLeading: isleading,
    toolbarHeight: 10.h,
    centerTitle: true,
    leading: (isleading)?InkWell(onTap:onTap3,child: Icon(Icons.arrow_back_ios_new,color:Colors.white)):SizedBox.shrink(),
    backgroundColor: primaryColor,
    title: Text(title, style: Text1),
    actions: [
      (icon1!=null)?
      IconButton(
        onPressed: () => onTap1,
        icon: Icon(
          icon1,
          color: Colors.white,
        ),
      ):SizedBox.shrink(),
      (icon2!=null)?
      IconButton(
        onPressed: () => onTap2,
        icon: Icon(
          icon2,
          color: Colors.white,
        ),
      ):SizedBox.shrink(),
    ],
    expandedHeight: 10.h, // Adjust the expanded height as needed
    // floating: true,
    pinned: true,
  );
}