import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/controller/HomeController.dart';
import 'package:fun_n_food_vendor/routes/appRoutes.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../CommonWidgets/appbarbottom.dart';
import '../../CommonWidgets/appbarwidget.dart';
import '../../CommonWidgets/commonSliverGrid.dart';
import '../../CommonWidgets/customAppBar.dart';
import '../../helper/colors.dart';
import '../../helper/sliverhelper.dart';
import '../../helper/styles.dart';
import '../../main.dart';
import 'chipContainer.dart';
import 'countoccupancycard.dart';
import 'homefragement.dart';

class HomeScreen extends GetView<Homecontroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CommonSliverAppBar(
              language.lblDash,
              Icons.search,
              Icons.refresh,
                  () {},
                  () {},
              controller,
              false,
                  () => Get.back()),
          SliverPersistentHeader(
            pinned: false,
            delegate: SliverAppBarDelegate(
              minHeight: 10.h,
              maxHeight: 10.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                            0.1), // Lower opacity for a subtle shadow
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(2, 2), // Shadow position
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(
                            0.1), // Lower opacity for a subtle shadow
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(-2, -2), // Shadow position
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(
                            0.1), // Lower opacity for a subtle shadow
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(2, -2), // Shadow position
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(
                            0.1), // Lower opacity for a subtle shadow
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(-2, 2), // Shadow position
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Text("shekhar")
                      AppBarBottom(

                          title: language.lblBottomAppBar1,
                          content: '8',
                          content2: '10',
                          style: Text3),
                      const VerticalDivider(),
                      AppBarBottom(
                          title: language.lblBottomAppBar2,
                          content: '0',
                          content2: '1',
                          style: Text4),
                      const VerticalDivider(),
                      AppBarBottom(
                          title: language.lblBottomAppBar3,
                          content: '1',
                          style: Text5),
                      const VerticalDivider(),
                      AppBarBottom(
                          title: language.lblBottomAppBar4,
                          content: '0',
                          style: Text6),
                    ],
                  ),
                ),
              ),
            ),
          ),
          spacer2,
          CommonGrid(controller: controller),
          spacer2,
          spacer4,
          countContainer(controller),
          spacer4,
          inventoryContainer(),
        spacer4,
          // buildSliverToBoxAdapter(,false,'Counts','Occupancy'),
          CritiqueContainer(controller),
          spacer1,
          bookingCounterbyChannel(),
          spacer3,
        ],
      ),
    );
  }


}
