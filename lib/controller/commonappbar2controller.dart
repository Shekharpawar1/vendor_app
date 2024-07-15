import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../helper/colors.dart';
import '../helper/styles.dart';

class CommonAppBar2Controller extends GetxController {

  /// General Info Part
  var selectedIndex = 0.obs; // Initialize with index 0 (Food Charges)
  TextEditingController dateController = TextEditingController();

  // Observable variables for arrival and departure dates
  var arrivalDate = DateTime.now().obs;
  var departureDate = (DateTime.now().add(Duration(days: 1))).obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize formattedDate with today's date
    arrivalDate.value = DateTime.now();
    departureDate.value = DateTime.now().add(Duration(days: 1));
  }

  void selectItem(int index) {
    selectedIndex.value = index;
  }

  Future<void> selectDate(BuildContext context, bool isArrival) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isArrival ? arrivalDate.value : departureDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      if (isArrival) {
        arrivalDate.value = picked;
      } else {
        departureDate.value = picked;
      }
    }
  }

  // Compute the number of nights between arrival and departure
  int get numberOfNights {
    final nights = departureDate.value.difference(arrivalDate.value).inDays;
    return nights < 1 ? 1 : nights;
  }

  final List<Map<String, String>> roomDetails = [
    {'title': 'Rate Type', 'info': 'Elite Room'},
    {'title': 'Avg. Daily Rate', 'info': '\$25,000'},
  ];

  final List<Map<String, String>> summary = [
    {'title': 'Total Charges', 'price': '\$31,750'},
    {'title': 'Total Credits', 'price': '\$0'},
  ];

  var isExpanded = false.obs;

  // List of charges
  final List<Map<String, String>> charges = [
    {'title': 'Room Charges', 'price': '\$25,000'},
    {'title': 'Discount', 'price': '\$0'},
    {'title': 'Tax', 'price': '\$3,750'},
    {'title': 'Extra Charges', 'price': '\$3,000'},
    {'title': 'Unposted Inclusion Rate', 'price': '\$0'},
    {'title': 'Balance Transfer', 'price': '\$0'},
    {'title': 'Amount Paid', 'price': '\$0'},
    {'title': 'Round Off', 'price': '\$0'},
  ];
  showAlertBox(context,_formKey) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(

          content:  SingleChildScrollView(
            child: Container(
              child: Form(
                key:_formKey ,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Order No',
                          labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Order No.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Category',
                          labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Categoyr';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Unit/Room',
                          labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Unit/Room.';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 8.0),

                      TextFormField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Description.';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 8.0),
                      TextFormField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: 'Assigned to',
                          labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Assigned to.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),

                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
               Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            SizedBox(width: 20,),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process form data
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Text('Submit'),
            ),

          ],
        );
      },
    );
  }

  String get total => '\$31,750';


/// Guest Info Part
}
