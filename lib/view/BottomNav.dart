import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/view/quickViewScreen.dart';
import 'package:fun_n_food_vendor/view/setting.dart';
import 'package:fun_n_food_vendor/view/stay_view.dart';
import 'package:get/get.dart';

import '../controller/bottomController.dart';
import 'homeWidget/home.dart';
import 'notification.dart'; // Assuming you're using GetX for state management

class MainPage extends GetView<BottomNavController> {

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Obx(() {

        switch (controller.selectedIndex.value) {
          case 0:
            return HomeScreen();
          case 1:
            return RoomAvailabilityScreen();
          case 2:
            return NotificationScreen();
          case 3:
            return SettingScreen();
          case 4: // Corrected index for Quickviewscreen
            return Quickviewscreen();
          default:
            return HomeScreen(); // Default case adjusted
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.selectedIndex.value = 4; // Adjusted index for Quickviewscreen
        },
        child: Icon(Icons.visibility_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home_outlined),
              onPressed: () {
                controller.selectedIndex.value = 0;
              },
            ),
            IconButton(
              icon: Icon(Icons.calendar_today_outlined),
              onPressed: () {
                controller.selectedIndex.value = 1;
              },
            ),
            SizedBox(width: 40), // Adjusted spacing
            IconButton(
              icon: Icon(Icons.notifications_outlined),
              onPressed: () {
                controller.selectedIndex.value = 2;
              },
            ),
            IconButton(
              icon: Icon(Icons.person_outlined),
              onPressed: () {
                controller.selectedIndex.value = 3;
              },
            ),
          ],
        ),
      ),
    );
  }
}
