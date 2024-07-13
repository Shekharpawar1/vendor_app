import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/controller/bottomController.dart';
import 'package:fun_n_food_vendor/view/BookingList/bookingList.dart';
import 'package:get/get.dart';

import '../view/BottomNav.dart';
import '../view/work_order_list.dart';

class Settingcontroller extends GetxController {

  @override
  void onInit() {
    super.onInit();
    // Initialize logic here
  }

  List<PageList> pages = [
    PageList(
      name: 'Dashboard',
      icon: Icons.house,
      onTap: () {
        Get.find<BottomNavController>().selectedIndex.value = 0;
        Get.off(MainPage()); // Example usage of passing index to MainPage
      },
    ),
    PageList(
      name: 'Quick Booking',
      icon: Icons.add,
      onTap: () {
        Get.toNamed("/quickbooking");
      },
    ),
    PageList(
      name: 'Arrival List',
      icon: Icons.house,
      onTap: () {
        Get.to(BookingListScreen(title: "Arrival"));
      },
    ),
    PageList(
      name: 'Departure List',
      icon: Icons.house,
      onTap: () {
        Get.to(BookingListScreen(title: "Departure"));
      },
    ),
    PageList(
      name: 'Reservation List',
      icon: Icons.calendar_today_outlined,
      onTap: () {
        Get.to(BookingListScreen(title: "Reservation"));
      },
    ),
    PageList(
      name: 'In-House',
      icon: Icons.house,
      onTap: () {
        Get.to(BookingListScreen(title: "In-House"));
      },
    ),
    PageList(
      name: 'Quick View',
      icon: Icons.visibility,
      onTap: () {

        Get.find<BottomNavController>().selectedIndex.value = 4;
        Get.off(MainPage()); // Example usage of passing index to MainPage
      },
    ),
    PageList(
      name: 'Stay View',
      icon: Icons.calendar_today,
      onTap: () {
        Get.find<BottomNavController>().selectedIndex.value = 1;
        Get.off(MainPage());  // Example usage of passing index to MainPage
      },
    ),
    PageList(
      name: 'Manager Report',
      icon: Icons.file_copy_sharp,
      onTap: () {
        Get.toNamed("/ManagerReport");
        // Add your functionality
      },
    ),
    PageList(
      name: 'Notification',
      icon: Icons.notifications,
      onTap: () {
        Get.toNamed('/notification');
      },
    ),
    PageList(
      name: 'Maintenance Block List',
      icon: Icons.front_hand_sharp,
      onTap: () {
        Get.toNamed("/MaintenenceBlockView");
        // Add your functionality
      },
    ),
    PageList(
      name: 'Work Order List',
      icon: Icons.house,
      onTap: () {
       Get.to(WorkOrderList(title:"Work Order List"));
        // Add your functionality
      },
    ),
    PageList(
      name: 'House Status',
      icon: Icons.house,
      onTap: () {
        Get.toNamed("/homeStatus");
        // Add your functionality
      },
    ),
    PageList(
      name: 'Critique Dashboard',
      icon: Icons.padding,
      onTap: () {
        Get.toNamed("/CritiqueDashboard");
      },
    ),
    PageList(
      name: 'Critque Rating List',
      icon: Icons.visibility,
      onTap: () {
        Get.toNamed("/reviewList");
      },
    ),
    PageList(
      name: 'Critique Ratings',
      icon: Icons.star,
      onTap: () {
        Get.toNamed("/ratingScreen");
      },
    ),
    // PageList(
    //   name: 'Critique Competitor Analysis',
    //   icon: Icons.line_axis,
    //   onTap: () {
    //     // Add your functionality
    //   },
    // ),
    PageList(
      name: 'Logout',
      icon: Icons.logout,
      onTap: () {
        Get.offAllNamed("/login");
      },
    ),
  ];
}

class PageList {
  String name;
  IconData icon;
  Function() onTap;

  PageList({
    required this.name,
    required this.icon,
    required this.onTap,
  });
}
