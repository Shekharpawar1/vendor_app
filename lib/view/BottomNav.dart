import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/view/profile.dart';
import 'package:fun_n_food_vendor/view/setting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/bottomController.dart';
import 'home.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BottomNavController bottomNavController = Get.put(BottomNavController());
    return Scaffold(
      body: Obx(() {
        switch (bottomNavController.selectedIndex.value) {
          case 0:
            return HomeScreen();
          case 1:
            return ProfileScreen();
          case 2:
            return SettingScreen();
          case 3:
            return SettingScreen();
          default:
            return HomeScreen();
        }
      }),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: CupertinoDynamicColor.withBrightness(color: Colors.white, darkColor: Colors.black12),
        onPressed: () {
          bottomNavController.selectedIndex.value = 5;
          // Handle button press
        },
        child: Icon(
          Icons.visibility_outlined,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: Obx(()=>
      //   BottomAppBar(
      //       shape: CircularNotchedRectangle(),
      //       notchMargin: 8.0,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: <Widget>[
      //           IconButton(
      //             icon: Icon(Icons.home_outlined,size: 30,),
      //             onPressed: () {
      //               bottomNavController.selectedIndex.value = 0;
      //             },
      //           ),
      //           IconButton(
      //             icon: Icon(Icons.calendar_today_outlined,size: 23,),
      //             onPressed: () {
      //               bottomNavController.selectedIndex.value = 1;
      //             },
      //           ),
      //           SizedBox(width: 40), // The dummy child for the notch
      //           IconButton(
      //             icon: Icon(Icons.notifications_outlined,size: 30,),
      //             onPressed: () {
      //               bottomNavController.selectedIndex.value = 2;
      //             },
      //           ),
      //           IconButton(
      //             icon: Icon(Icons.person_outlined,size:30,),
      //             onPressed: () {
      //               bottomNavController.selectedIndex.value = 3;
      //             },
      //           ),
      //         ],
      //       ))))
    );
  }
}