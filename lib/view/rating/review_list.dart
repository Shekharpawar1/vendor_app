import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/CommonWidgets/appbarwidget.dart';
import 'package:fun_n_food_vendor/controller/rating/review_list_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../helper/images.dart';
import '../../helper/styles.dart';
import '../../main.dart';

class ReviewListScreen extends GetView<ReviewListController> {
  const ReviewListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        CommonSliverAppBar(language.lblReviewTitle, Icons.refresh, null, ()=>controller.onInit(),
            () {}, controller, true, () => Get.back()),
        spacer5,
        SliverToBoxAdapter(
          child: Obx(
            () => (controller.ReviewList.isEmpty)
                ? Container(
                    child: Center(child: Text("no datafound", style: Text7)))
                : ListView.builder(
              physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var data = controller.ReviewList.value[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ClipOval(child: Image.asset(data.image)),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Flexible(
                                          child: Column(children: [
                                        Text(
                                          data.customerName,
                                          style: Text4,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          data.review,
                                          style: Text7,
                                        ),
                                        Text(
                                          "From ${data.partner}",
                                          style: Text7,
                                        )
                                      ])),
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: controller.ReviewList.length
              ,
                  ),
          ),
        ),
      ],
    ));
  }
}
