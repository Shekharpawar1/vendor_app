import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../CommonWidgets/view/appbarwidget.dart';
import '../CommonWidgets/view/ProgressbarWidget.dart';
import '../CommonWidgets/view/commonSliverGrid.dart';
import 'Booking/controller/quick_view_controller.dart';
import '../utils/helper/styles.dart';

class Quickviewscreen extends StatelessWidget {
  final QuickViewController controller = Get.put(QuickViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          CommonGrid(controller: controller),
          _buildOccupancySection(),
          _buildReservationStatisticsSection(),
          _buildPaxSection(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return CommonSliverAppBar(
      "Quick View",
      Icons.refresh,
      null,
          () {controller.onInit();},
          () {},
      false,
          () => Get.back(),
    );
  }

  Widget _buildOccupancySection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Occupancy", style: Text4),
            SizedBox(height: 1.h),
            _buildOccupancyCard("4.24% Today", 4),
            SizedBox(height: 2.h),
            _buildOccupancyCard("4.24% Yesterday", 4),
          ],
        ),
      ),
    );
  }

  Widget _buildOccupancyCard(String label, int value) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.all(8.0),
      decoration: boxDecoration1,
      child: Column(
        children: [
          Text(label),
          SizedBox(height: 1.h),
          ProgressBarWidget(value: double.parse(value.toString())),
        ],
      ),
    );
  }

  Widget _buildReservationStatisticsSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reservation Statistics", style: Text4),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildReviewContainer("0", "Bookings"),
                _buildReviewContainer("0", "Cancelled"),
                _buildReviewContainer("0", "No Show"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewContainer(String count, String title) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: boxDecoration1,
        width: 30.w,
        height: 16.5.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(count, style: Text5),
              SizedBox(height: 2.h),
              Text(title, style: Text6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaxSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("PAX", style: Text4),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildReviewContainer2("0", "Adult"),
                _buildReviewContainer2("0", "Child"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewContainer2(String count, String title) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: boxDecoration1,
        width: 45.w,
        height: 16.5.h,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.people),
              SizedBox(width: 2.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(count, style: Text5),
                  SizedBox(height: 2.h),
                  Text(title, style: Text6),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
