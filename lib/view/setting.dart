import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/CommonWidgets/appbarwidget.dart';
import 'package:fun_n_food_vendor/controller/settingController.dart';
import 'package:fun_n_food_vendor/helper/images.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../helper/sliverhelper.dart';
import '../helper/styles.dart';

class SettingScreen extends GetView<Settingcontroller> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(slivers:[
        CommonSliverAppBar("Resort", null, null, (){}, (){},  false, (){}),
        SliverPersistentHeader(
          pinned: false,
          delegate: SliverAppBarDelegate(
            minHeight: 10.h,
            maxHeight: 10.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:boxDecoration1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text("shekhar")
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(child: Image.asset(app_logo)),
                    ),
                    SizedBox(width: 3.w,),
                    Text("Username",style:Text7),

                  ],
                ),
              ),
            ),
          ),
        ),
        spacer5,
        SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:

              SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  decoration: boxDecoration1,
                  padding: EdgeInsets.only(bottom: 30, top: 0),
                  child: ListView.builder(
                    physics:NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap:()=>controller.pages[index].onTap(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0), // Add padding if needed
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  controller.pages[index].icon,
                                ),
                              ),
                              // SizedBox(width: 8.0), // Adjust the width for spacing
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  controller.pages[index].name,
                                  overflow: TextOverflow.ellipsis, // Ensure text does not overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount:controller.pages.length,
                  ),
                ),
              )


            )),
      ])
    );
  }
}
