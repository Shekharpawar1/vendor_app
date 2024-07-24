// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import '../../main.dart';
// import '../../utils/helper/styles.dart';
// import 'gridcard.dart';
//
// class CommonGrid extends StatelessWidget {
//   final controller;
//
//   CommonGrid({
//     super.key,
//     required this.controller,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverGrid(
//       delegate: SliverChildBuilderDelegate(
//         (context, index) {
//             return buildGridItem(index);
//         },
//         childCount: 4,
//       ),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 12,
//         crossAxisSpacing: 15,
//         childAspectRatio: 1.0,
//       ),
//     );
//   }
//
//   Widget buildGridItem(int index) {
//     switch (index) {
//       case 0:
//         return buildItem(
//           title: language.HomeGridTitle1,
//           content: 'Rs. ${double.parse(controller.bookingData?['booking_month']['currentMonthBookingAmount'] ?? '0.00').toStringAsFixed(2)}',
//           subcontent: 'Rs. ${(controller.bookingData?['total_revenue']?.toStringAsFixed(2)??"0.00")}',
//           positionedText: '1700.00%',
//           style: Text6,
//         );
//       case 1:
//         return buildItem(
//           title: language.HomeGridTitle2,
//           content: 'Rs. ${double.parse(controller.bookingData?['booking_month']['currentMonthBookingAmount'] ?? '0.00').toStringAsFixed(2)}',
//           subcontent: 'Rs. ${(controller.bookingData?['daily_avg_rate']?.toStringAsFixed(2)??'0.00')}',
//           positionedText: '1700.00%',
//           style: Text5,
//         );
//       case 2:
//         return buildItem(
//           title: language.HomeGridTitle3,
//           content: '0 Days',
//           subcontent: '0 Days',
//           positionedText: '0%',
//           style: Text6,
//         );
//       case 3:
//         return buildItem(
//           title: language.HomeGridTitle4,
//           content: '0 Nights',
//           subcontent: '1 Nights',
//           positionedText: '1.00%',
//           style: Text5,
//         );
//       default:
//         return SizedBox.shrink();
//     }
//   }
//
//   Widget buildItem({
//     required String title,
//     required String content,
//     required String subcontent,
//     required String positionedText,
//     required TextStyle style,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Stack(
//         children: [
//           // Card with expanded width
//           buildCard(
//             title,
//             content,
//             subcontent,
//             style,
//           ),
//           // Positioned element with adjusted position
//           Positioned(
//             top: 0.0, // Add some vertical spacing
//             right: 0.0, // Add some horizontal spacing
//             child: Container(
//               height: 3.h,
//               width: 19.w,
//               padding: EdgeInsets.all(4.0),
//               decoration: BoxDecoration(
//                 color: Colors.deepOrange.withOpacity(.5),
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//               ),
//               child: Center(
//                 child: Text(
//                   positionedText,
//                   style:
//                       TextStyle(fontSize: 14.0), // Adjust font size as needed
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            // Shimmer effect on text content
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
    switch (index) {
      case 0:
        return buildItem(
          title: language.HomeGridTitle1,
          content: 'Rs. ${double.parse(controller.bookingData?['booking_month']['currentMonthBookingAmount'] ?? '0.00').toStringAsFixed(2)}',
          subcontent: 'Rs. ${(controller.bookingData?['total_revenue']?.toStringAsFixed(2)??"0.00")}',
          positionedText: '1700.00%',
          style: Text6,
        );
      case 1:
        return buildItem(
          title: language.HomeGridTitle2,
          content: 'Rs. ${double.parse(controller.bookingData?['booking_month']['currentMonthBookingAmount'] ?? '0.00').toStringAsFixed(2)}',
          subcontent: 'Rs. ${(controller.bookingData?['daily_avg_rate']?.toStringAsFixed(2)??'0.00')}',
          positionedText: '1700.00%',
          style: Text5,
        );
      case 2:
        return buildItem(
          title: language.HomeGridTitle3,
          content: '0 Days',
          subcontent: '0 Days',
          positionedText: '0%',
          style: Text6,
        );
      case 3:
        return buildItem(
          title: language.HomeGridTitle4,
          content: '0 Nights',
          subcontent: '1 Nights',
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
          // Card with expanded width
          buildCard(
            title,
            content,
            subcontent,
            style,
          ),
          // Positioned element with adjusted position
          Positioned(
            top: 0.0, // Add some vertical spacing
            right: 0.0, // Add some horizontal spacing
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
                  style:
                  TextStyle(fontSize: 14.0), // Adjust font size as needed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
