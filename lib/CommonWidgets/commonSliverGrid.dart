import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/controller/HomeController.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../helper/helper.dart';
import '../helper/styles.dart';
import '../main.dart';
import 'gridcard.dart';

class CommonGrid extends StatelessWidget {
   CommonGrid({
    super.key, required Homecontroller controller,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                // Card with expanded width
               buildCard(GridItem[index].title,GridItem[index].content,GridItem[index].subcontent,GridItem[index].style),
                // Positioned element with adjusted position
                Positioned(
                  top: 0.0, // Add some vertical spacing
                  right: 0.0, // Add some horizontal spacing
                  child: Container(
                    height: 3.h,
                    width: 19.w,
                    padding:EdgeInsets.all(4.0),
                    decoration: BoxDecoration(color:Colors.deepOrange.withOpacity(.5),borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text(
                        GridItem[index].positionedText,
                        style: TextStyle(
                            fontSize: 14.0), // Adjust font size as needed
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
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
   List GridItem=[
     GridItemList(title: language.HomeGridTitle1, content: 'Rs. 0.00', subcontent: 'Rs. 1,700.00',positionedText:"1700.00%",style:Text6),
     GridItemList(title:  language.HomeGridTitle2, content: 'Rs. 0', subcontent: 'Rs. 1,700.00',positionedText:"1700.00%", style:Text5),
     GridItemList(title:  language.HomeGridTitle3, content: '0 Days', subcontent: '0 Days',positionedText:'0%', style: Text6),
     GridItemList(title:  language.HomeGridTitle4, content: '0 Nights', subcontent: '1 Nights',positionedText:'1.00%', style: Text5),

   ];

}




class GridItemList{
  String title;
  String content;
  String subcontent;
  String positionedText;
  TextStyle style;

  GridItemList({
    required this.title,
    required this.content,
    required this.subcontent,
    required this.positionedText,
    required this.style
  });
}