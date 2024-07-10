import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import 'package:score_progress_pretty_display/score_progress_pretty_display.dart';
import '../../helper/styles.dart';
import '../../main.dart';

SliverToBoxAdapter buildSliverToBoxAdapter( bool isProgress,title,title1,list) {
   return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100.w,
        height: 30.h,
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Lower opacity for a subtle shadow
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(2, 2), // Shadow position
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Lower opacity for a subtle shadow
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(-2, -2), // Shadow position
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Lower opacity for a subtle shadow
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(2, -2), // Shadow position
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Lower opacity for a subtle shadow
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(-2, 2), // Shadow position
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment:Alignment.topLeft,
                  child: Text(
                      title,textAlign:TextAlign.left,
                    style: Text4),
                ),
                Text(
                    title1,
                    style: Text4),
              ],
            ),
         
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:list.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  child: Text(list[index].count.toString()),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [

                          (isProgress)?  PrimaryArcAnimationComponent(
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
                            scoreTextAnimationDuration: Duration(milliseconds: 500),
                            // scoreTextStyle: TextStyle(
                            //   fontFamily: 'Urbanist-Regular',
                            //   fontWeight: FontWeight.w900,
                            //   fontSize: 55,
                            //   color: Color(0xFF4FB447),
                            // ),
                            arcBackgroundColor: Colors.black12,
                            arcProgressGradientColors: [
                              Color(0xFFF82735),
                              Color(0xFFFB8C00),
                              Color(0xFFFCC300),
                              Color(0xFF229D57),
                            ],
                          ):Text("shekhar"),
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
