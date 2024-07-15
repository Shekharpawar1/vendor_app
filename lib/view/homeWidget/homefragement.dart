import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../CommonWidgets/ProgressbarWidget.dart';
import '../../helper/styles.dart';
import '../../main.dart';
import 'chipContainer.dart';
import 'countoccupancycard.dart';

SliverToBoxAdapter bookingCounterbyChannel() {
  return SliverToBoxAdapter(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              language.lblBookingChannel,
              style: Text4,
            ),
            SizedBox(
              height: 1.h,
            ),
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
      ));
}
SliverToBoxAdapter CritiqueContainer(controller) {
  return SliverToBoxAdapter(
      child: InkWell(
        onTap:()=>Get.toNamed("/CritiqueDashboard"),
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
                            child: Text("Summary",
                                textAlign: TextAlign.left, style: Text4),
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
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
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
                                    ),
                              ),
                            ),
                            VerticalDivider(),
                            Container(
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
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
      ));
}
SliverToBoxAdapter inventoryContainer() {
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
      ));
}
SliverToBoxAdapter countContainer(controller) => buildSliverToBoxAdapter(true, 'Counts', 'Occupancy', controller.item);
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
          flex: 2, // Adjust flex value as needed
          child: ProgressBarWidget(value: .5,),
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

