import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
// import '../helper/styles.dart' as sl;
import 'package:http/http.dart' as http;

import '../../../utils/helper/api_helper.dart';
import '../model/home_model.dart';

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
  Rx<DashboardModel?> bookingData = Rx<DashboardModel?>(null);


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


        if (responseBody != null) {
          final dashboardData = DashboardModel.fromJson(responseBody);

          bookingData.value = dashboardData;
          print("Booking Data --> ${bookingData.value}");
        } else {
          print('Data is null');
          bookingData.value = null;
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
      isLoading.value = false; // Ensure to stop loading indicator
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

