import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bottomController.dart';
import '../helper/colors.dart';
import 'homeWidget/home.dart';
import 'notification.dart';
import 'quickViewScreen.dart';
import 'setting.dart';
import 'stay_view.dart';

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
          case 4:
            return Quickviewscreen();
          default:
            return HomeScreen();
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: bottomNav,
        onPressed: () {
          controller.selectedIndex.value = 4;
        },
        child: Obx(() => Icon(
          Icons.visibility_outlined,
          color: controller.selectedIndex.value == 4 ? Colors.blue : Colors.grey[700],
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: bottomNav,
        shadowColor: Colors.blue,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildIconButton(Icons.home_outlined, 0, controller),
            _buildIconButton(Icons.calendar_today_outlined, 1, controller),
            SizedBox(width: 40), // Adjusted spacing
            _buildIconButton(Icons.notifications_outlined, 2, controller),
            _buildIconButton(Icons.person_outlined, 3, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData iconData, int index, BottomNavController controller) {
    return InkWell(
      onTap: () {
        controller.selectedIndex.value = index;
      },
      child: Obx(()=>
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.transparent,
            boxShadow: [
              if (controller.selectedIndex.value == index)
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
            ],
          ),
          child: Icon(
            iconData,
            size: 24.0,
            color: controller.selectedIndex.value == index ? Colors.blue : Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
