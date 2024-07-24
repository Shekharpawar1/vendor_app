import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/CommonWidgets/view/appbarwidget.dart';
import 'package:fun_n_food_vendor/controller/rating/rating_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../CommonWidgets/view/ProgressbarWidget.dart';
import '../../main.dart';
import '../../utils/helper/styles.dart';

class RatingScreen extends GetView<RatingController> {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(()=> CustomScrollView(
                slivers: [
          CommonSliverAppBar(
              language.lblRatingTitle,
              Icons.refresh,
              null,
              // Icons.linear_scale,
              () {},
              () {},

              true,
              () => Get.back()),
          spacer5,
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(language.lblRatingSubHeading, style: Text4),
              SizedBox(
                height: 2.h,
              ),
           Card(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProgressBarWidget(
                        value: controller.overRating.value,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text( controller.overRating.value.toString()),
                    ),
                  ],
                )),

            ]),
          )),
          spacer3,
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(language.lblRatingSubHeading2, style: Text4),
              SizedBox(
                height: 2.h,
              ),
              Container(
                alignment: Alignment.center,
                // Width: 100.w,
                // height: 40.h,
                // color: Colors.red,
                 decoration: boxDecoration1,
                padding: EdgeInsets.only(bottom: 30,top:0),
                child:
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              controller.DetailedRatingList.value[index].title,
                              overflow: TextOverflow.ellipsis, // Ensure text does not overflow
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            flex:5,
                            child: ProgressBarWidget(
                              value: controller.DetailedRatingList.value[index].rating,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            flex: 1,
                            child: Text(
                              controller.DetailedRatingList.value[index].percentage.toString(),
                              textAlign: TextAlign.right, // Align percentage text to the right
                            ),
                          ),
                        ],
                      )

                    );
                  },
                  itemCount: controller.DetailedRatingList.value.length,
                )


              ),
            ]),
          )),
                ],
              ),
        ));
  }
}

