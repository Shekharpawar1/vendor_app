import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/CommonWidgets/view/custom_refersh_indicator.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:score_progress_pretty_display/score_progress_pretty_display.dart';

import '../../../CommonWidgets/view/ProgressbarWidget.dart';
import '../../../CommonWidgets/view/appbarbottom.dart';
import '../../../CommonWidgets/view/commonSliverGrid.dart';
import '../../../main.dart';
import '../../../utils/constant/sliverhelper.dart';
import '../../../utils/helper/colors.dart';
import '../../../utils/helper/styles.dart';
import '../controller/homeController.dart';

class HomeScreen extends GetView<Homecontroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomRefreshIndicator(
        onRefresh:  _refreshData,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              toolbarHeight: 10.h,
              centerTitle: true,
              backgroundColor: primaryColor,
              title: Text(language.lblDash, style: Text1),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(children: [
                    Obx(() => Text(
                        "${(controller.switchvalue.value == true) ? "Active" : "Inactive"}",
                        style: (controller.switchvalue.value == true)
                            ? Text6
                            : Text3)),
                    Obx(
                          () => Switch.adaptive(
                        value: controller.switchvalue.value,
                        onChanged: (value) {
                          controller.changeStatus(value);
                        },
                      ),
                    ),
                  ]),
                ),
              ],
              expandedHeight: 10.h,
              pinned: true,
            ),
            _buildAppBarBottomSection(),
            SliverToBoxAdapter(child: SizedBox(height: 8.0)),
            // controller.isLoading.value?
            // Center(
            //   child: CircularProgressIndicator(
            //     color: primaryColor,
            //   ),
            // )
            CommonGrid(controller: controller),
            SliverToBoxAdapter(child: SizedBox(height: 8.0)),
            SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            _buildCountContainer(),
            SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            _buildInventoryContainer(),
            SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            _buildCritiqueContainer(),
            SliverToBoxAdapter(child: SizedBox(height: 8.0)),
            _buildBookingCounterByChannel(),
            SliverToBoxAdapter(child: SizedBox(height: 24.0)),
          ],
        ),
      ),
    );
  }

  SliverPersistentHeader _buildAppBarBottomSection() {
    return SliverPersistentHeader(
      pinned: false,
      delegate: SliverAppBarDelegate(
        minHeight: 10.h,
        maxHeight: 10.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: _boxDecoration(),
            child: Obx(() {
              final widgetData = controller.bookingData['widget'] ?? {};
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppBarBottom(
                    title: language.lblBottomAppBar1,
                    content: (widgetData['pending_checkin'] ?? 0).toString(),
                    content2: (widgetData['today_booked'] ?? 0).toString(),
                    style: Text3,
                  ),
                  const VerticalDivider(),
                  AppBarBottom(
                    title: language.lblBottomAppBar2,
                    content: (widgetData['upcoming_checkout'] ?? 0).toString(),
                    content2: (widgetData['delayed_checkout'] ?? 0).toString(),
                    style: Text4,
                  ),
                  const VerticalDivider(),
                  AppBarBottom(
                    title: language.lblBottomAppBar3,
                    content: (widgetData['total'] ?? 0).toString(),
                    style: Text5,
                  ),
                  const VerticalDivider(),
                  AppBarBottom(
                    title: language.lblBottomAppBar4,
                    content: '0', // This value is already a string, so no conversion needed
                    style: Text6,
                  ),
                ],
              );
            }),
          ),

        ),
      ),
    );
  }

  Future<void> _refreshData() async {
    // Implement your refresh logic here, e.g., fetch new data from API
    await controller.fetchData();
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(2, 2),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(-2, -2),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(2, -2),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(-2, 2),
        ),
      ],
      color: Colors.white,
    );
  }

  SliverToBoxAdapter _buildCountContainer() {
    return buildSliverToBoxAdapter(
      true,
      'Counts',
      'Occupancy',
      controller.item,
    );
  }

  SliverToBoxAdapter _buildInventoryContainer() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  language.Hometitle1,
                  style: Text4,
                ),
              ),
              Container(
                decoration: boxDecoration1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRow(language.HomeTitle1content1, "200"),
                      SizedBox(height: 16.0),
                      _buildRow(language.HomeTitle1content2, "200"),
                      SizedBox(height: 16.0),
                      _buildRow(language.HomeTitle1content3, "200"),
                      SizedBox(height: 16.0),
                      _buildRow(language.HomeTitle1content4, "200"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildCritiqueContainer() {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: () => Get.toNamed("/CritiqueDashboard"),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    language.Hometitle2,
                    style: Text4,
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 30.h,
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  decoration: boxDecoration1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Summary",
                              textAlign: TextAlign.left,
                              style: Text4,
                            ),
                          ),
                          Text("Avg. Rating", style: Text4),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.item2.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              controller.item2[index].title,
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 12.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              color:
                                              Colors.blue.withOpacity(0.5),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Text(controller
                                                  .item2[index].count
                                                  .toString()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            VerticalDivider(),
                            Container(
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "555.0",
                                      style: Text4,
                                    ),
                                    SizedBox(height: 8.0),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.right,
                      language.Hometitle2subContent2,
                      style: Text7,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildBookingCounterByChannel() {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              language.lblBookingChannel,
              style: Text4,
            ),
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List<Widget>.generate(3, (int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildChip("Agoda", "4"),
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List<Widget>.generate(2, (int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildChip("Agoda", "4"),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: Text7,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            flex: 2,
            child: ProgressBarWidget(value: .5),
          ),
          Expanded(
            child: Text(
              value,
              style: Text4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Chip buildChip(String title, String count) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.transparent),
      ),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      label: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title),
                SizedBox(width: 8.0),
              ],
            ),
          ),
          Positioned(
            top: -26,
            right: -20,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: Text(
                count,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter buildSliverToBoxAdapter(
      bool isProgress,
      String title,
      String title1,
      List list,
      ) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100.w,
          height: 30.h,
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          decoration: _boxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: Text4,
                    ),
                  ),
                  Text(
                    title1,
                    style: Text4,
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      list[index].title,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: 12.0),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.blue.withOpacity(0.5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        list[index].count.toString(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    VerticalDivider(),
                    Container(
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isProgress)
                              PrimaryArcAnimationComponent(
                                score: 5,
                                maxScore: 100,
                                arcHeight: 140,
                                arcWidth: 140,
                                backgroundArcStrokeThickness: 5,
                                progressArcStrokeThickness: 4,
                                isRoundEdges: true,
                                minScoreTextFontSize: 30,
                                maxScoreTextFontSize: 50,
                                isRoundOffScoreWhileProgress: true,
                                showOutOfScoreFormat: false,
                                scoreAnimationDuration: Duration(seconds: 2),
                                scoreTextAnimationDuration:
                                Duration(milliseconds: 500),
                                arcBackgroundColor: Colors.black12,
                                arcProgressGradientColors: [
                                  Color(0xFFF82735),
                                  Color(0xFFFB8C00),
                                  Color(0xFFFCC300),
                                  Color(0xFF229D57),
                                ],
                              )
                            else
                              Text("shekhar"),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
