import 'dart:convert';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/utils/helper/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/audit_trail_model.dart';
import '../model/booking_detail_model.dart';
class CommonAppBar2Controller extends GetxController {

  /// General Info Part
  var selectedIndex = 0.obs; // Initialize with index 0 (Food Charges)
  TextEditingController dateController = TextEditingController();

  // Observable variables for arrival and departure dates
  var arrivalDate = DateTime.now().obs;
  var departureDate = (DateTime.now().add(Duration(days: 1))).obs;

  CommonAppBar2Controller(String id, String bookingNum){
    bookingId.value = id;
    bookingNumber.value = bookingNum;
  }

  @override
  void onInit() {
    super.onInit();
    getInfo();
    getAuditTrailInfo();

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

  final Formkey=GlobalKey<FormState>();
  final Formkey2=GlobalKey<FormState>();

  showAlertBox(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(

          content:  SingleChildScrollView(
            child: Container(
              child: Form(
                key:Formkey2 ,
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
                Formkey2.currentState?.dispose();
               Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            SizedBox(width: 20,),
            ElevatedButton(
              onPressed: () {
                if (Formkey2.currentState!.validate()) {
                  // Process form data
                  Formkey2.currentState?.dispose();
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

  /// Guest Info Part
  void onClose(){
    Formkey.currentState?.dispose();
    super.onClose();
}

  /// Audio Trail Part
  var reservationTitles = <ReservationTitles>[
    ReservationTitles(
      title: 'Quick Reservation',
      subTitle1: 'Reservation No',
      subTitle2: 'Reservation Type',
      subTitle3: 'Rate Model',
      subTitle4: '',
    ),
    ReservationTitles(
      title: 'Apply Tax on Room Type',
      subTitle1: 'Room Type',
      subTitle2: 'From',
      subTitle3: 'To',
      subTitle4: 'Applicable Tax',
    ),
    ReservationTitles(
      title: 'Add Meal plan',
      subTitle1: 'Meal plan',
      subTitle2: '',
      subTitle3: '',
      subTitle4: '',
    ),
    // Add more reservations if needed
  ].obs;

  var reservations = <Reservation>[
    Reservation(
      info1: 'UCA43D66891500',
      info2: 'Quotation',
      info3: 'Normal',
      info4: '',
      email: 'mohammadmonoco@gmail.com',
      dateTime: '07/06/2024 03:27:20 Pm',
      someOtherInfo: '223,186,4,74',
    ),
    Reservation(
      info1: 'DULEX NEW',
      info2: '03/20/2024',
      info3: '03/21/2024',
      info4: 'VAT 15%',
      email: 'mohammadmonoco@gmail.com',
      dateTime: '07/06/2024 03:27:20 Pm',
      someOtherInfo: '223,186,4,74',
    ),
    Reservation(
      info1: 'Lunch & Dinner, Child Package[Walkin/New Reservation] ',
      info2: '',
      info3: '',
      info4: '',
      email: 'mohammadmonoco@gmail.com',
      dateTime: '07/06/2024 03:27:20 Pm',
      someOtherInfo: '223,186,4,74',
    ),
    // Add more reservations if needed
  ].obs;


  ///API CALLING
  var isLoading = false.obs;
  final box = GetStorage();
  var bookingId = ''.obs;
  RxString bookingNumber = '0'.obs;
  RxList generalInfo = [].obs;
  RxList bookedRoomInfo = [].obs;
  RxList roomTypeInfo = [].obs;
  RxList paymentInfo =[].obs;
  var auditTrailList = <AuditTrail>[].obs;

  Future<void> getInfo() async {
    try {
      isLoading.value = true;
      final String? token = box.read('access_token');
      final url = '${bookingDetail}/${bookingId.value}';
      print('URL: $url');
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      print('Status Code:-- ${response.statusCode}');
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print('Status --> ${responseBody['status']}');
        print('Response Body: ${response.body}');

        if (responseBody['status'] == 'success') {
          // Extract booking details with null checks
          final bookingData = responseBody['data']?['booking'];
          final bookedRoomsData = responseBody['data']?['bookedRooms']?['date'];
          final paymentInfoData = responseBody['data']?['paymentInfo'];
          final contactData = bookingData?['contact_info'];
          final guestData = bookingData?['guest'];

          if (bookingData != null) {
            // Map booking data
            // bookingNumber.value = bookingData['booking_number'].toString();
            generalInfo.value = [
              {
                'id': bookingData['id'],
                'booking_number': bookingData['booking_number'].toString(),

                'check_in': bookingData['check_in'],
                'check_out': bookingData['check_out'],
                'contact_info': {
                  'name': contactData?['name'] ?? '',
                  'phone': contactData?['phone'] ?? '',
                },
                'total_adult': bookingData['total_adult'],
                'total_child': bookingData['total_child'],
                'total_discount': bookingData['total_discount'],
                'tax_charge': bookingData['tax_charge'],
                'booking_fare': bookingData['booking_fare'],
                'service_cost': bookingData['service_cost'],
                'extra_charge': bookingData['extra_charge'],
                'paid_amount': bookingData['paid_amount'],
                'total_amount': bookingData['total_amount'],
                'due_amount': bookingData['due_amount'],
                'tax_percent': bookingData['tax_percent'],
                'guest': {
                  'id': guestData?['id'] ?? '',
                  'name': guestData?['name'] ?? '',
                  'mobile': guestData?['mobile'] ?? '',
                  'email': guestData?['email'] ?? '',
                  'address': guestData?['address'] ?? '',
                }
              }
            ];

          }

          if (bookedRoomsData != null && bookedRoomsData is List) {
            // Map booked rooms data
            bookedRoomInfo.value = bookedRoomsData.map((room) {
              return {
                'id': room['id'],
                'booking_id': room['booking_id'],
                'room_type_id': room['room_type_id'],
                'room_id': room['room_id'],
                'room_number': room['room_number'],
                'booked_for': room['booked_for'],
                'fare': room['fare'],
                'discount': room['discount'],
                'tax_charge': room['tax_charge'],
                'cancellation_fee': room['cancellation_fee'],
                'status': room['status'],
                'room': room['room'],
                'room_type': room['room_type'],
              };
            }).toList();
          }

          if (paymentInfoData != null) {
            // Map payment info data
            paymentInfo.value = [
              {
                'subtotal': paymentInfoData['subtotal'],
                'total_amount': paymentInfoData['total_amount'],
                'canceled_fare': paymentInfoData['canceled_fare'],
                'canceled_tax_charge': paymentInfoData['canceled_tax_charge'],
                'payment_received': paymentInfoData['payment_received'],
                'refunded': paymentInfoData['refunded'],
              }
            ];
          }

          print('Booking number--1---: ${bookingNumber.value}');
        } else {
          // Handle error or unexpected response format
          print('API response status is not success');
        }
      } else if (response.statusCode == 401) {
        GetStorage().erase();
        Get.offAllNamed("/bottomNav");
      }
    } catch (e, stacktrace) {
      print("Error: $e");
      print("Stacktrace: $stacktrace");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getAuditTrailInfo() async {
    try {
      print('.....GetAuditTrailInfo is called.....');
      isLoading.value = true;
      print('Booking number--2---: ${bookingNumber.value}');
      final String? token = box.read('access_token');
      final url = '${audioTrail}?booking_number=${bookingNumber.value}';
      print('URL: $url');

      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      print('Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print('Response Body: $responseBody');

        // Debug individual parts
        print('Booking Log: ${responseBody['booking_log']}');
        print('Data: ${responseBody['booking_log']?['data']}');

        // Parse the response body into the model
        final bookingActionsModel = BookingActionsModel.fromJson(responseBody);

        // Update the RxList with the parsed data
        auditTrailList.value = bookingActionsModel.bookingLog.data;

        print("Audit Trail List --> ${auditTrailList.value}");
      } else if (response.statusCode == 401) {
        GetStorage().erase();
        Get.offAllNamed("/bottomNav");
      } else {
        print('Failed to load audit trail info. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }




  Future<void> getExtraCharges() async {
    try {
      isLoading.value = true;

      Map<String, String> data = {
        // Add key-value pairs as needed
      };

      final String? token = box.read('access_token');
      final String url = '${extraCharges}/${bookingId.value}';

      // Send the request
      final response = await http.post(
        Uri.parse(url),
        body: data,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );


      if (response.statusCode == 200) {

        final responseBody = json.decode(response.body);
      } else {
        print('Failed to fetch extra charges: ${response.statusCode}');
      }

    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}



class ReservationTitles {
  final String title;
  final String subTitle1;
  final String subTitle2;
  final String subTitle3;
  final String subTitle4;

  ReservationTitles({
    required this.title,
    required this.subTitle1,
    required this.subTitle2,
    required this.subTitle3,
    required this.subTitle4,
  });
}
class Reservation {
  final String info1;
  final String info2;
  final String info3;
  final String info4;
  final String email;
  final String dateTime;
  final String someOtherInfo;

  Reservation({
    required this.info1,
    required this.info2,
    required this.info3,
    required this.info4,
    required this.email,
    required this.dateTime,
    required this.someOtherInfo,
  });
}
