import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../features/bookingList/view/bookingList.dart';
import '../features/home/view/BottomNav.dart';
import '../features/work_order_list.dart';

class Settingcontroller extends GetxController {
   // BottomNavController btmController=Get.find(BottomNavController());
  // BottomNavController _bottomNavController = Get.put(BottomNavController());

  @override
  void onInit() {
    // BottomNavController btmController=Get.put(BottomNavController());
    super.onInit();
    // Initialize logic here
  }

  List<PageList> pages = [
    PageList(
      name: 'Dashboard',
      icon: Icons.dashboard_outlined,
      onTap: () {

        Get.off(MainPage(index:0)); // Example usage of passing index to MainPage
      },
    ),
    PageList(
      name: 'Quick Booking',
      icon: Icons.add_circle_outline,
      onTap: () {
        Get.toNamed("/quickbooking");
      },
    ),
    PageList(
      name: 'Arrival List',
      icon: Icons.people_outlined,
      onTap: () {
        Get.to(BookingListScreen(title: "Arrival"));
      },
    ),
    PageList(
      name: 'Departure List',
      icon: Icons.exit_to_app,
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
      icon: Icons.home_outlined,
      onTap: () {
        Get.to(BookingListScreen(title: "In-House"));
      },
    ),
    PageList(
      name: 'Quick View',
      icon: Icons.visibility_outlined,
      onTap: () {
        Get.off(MainPage(index:4)); // Example usage of passing index to MainPage
      },
    ),
    PageList(
      name: 'Stay View',
      icon: Icons.calendar_today,
      onTap: () {
        Get.off(MainPage(index:1));// Example usage of passing index to MainPage
      },
    ),
    PageList(
      name: 'Manager Report',
      icon: Icons.file_copy_outlined,
      onTap: () {
        Get.toNamed("/ManagerReport");
        // Add your functionality
      },
    ),
    PageList(
      name: 'Notification',
      icon: Icons.notifications_none_outlined,
      onTap: () {
        Get.toNamed('/notification');
      },
    ),
    PageList(
      name: 'Maintenance Block List',
      icon: Icons.build_outlined,
      onTap: () {
        Get.toNamed("/MaintenenceBlockView");
        // Add your functionality
      },
    ),
    PageList(
      name: 'Work Order List',
      icon: Icons.work_outline,
      onTap: () {
        Get.to(WorkOrderList(title: "Work Order List"));
        // Add your functionality
      },
    ),
    PageList(
      name: 'House Status',
      icon: Icons.home_outlined,
      onTap: () {
        Get.toNamed("/homeStatus");
        // Add your functionality
      },
    ),
    PageList(
      name: 'Critique Dashboard',
      icon: Icons.feedback_outlined,
      onTap: () {
        Get.toNamed("/CritiqueDashboard");
      },
    ),
    PageList(
      name: 'Critque Rating List',
      icon: Icons.rate_review_outlined,
      onTap: () {
        Get.toNamed("/reviewList");
      },
    ),
    PageList(
      name: 'Critique Ratings',
      icon: Icons.star_border_outlined,
      onTap: () {
        Get.toNamed("/ratingScreen");
      },
    ),
    PageList(
      name: 'Logout',
      icon: Icons.logout,
      onTap: () {
       GetStorage().erase();
        Get.offAllNamed("/login");
      },
    ),
  ];


  void onClose(){
    super.onClose();
  }
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
