import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/controller/notificationController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../CommonWidgets/view/appbarwidget.dart';
import '../utils/helper/styles.dart';


class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller=Get.put(NotificationController());
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        CommonSliverAppBar(
            "Notification",

            Icons.refresh,
            Icons.delete,
            // Icons.linear_scale,
                () {},
                () {},

            true,
                () => Get.back()),
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
    ),
    );
  }
}

