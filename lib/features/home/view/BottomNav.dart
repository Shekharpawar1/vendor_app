import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/features/home/view/home.dart';
import 'package:get/get.dart';
import '../controller/bottomController.dart';
import '../../../utils/helper/colors.dart';
import '../../notification.dart';
import '../../quickViewScreen.dart';
import '../../setting.dart';
import '../../calender/view/room_availability_calender_screen.dart';

class MainPage extends StatefulWidget {
  int? index;
  MainPage({Key? key, this.index}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    controller.selectedIndex.value = widget.index ?? 0;
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
              color: controller.selectedIndex.value == 4
                  ? Colors.blue
                  : Colors.grey[700],
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

  Widget _buildIconButton(
      IconData iconData, int index, BottomNavController controller) {
    return InkWell(
      onTap: () {
        controller.selectedIndex.value = index;
      },
      child: Obx(
        () => Container(
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
            color: controller.selectedIndex.value == index
                ? Colors.blue
                : Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
