import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fun_n_food_vendor/helper/colors.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pie_chart/pie_chart.dart';
import '../CommonWidgets/appbarwidget.dart';
import '../controller/critiquedashboardcontroller.dart';
import '../helper/styles.dart';
import '../main.dart';

class CritiqueDashboard extends GetView<Critiquedashboardcontroller> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        CommonSliverAppBar(
            language.lblCritique,
            Icons.refresh,
            Icons.linear_scale,
            () {},
            () {},

            true,
            () => Get.back()),
        spacer3,
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex:1,
                  child: Column(children: [
                    InkWell(
                      onTap:()=>Get.toNamed("/ratingScreen"),
                      child:


                      buildContainer(60.w,null,"0","Total Reviews"),

                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(children: [
                      buildContainer(30.w,null,"0","Positive"),
                      SizedBox(
                        width: 2.w,
                      ),
                      buildContainer(30.w,null,"0","Negative"),
                    ])
                  ]),
                ),
                buildContainer(30.w,17.5.h,"0","Avg. Rating"),
              ]),
        )),
        spacer1,
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                language.lblCritiquesubtitle,
                style: Text4,
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildReviewContainer("0", language.lblrating1),
                    buildReviewContainer("0", language.lblrating3),
                    buildReviewContainer("0", language.lblrating2),
                  ]),
            ],
          ),
        )),
        spacer1,
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                language.lblCritiquesubtitle1,
                style: Text4,
              ),
              SizedBox(
                height: 3.h,
              ),
              PieChart(
                dataMap: {
                  'Pending': 70,
                  'In Progress': 10,
                  'Completed': 20,
                },
                ringStrokeWidth: 28,
                legendOptions: LegendOptions(
                    showLegends: false,
                    legendPosition: LegendPosition.left,
                    legendShape: BoxShape.circle),
                colorList: [
                  Color(0xFFE1BEE7),
                  Color(0xFFCE93D8),
                  Color(0xFFBA68C8),
                  Color(0xFFAB47BC),
                  Color(0xFF8E24AA),
                  Color(0xFF7B1FA2),
                  Color(0xFF6A1B9A),
                  Color(0xFF4A148C),
                ],
                chartType: ChartType.ring,
                animationDuration: Duration(milliseconds: 800),
                chartRadius: MediaQuery.of(context).size.width / 3.5,
              )
            ],
          ),
        )),
        spacer1,
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(language.lblCritiquesubtitle2, style: Text4),
            SizedBox(
              height: 3.h,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        )),
        spacer1,
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(language.lblCritiquesubtitle3, style: Text4),
            SizedBox(
              height: 1.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.pricingBreakdown.length,
              itemBuilder: (context, index) {
                final item = controller.pricingBreakdown[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item['title']}:',
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          item['price']!,
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontSize: 12,
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10,
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                    SizedBox(height: 10),
                  ],
                );
              },
            ),
          ]),
        ))
        // SliverToBoxAdapter(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(language.lblCritiquesubtitle, style: Text4),
        //       spacer2,
        //       Row(children: [
        //         Container(
        //             child: Center(
        //                 child: Column(children: [
        //           Text("0"),
        //           SizedBox(
        //             height: 1.h,
        //           ),
        //           Text(textAlign: TextAlign.center, "Negative \n Review"),
        //         ])))
        //       ])
        //     ],
        //   ),
        // )
      ],
    ));
  }

  InkWell buildContainer(width,height,count,title) {
    return InkWell(
      onTap:()=>Get.toNamed("/ratingScreen"),
      child: Container(
                      decoration: boxDecoration1,
                      width: width,
                      height:(height!=null)?height:8.h,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Text(count),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(title)
                        ]),
                      ),
                    ),
    );
  }

  InkWell buildReviewContainer(count, title) {
    return InkWell(
      onTap: () => Get.toNamed('/reviewList'),
      child: Container(
        decoration: boxDecoration1,
        width: 30.w,
        height: 16.5.h,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(count, style: Text5),
            SizedBox(
              height: 2.h,
            ),
            Text(
              title,
              style: Text6,
            )
          ]),
        ),
      ),
    );
  }
}
