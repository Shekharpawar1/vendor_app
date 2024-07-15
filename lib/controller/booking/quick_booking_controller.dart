import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/helper/colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuickBookingController extends GetxController {
  RxString CheckInDate = new DateTime.now().toString().obs;
  RxString CheckOutDate = new DateTime.now().toString().obs;
  RxString CheckInTime = '12:00:00'.obs;
  RxString TotalNights = '0'.obs;
  RxString totalRooms = '1'.obs;
  RxString RoomType='Select Room Type'.obs;
  RxString RateType='Select Rate Type'.obs;
  RxInt isSelected = 1.obs;
  RxInt BookingType=1.obs;
  RxInt GuestType = 1.obs;
  RxInt totalAdults = 1.obs;
  RxString preffix = 'Mr.'.obs;
  RxInt totalRate = 0.obs;
  RxInt totalChildren = 0.obs;
  String CurrentYear = new DateTime.now().toString();
  Future<void> selectDate(BuildContext context, String type) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    if (picked != null && picked != now) {
      updateDate(picked, type, context);
      // dateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  Future<void> selectDate2(BuildContext context, String type) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    if (picked != null && picked != now) {
      "${picked}".split('.')[0];
      print("picked checkout ${"${picked}".split(' ')[0]}");
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      final String formattedDate = formatter.format(picked);
      CheckOutDate.value = formattedDate;
      //  updateDate(picked, type, context);
      // dateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  var selectedTime = TimeOfDay.now().obs;
  var selectedReturnTime = TimeOfDay.now().obs;
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    if (picked != null && picked != selectedTime.value) {
      CheckInTime.value = picked.format(context).toString();
      update();
      // timeController.text = selectedTime.value.format(context);
    }
  }

  updateDate(value, type, context) {
    if (type == 'checkin') {
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      final String formattedDate = formatter.format(value);
      CheckInDate.value = formattedDate;
      selectTime(context);
      // update();
    } else {
      CheckOutDate.value = value.toString();
      // update();
    }

    TotalNights.value = DateTime.parse(CheckOutDate.value)
        .difference(DateTime.parse(CheckInDate.value))
        .inDays
        .toString();
    print("checkin vale ${CheckInDate.value}");
    print("checkout vale ${CheckOutDate.value}");
    print("checkout vale ${TotalNights.value}");

    update();
  }

  final List<String> businessSources = [
    'Agoda',
    'Booking.com',
    'Expedia',
    'Hotels.com',
    'TripAdvisor',
    'Trivago',
    'Airbnb',
    'Orbitz'
  ];
  RxString selectBusinesssource='Select Business Source'.obs;
  void showBusinessSourceSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GridView.builder(
          padding: EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: businessSources.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.pop(context);
                // Handle selection of business source here
                selectBusinesssource.value=businessSources[index];
                print('Selected: ${businessSources[index]}');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    businessSources[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
  RxBool isSwitchOn=false.obs;
  showModal2(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
      return Container(
        height: 256
            .h, // Adjust the height as needed
        child: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
            6, // Adjust this value for the desired number of columns
            mainAxisSpacing:
            5.0, // Spacing between rows
            crossAxisSpacing:
            5.0, // Spacing between columns
          ),
          itemCount: 256,
          itemBuilder: (context, index) {
            return InkWell(
              // Use InkWell for tap functionality
              onTap: () {
              totalRooms.value =
                    (index + 1).toString();
                Navigator.pop(context);
              },
              child: Padding(
                padding:
                const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                      BorderRadius
                          .circular(10)),
                  padding: EdgeInsets.all(
                      8.0), // Padding around the content
                  child: Center(
                      child: Text(
                          '${index + 1}')),
                ),
              ),
            );
          },
        ),
      );
    });
  }



  List RoomTypeList=["shekahr"];
  ////room Type modal
  showModal3(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 256
                .h, // Adjust the height as needed
            child: GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                4, // Adjust this value for the desired number of columns
                mainAxisSpacing:
                5.0, // Spacing between rows
                crossAxisSpacing:
                5.0, // Spacing between columns
              ),
              itemCount: RoomTypeList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  // Use InkWell for tap functionality
                  onTap: () {
                    RoomType.value=RoomTypeList[index];
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                          BorderRadius
                              .circular(10)),
                      // padding: EdgeInsets.all(
                      //     8.0), // Padding around the content
                      child: Center(
                        child: Text(
                            '${RoomTypeList[index]}'),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }

  List RateTypeList=["shekhar"];

  ///RAte type modal
  showModal4(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 256
                .h, // Adjust the height as needed
            child: GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                4, // Adjust this value for the desired number of columns
                mainAxisSpacing:
                5.0, // Spacing between rows
                crossAxisSpacing:
                5.0, // Spacing between columns
              ),
              itemCount: RateTypeList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  // Use InkWell for tap functionality
                  onTap: () {
                    RateType.value=RateTypeList[index];
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                          BorderRadius
                              .circular(10)),

                      child: Center(
                          child: Text(
                              '${RateTypeList[index]}')),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
