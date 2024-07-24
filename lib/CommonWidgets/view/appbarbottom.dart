import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../features/bookingList/view/bookingList.dart';
import '../../utils/helper/styles.dart';

class AppBarBottom extends StatelessWidget {
  String title;
  String content;
  String? content2;

  TextStyle style;
  AppBarBottom({
    super.key,required this.title,required this.content,required this.style,this.content2,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>Get.to(BookingListScreen(title:title)),
      child: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(title,style: Text2,),
           SizedBox(height: 1.h,),
           Row(
             children: [
               Text(content,style: style,),
               (content2!=null)?Text("/"):SizedBox.shrink(),
               (content2!=null)?  Text(content2.toString()):SizedBox.shrink(),
             ],
           ),
         ],
       ),
      ),
    );
  }
}