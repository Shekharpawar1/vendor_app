import 'package:get/get.dart';

class Critiquedashboardcontroller extends GetxController{
  final List<Map<String, String>> pricingBreakdown = [
    {'title': 'Read Reviews', 'price': '0 new reviews'},
    {'title': 'Reply Negative Reviews', 'price': '0 negative reviews'},
    {'title': 'Action Required','price': '0 pending actions'},

  ];

  String get total => '\$14,300';
}