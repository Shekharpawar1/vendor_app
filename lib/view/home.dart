import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/controller/HomeController.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../CommonWidgets/customAppBar.dart';
import '../helper/colors.dart';
import '../helper/sliverhelper.dart';
import '../helper/styles.dart';
import '../main.dart';


class HomeScreen extends GetView<Homecontroller> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            toolbarHeight: 10.h,
            backgroundColor: primaryColor,
            title: Text(language.lblDash, style: Text1),
            actions: [
              IconButton(
                onPressed: () => controller.onInit(),
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () => controller.onInit(),
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              )
            ],
            expandedHeight: 10.h, // Adjust the expanded height as needed
            // floating: true,
            pinned: true,
          ),
          SliverPersistentHeader(
            pinned: false,
            delegate: SliverAppBarDelegate(
              minHeight: 10.h,
              maxHeight: 18.h,
              child: Container(
                color: primaryColor,
                child: Center(
                  child: Text("shekh"),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                title: Text('Item #$index'),
              ),
              childCount: 50, // Adjust the number of items as needed
            ),
          ),
        ],
      ),
    );
  }
}

