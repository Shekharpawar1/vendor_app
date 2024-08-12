import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
// import '../helper/styles.dart' as sl;
import 'package:http/http.dart' as http;

import '../../../utils/helper/api_helper.dart';

class Homecontroller extends GetxController{
  RxString title=''.obs;
  RxBool SwitchOn =true.obs;
  RxBool switchvalue=true.obs;
  final box=GetStorage();

  void onInit(){
    fetchData();
    super.onInit();
  }

  changeStatus(value){
    switchvalue.value=value;
    changeHotelStatus(value);

  }
  List item = [
    CountOccupancy(title: 'Void', count: 0),
    CountOccupancy(title: 'Cancelled', count: 0),
    CountOccupancy(title: 'No Show', count: 0),
    ];
  List item2 = [
    CountOccupancy(title: 'Total Review', count: 0),
    CountOccupancy(title: 'Positive', count: 0),
    CountOccupancy(title: 'Negative', count: 0),
  ];

  Future<void> fetchData() async {
    await getDashData(); // Fetch data using the existing method
  }

  ///API Calling
  var isLoading = false.obs;
  RxMap<String, dynamic> bookingData = <String, dynamic>{}.obs;


  Future<void> getDashData() async {
    try {
      isLoading.value = true;
      print("----getDashData is called-----");

      final String? token = box.read('access_token');

      final url = "${dashboardApi}";
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print('Status Code ---> ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print("responseBody: $responseBody");

        var data = responseBody;

        print("Data --> $data");
        if (data != null) {

          ///This is also working
          //var bookingMonthData = List<Map<String, dynamic>>.from(data['booking_month']);
          //
          //         // Ensure bookingMonthData is a list and not empty
          //         var lastBookingAmount = bookingMonthData.isNotEmpty
          //             ? bookingMonthData.last['bookingAmount'] ?? 0.0
          //             : 0.0;
          //
          var bookingMonthData = data['booking_month'] as List<dynamic>;

          // Ensure bookingMonthData is a list and not empty
          var lastBookingAmount = bookingMonthData.isNotEmpty
              ? (bookingMonthData[bookingMonthData.length - 1] as Map<String, dynamic>)['bookingAmount'] ?? 0.0
              : 0.0;

          var dashboardData = {
            'page_title': data['page_title'],
            'widget': {
              'today_booked': data['widget']['today_booked'],
              'today_available': data['widget']['today_available'],
              'total': data['widget']['total'],
              'active': data['widget']['active'],
              'pending_checkin': data['widget']['pending_checkin'],
              'delayed_checkout': data['widget']['delayed_checkout'],
              'upcoming_checkin': data['widget']['upcoming_checkin'],
              'upcoming_checkout': data['widget']['upcoming_checkout'],
            },
            'booking_month': {
              'bookingAmount': bookingMonthData.map((e) => (e as Map<String, dynamic>)['bookingAmount']).toList(),
              'months': bookingMonthData.map((e) => (e as Map<String, dynamic>)['months']).toList(),
              'currentMonthBookingAmount': lastBookingAmount??0.0,
            },
            'months': List<String>.from(data['months']),
            'trx_report': data['trx_report'] != null && data['trx_report']['date'] is List
                ? {'date': List<String>.from(data['trx_report']['date'])}
                : {'date': []},
            'plus_trx': List<dynamic>.from(data['plus_trx']),
            'minus_trx': List<dynamic>.from(data['minus_trx']),
            'total_revenue': data['total_revenue'],
            'daily_avg_rate': data['daily_avg_rate'] != null
                ? data['daily_avg_rate'].toDouble()
                : 0.0,
          };

          bookingData.value = dashboardData;
          print("Last Booking amount: $lastBookingAmount");
          print('Booking Data --> ${bookingData.value}');
        } else {
          print('Data is null');
          bookingData.value = {};
          print('Booking Data --> $bookingData');
        }
      } else if (response.statusCode == 401) {
        GetStorage().erase();
        Get.offAllNamed("/login");
      } else {
        print('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (err) {
      print("Error: $err"); // Log the error for debugging
    } finally {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isLoading.value = false; // Ensure to stop loading indicator
      });
    }
  }












  changeHotelStatus(value) async{
    try{
      final getUserData=box.read("userData");
      var userDataDecoded=jsonDecode(getUserData);
      var userToken=userDataDecoded.token;
      var userId=userDataDecoded.user_id;
      final response=await http.post(Uri.parse(changeHotelStatusApi),body:{

      });
      if(response.statusCode == 200){
         update();
      }
      else if (response.statusCode ==401){
         Get.offAllNamed("/login");
      }
      else{
        Get.snackbar("Alert", "Something went Wrong",snackPosition: SnackPosition.BOTTOM);
      }
    }
    catch(err){
      Get.snackbar("Alert", "Something went wrong",snackPosition: SnackPosition.BOTTOM);
    }
  }
}


class CountOccupancy{
  String title;
  int count;
  CountOccupancy({
    required this.title,
    required this.count,
});
}

