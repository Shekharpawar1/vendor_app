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
            controller,
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
                Column(children: [
                  Container(
                    decoration: boxDecoration1,
                    width: 60.w,
                    child: Center(
                      child: Column(children: [
                        Text("0"),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text("shekhar")
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(children: [
                    Container(
                      decoration: boxDecoration1,
                      width: 30.w,
                      child: Center(
                        child: Column(children: [
                          Text("0"),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text("shekhar")
                        ]),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Container(
                      decoration: boxDecoration1,
                      width: 30.w,
                      child: Center(
                        child: Column(children: [
                          Text("0"),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text("shekhar")
                        ]),
                      ),
                    ),
                  ])
                ]),
                Container(
                  decoration: boxDecoration1,
                  width: 30.w,
                  height: 16.5.h,
                  child: Center(
                    child: Column(children: [
                      Text("0"),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text("shekhar")
                    ]),
                  ),
                ),
              ]),
        )),
        spacer1,
        SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(language.lblCritiquesubtitle,style: Text4,),
                  SizedBox(height: 2.h,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration:boxDecoration1,

                          width: 30.w, height: 16.5.h,
                          child: Center(
                            child: Column(mainAxisAlignment:MainAxisAlignment.center,children: [
                              Text("0",style:Text5),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(language.lblrating1,style: Text6,)
                            ]),
                          ),
                        ),
                        Container(
                          decoration:boxDecoration1,
                          width: 30.w,
                          height: 16.5.h,
                          child: Center(
                            child: Column(mainAxisAlignment:MainAxisAlignment.center,children: [
                              Text("0",style:Text5),   SizedBox(
                                height: 2.h,
                              ),
                              Text(language.lblrating3,style: Text5 ,)
                            ]),
                          ),
                        ),
                        Container(
                          decoration:boxDecoration1,
                          width: 30.w,
                          height: 16.5.h,
                          child: Center(
                            child: Column(mainAxisAlignment:MainAxisAlignment.center,children: [
                              Text("0",style:Text5),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(language.lblrating2,style: Text6,)
                            ]),
                          ),
                        ),
                      ]),
                ],
              ),
            )),
        spacer1,
        SliverToBoxAdapter(child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(language.lblCritiquesubtitle1,style: Text4,),
              SizedBox(height: 3.h,),
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
                    legendShape:BoxShape.circle
                ),
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
        SliverToBoxAdapter(child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(language.lblCritiquesubtitle2,style:Text4),
              SizedBox(height: 3.h,),
              InkWell(
                onTap:()=>Get.toNamed("/CritiqueDashboard"),
                child: Container(
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
                              // Expanded(
                              //   child: Row(
                              //     children: [
                              //       Expanded(
                              //         child: ListView.builder(
                              //           physics: NeverScrollableScrollPhysics(),
                              //           itemCount: controller.item2.length,
                              //           shrinkWrap: true,
                              //           itemBuilder:
                              //               (BuildContext context, int index) =>
                              //               Padding(
                              //                 padding: const EdgeInsets.symmetric(
                              //                     vertical: 4.0),
                              //                 child: Padding(
                              //                   padding: const EdgeInsets.only(left: 8.0),
                              //                   child: Row(
                              //                     mainAxisAlignment:
                              //                     MainAxisAlignment.spaceBetween,
                              //                     children: [
                              //                       Flexible(
                              //                         child: Text(
                              //                           controller.item2[index].title,
                              //                           textAlign: TextAlign.left,
                              //                           overflow: TextOverflow.ellipsis,
                              //                         ),
                              //                       ),
                              //                       SizedBox(width: 12.0),
                              //                       Container(
                              //                         decoration: BoxDecoration(
                              //                           borderRadius:
                              //                           BorderRadius.circular(100),
                              //                           color:
                              //                           Colors.blue.withOpacity(0.5),
                              //                         ),
                              //                         child: Padding(
                              //                           padding:
                              //                           const EdgeInsets.all(8.0),
                              //                           child: Text(controller
                              //                               .item2[index].count
                              //                               .toString()),
                              //                         ),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ),
                              //               ),
                              //         ),
                              //       ),
                              //       VerticalDivider(),
                              //       Container(
                              //         child: Expanded(
                              //           child: Column(
                              //             crossAxisAlignment:
                              //             CrossAxisAlignment.center,
                              //             mainAxisAlignment: MainAxisAlignment.center,
                              //             children: [
                              //               Text(
                              //                 "555.0",
                              //                 style: Text4,
                              //               ),
                              //               SizedBox(height: 8.0),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ]
          ),
        )),
        spacer1,
        SliverToBoxAdapter(child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children:[Text(language.lblCritiquesubtitle3,style:Text4),SizedBox(height: 1.h,),
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
                            color:Colors.black45,
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
            ),]),
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
}
