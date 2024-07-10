import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingListController extends GetxController{
  // Map titles to corresponding icons (you can change icons as needed)
  final List<Map<String, dynamic>> titleIcons = [
    {'title': 'Refresh', 'icon': Icons.refresh},
    {'title': 'Search', 'icon': Icons.search},
    {'title': 'Sort', 'icon': Icons.sort},
  ];

  String get total => '\$14,300';
}