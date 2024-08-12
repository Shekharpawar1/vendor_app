import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import '../../main.dart';
import '../../utils/helper/styles.dart';
import 'gridcard.dart';

class CommonGrid extends StatelessWidget {
  final controller;

  CommonGrid({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return buildShimmerItem();
            },
            childCount: 4,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 15,
            childAspectRatio: 1.0,
          ),
        );
      } else {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return buildGridItem(index);
            },
            childCount: 4,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 15,
            childAspectRatio: 1.0,
          ),
        );
      }
    });
  }

  Widget buildShimmerItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 20.h,
              left: 10,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 30.w,
                  height: 3.h,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 30.h,
              left: 10,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 25.w,
                  height: 3.h,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridItem(int index) {
    final bookingData = controller.bookingData.value;
    if (bookingData == null) return SizedBox.shrink();

    final lastBookingMonth = bookingData.bookingMonth.isNotEmpty
        ? bookingData.bookingMonth.last.bookingAmount.toStringAsFixed(2)
        : "0.0";
    final todayRevenue = bookingData.totalRevenue?.toStringAsFixed(2) ?? "0.0";
    final dailyAvgRate = bookingData.dailyAvgRate?.toStringAsFixed(2) ?? "0.0";
    final avgLeadTime = bookingData.avgLeadTime?.toStringAsFixed(2) ?? "0.0";
    final lastAvgMonthlyLeadTime = bookingData.avgMonthlyLeadTime.isNotEmpty
        ? bookingData.avgMonthlyLeadTime.entries.last.value.toStringAsFixed(2)
        : "0.0";
    final avgLengthOfStay =
        bookingData.avgLengthOfStay?.toStringAsFixed(2) ?? "0.0";
    final lastAvgMonthlyLengthOfStay =
    bookingData.avgMonthlyLengthOfStay.isNotEmpty
        ? bookingData.avgMonthlyLengthOfStay.entries.last.value.toStringAsFixed(2)
        : "0.0";

    switch (index) {
      case 0:
        return buildItem(
          title: language.HomeGridTitle1,
          content: 'Rs. $lastBookingMonth',
          subcontent: 'Rs. $todayRevenue',
          positionedText: '1700.00%',
          style: Text6,
        );
      case 1:
        return buildItem(
          title: language.HomeGridTitle2,
          content: 'Rs. $dailyAvgRate',
          subcontent: 'Rs. $lastBookingMonth',
          positionedText: '1700.00%',
          style: Text5,
        );
      case 2:
        return buildItem(
          title: language.HomeGridTitle3,
          content: '$lastAvgMonthlyLeadTime Days',
          subcontent: '$avgLeadTime Days',
          positionedText: '0%',
          style: Text6,
        );
      case 3:
        return buildItem(
          title: language.HomeGridTitle4,
          content: '$lastAvgMonthlyLengthOfStay Nights',
          subcontent: '$avgLengthOfStay Nights',
          positionedText: '1.00%',
          style: Text5,
        );
      default:
        return SizedBox.shrink();
    }
  }

  Widget buildItem({
    required String title,
    required String content,
    required String subcontent,
    required String positionedText,
    required TextStyle style,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          buildCard(
           title: title, content: content, subcontent: subcontent,style: style
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Container(
              height: 3.h,
              width: 19.w,
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withOpacity(.5),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  positionedText,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
