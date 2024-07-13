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
  showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.remove_red_eye),
                title: Text('View Reservation'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your onTap code here
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('Audit Trail'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your onTap code here
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Edit guest profile'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your onTap code here
                },
              ),
              ListTile(
                leading: Icon(Icons.block),
                title: Text('Mark No Show'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your onTap code here
                },
              ),
              ListTile(
                leading: Icon(Icons.hotel),
                title: Text('Assign Room'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your onTap code here
                },
              ),
              ListTile(
                leading: Icon(Icons.swap_horiz),
                title: Text('Amend Stay'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your onTap code here
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text('Void Transaction'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your onTap code here
                },
              ),
              ListTile(
                leading: Icon(Icons.print),
                title: Text('Print Invoice'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your onTap code here
                },
              ),
              ListTile(
                leading: Icon(Icons.close),
                title: Text('Close'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your onTap code here
                },
              ),
            ],
          ),
        );
      },
    );
  }


}