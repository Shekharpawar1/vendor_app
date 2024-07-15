import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/controller/booking_list_controller.dart';
import 'package:fun_n_food_vendor/helper/colors.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../helper/styles.dart';

class BookingListScreen extends StatelessWidget {
  String title;
  BookingListScreen({super.key, required this.title});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final BookingListController controller = Get.put(BookingListController());
    return Scaffold(
        key: _scaffoldKey, // Assigning GlobalKey to Scaffold

        appBar: AppBar(
          title: Text(title, style: Text1),
          backgroundColor: primaryColor,
          leading: InkWell(
            onTap:()=>Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              iconColor: Colors.white,
              onSelected: (value) {
                switch (value) {
                  case 'refresh':
                  // Implement refresh functionality
                    break;
                  case 'sort':
                  // Implement sort functionality
                    break;
                  case 'filter':
                  // Implement filter functionality
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'refresh',
                  child: Text('Refresh'),
                ),
                PopupMenuItem(
                  value: 'sort',
                  child: Text('Sort'),
                ),
                PopupMenuItem(
                  value: 'filter',
                  child: Text('Filter'),
                ),
              ],
            ),
          ],
          bottom: (title == 'Arrival' || title == 'Departure')
              ? PreferredSize(
                  preferredSize: Size(30, 30),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BottomTextRow(),
                  ),
                )
              : PreferredSize(
                  preferredSize: Size(0, 0), child: SizedBox.shrink()),
        ),

        body: Container(
         height: 500,
          child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Container(
                  height: 30.h, width: 100.w, child: ReservationCard(controller:controller)),
              itemCount: 2),
        ));
  }
  showAlertBox(context, BookingListController controller) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 20.h,
            width: 100.w,// Adjust height as needed
          color: Colors.white,
          child:ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.titleIcons.length,
            itemBuilder: (context, index) {
              final item = controller.titleIcons[index];
              final iconData = controller.titleIcons
                  .firstWhere((element) => element['title'] == item['title'])['icon'];

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Icon(
                            iconData,
                            color: primaryColor,
                            size: 20,
                          ),
                        ),
                      SizedBox(width: 2.w,),
                      // Space between icon and title
                        Text(
                          '${item['title']}',
                          textScaleFactor: 1,
                          style: Text4,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey.withOpacity(0.5),
                    thickness: 0.5,
                  ),
                  SizedBox(height: 10),
                ],
              );
            },
          ),

        );
      },
    );
  }
}

class BottomTextRow extends StatefulWidget {
  @override
  _BottomTextRowState createState() => _BottomTextRowState();
}

class _BottomTextRowState extends State<BottomTextRow> {
  int _selectedIndex = 0; // -1 indicates no item is selected

  final TextStyle _textStyle = Text8; // Define your text style

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTextItem("Today", 0),
        _buildTextItem("Tomorrow", 1),
        _buildTextItem("This Week", 2),
      ],
    );
  }

  Widget _buildTextItem(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 4.0), // Adjust padding as needed
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:
                  _selectedIndex == index ? Colors.white : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        child: Text(text, style: Text8),
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {

  BookingListController controller;
  ReservationCard({super.key,required this.controller});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Added to align content properly
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Added to align content properly
                  children: [
                    Text('Mar 20', style: TextStyle(color: Colors.grey)),
                    Divider(height: 8.0), // Adjusted height for spacing
                    Text('Mar 21', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SizedBox(width: 16.0),

                Expanded( // Added to make sure the Column takes available space
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mr. Monoco', style: TextStyle(color: Colors.purple)),

                      Row(
                        children: [
                          Text('Res '),
                          Container(
                            color: Colors.orange,
                            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0), // Added vertical padding for height
                            child: Text('UC43D66891500', style: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(width: 8.0),
                          Text('Folio 538'),
                          Spacer(),
                          InkWell(onTap:()=>controller.showBottomSheet(context),child: Icon(Icons.more_vert)),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(Icons.hotel, size: 16.0),
                          SizedBox(width: 4.0),
                          Text('1 Night Stay'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.home, size: 16.0),
                          SizedBox(width: 4.0),
                          Text('DULEX NEW'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 16.0),
                          SizedBox(width: 4.0),
                          Text('Arriving at 12:00 PM'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0), // Added for spacing between sections
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$25,000', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 4.0),
                    Text('Email'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );


  }
}
