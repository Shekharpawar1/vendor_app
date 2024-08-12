import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../utils/helper/api_helper.dart';
import '../../booking_details/view/BookingDetails.dart';

class BookingListController extends GetxController {
  // Map titles to corresponding icons (you can change icons as needed)
  final List<Map<String, dynamic>> titleIcons = [
    {'title': 'Refresh', 'icon': Icons.refresh},
    {'title': 'Search', 'icon': Icons.search},
    {'title': 'Sort', 'icon': Icons.sort},
  ];

  @override
  void onInit() {
    // Call the API functions here
    getArrivalInfo(scope: 'Today');
    getTodayDepartureInfo();
    getBookingInfo();
    arrivalDate.value = DateTime.now();
    print('Arrival Date: ${arrivalDate.value}');
    departureDate.value = DateTime.now().add(Duration(days: 1));
    print('Departure Date: ${departureDate.value}');
    super.onInit();
  }

  var selectedIndex = 0.obs; // Initialize with index 0 (Food Charges)
  TextEditingController dateController = TextEditingController();

  // Observable variables for arrival and departure dates
  var arrivalDate = DateTime.now().obs;
  var departureDate = (DateTime.now().add(Duration(days: 1))).obs;

  void selectItem(int index) {
    selectedIndex.value = index;
  }

  Future<void> selectDate(BuildContext context, bool isArrival) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isArrival ? arrivalDate.value : departureDate.value,
      firstDate: DateTime(2000),
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


  ///API'S
  var isLoading = false.obs;
  final box = GetStorage();
  RxList arrivals = [].obs;
  RxList todayDepartures = [].obs;
  RxList departures = [].obs;
  RxList bookings = [].obs;
  RxList bookingsInfo = [].obs;
  RxList inHouseBookings = [].obs;
  var currentScope = 'Today'.obs;
  var currentTabIndex = 0.obs;

  Future<void> getArrivalInfo({required String scope}) async {
    print('-----Today Arrival-----');
    try {
      isLoading.value = true;
      final String? token = box.read('access_token');
      final url = "${arrival}?scope=$scope";
      print('URL: $url');
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print('Status Code ---> ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print('Data = ${responseBody['data']}');

        var data = responseBody['data'];

        // Clear the current list
        arrivals.clear();

        // Add new items to the list
        arrivals.value.addAll(data['bookings'].map((item) {
          return {
            'id': item['id'],
            'booking_number': item['booking_number'],
            'check_in': item['check_in'],
            'check_out': item['check_out'],
            'contact_info': {
              'name': item['contact_info']['name'],
              'phone': item['contact_info']['phone'],
            },
            'total_adult': item['total_adult'],
            'total_child': item['total_child'],
            'total_discount': item['total_discount'],
            'tax_charge': item['tax_charge'],
            'booking_fare': item['booking_fare'],
            'service_cost': item['service_cost'],
            'extra_charge': item['extra_charge'],
            'paid_amount': item['paid_amount'],
            'total_amount': item['total_amount'],
            'due_amount': item['due_amount'],
            'tax_percent': item['tax_percent'],
            'user': item['user'] != null ? {
              'id': item['user']['id'],
              'firstname': item['user']['firstname'],
              'lastname': item['user']['lastname'],
              'email': item['user']['email'],
              'mobile': item['user']['mobile'],
              'address': item['user']['address'] != null ? {
                'country': item['user']['address']['country'],
                'state': item['user']['address']['state'],
                'city': item['user']['address']['city'],
                'address': item['user']['address']['address'],
              } : null,
            } : null,
            'guest': item['guest'] != null ? {
              'id': item['guest']['id'],
              'name': item['guest']['name'],
              'mobile': item['guest']['mobile'],
              'email': item['guest']['email'],
              'address': item['guest']['address'],
            } : null,
            'booked_rooms': item['booked_rooms'].map((room) {
              return {
                'id': room['id'],
                'room_number': room['room_number'],
                'booked_for': room['booked_for'],
                'fare': room['fare'],
                'discount': room['discount'],
                'tax_charge': room['tax_charge'],
                'cancellation_fee': room['cancellation_fee'],
                'room': room['room'] != null ? {
                  'id': room['room']['id'],
                  'room_number': room['room']['room_number'],
                  'status': room['room']['status'],
                  'created_at': room['room']['created_at'],
                  'updated_at': room['room']['updated_at'],
                } : null,
                'room_type': room['room_type'] != null ? {
                  'id': room['room_type']['id'],
                  'name': room['room_type']['name'],
                  'total_adult': room['room_type']['total_adult'],
                  'total_child': room['room_type']['total_child'],
                  'fare': room['room_type']['fare'],
                  'discount_percentage': room['room_type']['discount_percentage'],
                  'description': room['room_type']['description'],
                  'beds': List<String>.from(room['room_type']['beds']),
                  'cancellation_fee': room['room_type']['cancellation_fee'],
                  'cancellation_policy': room['room_type']['cancellation_policy'],
                  'is_featured': room['room_type']['is_featured'],
                  'status': room['room_type']['status'],
                  'image': room['room_type']['image'],
                  'discounted_fare': room['room_type']['discounted_fare'],
                  'discount': room['room_type']['discount'],
                  'images': room['room_type']['images'] != null ? List<Map<String, dynamic>>.from(room['room_type']['images']) : null,
                } : null,
              };
            }).toList(),
          };
        }).toList());

        print("Arrival Info --> ${arrivals}");
      } else if (response.statusCode == 401) {
        GetStorage().erase();
        Get.offAllNamed("/bottomNav");
      }
    } catch (err) {
      print('Error: $err');
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> getTodayDepartureInfo() async {
    try {
      isLoading.value = true;
      final String? token = box.read('access_token');
      final url = "${todayDeparture}";
      print('URL: $url');
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print("-----Today's Departure-----");
      print('Status Code ---> ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        var data = responseBody['data'];

        // Clear the current list
        todayDepartures.clear();

        // Add new items to the list
        todayDepartures.value.addAll(data['bookings']['data'].map((item) {
          return {
            'id': item['id'],
            'booking_number': item['booking_number'],
            'check_in': item['check_in'],
            'check_out': item['check_out'],
            'time': item['check_out_at'],
            'contact_info': {
              'name': item['contact_info']['name'],
              'phone': item['contact_info']['phone'],
            },
            'total_adult': item['total_adult'],
            'total_child': item['total_child'],
            'total_discount': item['total_discount'],
            'tax_charge': item['tax_charge'],
            'booking_fare': item['booking_fare'],
            'service_cost': item['service_cost'],
            'extra_charge': item['extra_charge'],
            'paid_amount': item['paid_amount'],
            'cancellation_fee': item['cancellation_fee'],
            'total_amount': item['total_amount'],
            'due_amount': item['due_amount'],
            'tax_percent': item['tax_percent'],
            'booked_rooms': item['booked_rooms'].map((room) {
              return {
                'id': room['id'],
                'room_number': room['room_number'],
                'fare': room['fare'],
                'discount': room['discount'],
                'cancellation_fee': room['cancellation_fee'],
                'room_type': {
                  'id': room['room_type']['id'],
                  'name': room['room_type']['name'],
                  'total_adult': room['room_type']['total_adult'],
                  'total_child': room['room_type']['total_child'],
                  'fare': room['room_type']['fare'],
                  'discount_percentage': room['room_type']['discount_percentage'],
                  'description': room['room_type']['description'],
                  'image': room['room_type']['image'],
                },
              };
            }).toList(),
            'user': item['user'] != null ?{
              'id': item['user']['id'],
              'firstname': item['user']['firstname'],
              'lastname': item['user']['lastname'],
              'username': item['user']['username'],
              'email': item['user']['email'],
              'mobile': item['user']['mobile'],
              'address': item['user']['address'],
            }:null,
          };
        }).toList());

        print("Today Departure info --> ${todayDepartures.value}");
      } else if (response.statusCode == 401) {
        GetStorage().erase();
        Get.offAllNamed("/bottomNav");
      }
    } catch (err) {
      print('Error: $err');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getDepartureInfo({required String scope}) async {
    try {
      isLoading.value = true;
      final String? token = box.read('access_token');
      final url = "${departure}?scope=$scope";
      print('URL: $url');
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print("-----Departure-----");
      print('Status Code ---> ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        var data = responseBody['data'];

        // Clear the current list
        departures.clear();

        // Add new items to the list
        departures.value.addAll(data['bookings']['data'].map((item) {
          return {
            'id': item['id'],
            'booking_number': item['booking_number'],
            'guest_id': item['guest_id'],
            'check_in': item['check_in'],
            'check_out': item['check_out'],
            'time': item['check_out_at'],
            'contact_info': {
              'name': item['contact_info']['name'],
              'phone': item['contact_info']['phone'],
            },
            'total_adult': item['total_adult'].toString(),
            'total_child': item['total_child'].toString(),
            'total_discount': double.parse(item['total_discount'].toString()).toStringAsFixed(2),
            'tax_charge': double.parse(item['tax_charge'].toString()).toStringAsFixed(2),
            'booking_fare': double.parse(item['booking_fare'].toString()).toStringAsFixed(2),
            'service_cost': double.parse(item['service_cost'].toString()).toStringAsFixed(2),
            'extra_charge': double.parse(item['extra_charge'].toString()).toStringAsFixed(2),
            'paid_amount': double.parse(item['paid_amount'].toString()).toStringAsFixed(2),
            'due_amount': double.parse(item['due_amount'].toString()).toStringAsFixed(2),
            'tax_percent': item['tax_percent'].toString(),
            'total_amount': double.parse(item['total_amount'].toString()).toStringAsFixed(2),
            'booked_rooms': item['booked_rooms'] != null ? (item['booked_rooms'] as List).map((room) {
              return {
                'id': room['id'],
                'booking_id': room['booking_id'],
                'room_type_id': room['room_type_id'],
                'room_id': room['room_id'],
                'room_number': room['room_number'],
                'booked_for': room['booked_for'],
                'fare': double.parse(room['fare'].toString()).toStringAsFixed(2),
                'discount': double.parse(room['discount'].toString()).toStringAsFixed(2),
                'tax_charge': double.parse(room['tax_charge'].toString()).toStringAsFixed(2),
                'cancellation_fee': double.parse(room['cancellation_fee'].toString()).toStringAsFixed(2),
                'status': room['status'].toString(),
                'room': {
                  'id': room['room']['id'],
                  'room_number': room['room']['room_number'],
                },
                'room_type': room['room_type'] != null ? {
                  'id': room['room_type']['id'],
                  'name': room['room_type']['name'],
                  'total_adult': room['room_type']['total_adult'].toString(),
                  'total_child': room['room_type']['total_child'].toString(),
                  'fare': double.parse(room['room_type']['fare'].toString()).toStringAsFixed(2),
                  'discount_percentage': room['room_type']['discount_percentage'].toString(),
                  'description': room['room_type']['description'],
                  'beds': List<String>.from(room['room_type']['beds'] ?? []),
                  'cancellation_fee': double.parse(room['room_type']['cancellation_fee'].toString()).toStringAsFixed(2),
                  'image': room['room_type']['image'],
                  'discounted_fare': double.parse(room['room_type']['discounted_fare'].toString()).toStringAsFixed(2),
                  'discount': double.parse(room['room_type']['discount'].toString()).toStringAsFixed(2),
                } : null,
              };
            }).toList() : [],
            'user': item['user'] != null ? {
              'firstname': item['user']['firstname'],
              'lastname': item['user']['lastname'],
              'username': item['user']['username'],
              'email': item['user']['email'],
              'mobile': item['user']['mobile'],
              'address': {
                'country': item['user']['address']['country'],
                'address': item['user']['address']['address'],
                'state': item['user']['address']['state'],
                'zip': item['user']['address']['zip']?.toString(),
                'city': item['user']['address']['city'],
              },
            } : null,
            'guest': item['guest'] != null ? {
              'name': item['guest']['name'],
              'mobile': item['guest']['mobile'],
              'email': item['guest']['email'],
              'address': item['guest']['address'],
            } : null,
          };
        }).toList());

        print("Departure info --> ${departures.value}");
      } else if (response.statusCode == 401) {
        GetStorage().erase();
        Get.offAllNamed("/bottomNav");
      }
    } catch (err) {
      print('Error: $err');
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> getBookingInfo({DateTime? arvlDate, DateTime? deptDate, bool isVisible = false}) async {
    try {
      isLoading.value = true;
      final String? token = box.read('access_token');

      String url;
      if (isVisible && arvlDate != null && deptDate != null) {
        // Format the dates to exclude the time component
        final String formattedArvlDate = DateFormat('yyyy-MM-dd').format(DateTime(arvlDate.year, arvlDate.month, arvlDate.day));
        final String formattedDeptDate = DateFormat('yyyy-MM-dd').format(DateTime(deptDate.year, deptDate.month, deptDate.day));
        url = '${allBooking}?date_to=$formattedArvlDate&date_from=$formattedDeptDate';
      } else {
        url = '${allBooking}';
      }

      print('URL: $url');
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print("-----Booking Info-----");
      print('Status Code ---> ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        // Extract 'data' from the response with a null check
        var data = responseBody['bookings']?['data'] ?? [];
        print('Data = $data');

        // Clear the current list
        bookings.clear();

        // Add new items to the list with null checks and proper mapping
        List newData = data.map((item) {
          return {
            "id": item["id"],
            "owner_id": item["owner_id"],
            "booking_number": item["booking_number"],
            "user_id": item["user_id"],
            "guest_id": item["guest_id"],
            'time': item['checked_in_at'],
            "check_in": item["check_in"],
            "check_out": item["check_out"],
            "contact_info": {
              "name": item["contact_info"]?["name"] ?? "",
              "phone": item["contact_info"]?["phone"] ?? ""
            },
            "total_adult": item["total_adult"],
            "total_child": item["total_child"],
            "total_discount": item["total_discount"],
            "tax_charge": item["tax_charge"],
            "booking_fare": item["booking_fare"],
            "service_cost": item["service_cost"],
            "extra_charge": item["extra_charge"],
            "extra_charge_subtracted": item["extra_charge_subtracted"],
            "paid_amount": item["paid_amount"],
            "cancellation_fee": item["cancellation_fee"],
            "refunded_amount": item["refunded_amount"],
            "key_status": item["key_status"],
            "status": item["status"],
            "created_at": item["created_at"],
            "updated_at": item["updated_at"],
            "total_amount": item["total_amount"],
            "due_amount": item["due_amount"],
            "tax_percent": item["tax_percent"],
            "booked_rooms": item["booked_rooms"]?.map((room) {
              return {
                "id": room["id"],
                "booking_id": room["booking_id"],
                "room_type_id": room["room_type_id"],
                "room_id": room["room_id"],
                "room_number": room["room_number"],
                "booked_for": room["booked_for"],
                "fare": room["fare"],
                "discount": room["discount"],
                "tax_charge": room["tax_charge"],
                "cancellation_fee": room["cancellation_fee"],
                "status": room["status"],
                "created_at": room["created_at"],
                "updated_at": room["updated_at"],
                "room": {
                  "id": room["room"]?["id"] ?? 0,
                  "owner_id": room["room"]?["owner_id"] ?? 0,
                  "room_type_id": room["room"]?["room_type_id"] ?? 0,
                  "room_number": room["room"]?["room_number"] ?? "",
                  "status": room["room"]?["status"] ?? 0,
                  "created_at": room["room"]?["created_at"] ?? "",
                  "updated_at": room["room"]?["updated_at"] ?? ""
                },
                "room_type": {
                  "id": room["room_type"]?["id"] ?? 0,
                  "owner_id": room["room_type"]?["owner_id"] ?? 0,
                  "name": room["room_type"]?["name"] ?? "",
                  "total_adult": room["room_type"]?["total_adult"] ?? 0,
                  "total_child": room["room_type"]?["total_child"] ?? 0,
                  "fare": room["room_type"]?["fare"] ?? 0.0,
                  "discount_percentage": room["room_type"]?["discount_percentage"] ?? 0,
                  "keywords": room["room_type"]?["keywords"] ?? "",
                  "description": room["room_type"]?["description"] ?? "",
                  "beds": room["room_type"]?["beds"] ?? 0,
                  "cancellation_fee": room["room_type"]?["cancellation_fee"] ?? 0.0,
                  "cancellation_policy": room["room_type"]?["cancellation_policy"] ?? "",
                  "is_featured": room["room_type"]?["is_featured"] ?? false,
                  "status": room["room_type"]?["status"] ?? 0,
                  "created_at": room["room_type"]?["created_at"] ?? "",
                  "updated_at": room["room_type"]?["updated_at"] ?? "",
                  "image": room["room_type"]?["image"] ?? "",
                  "discounted_fare": room["room_type"]?["discounted_fare"] ?? 0.0,
                  "discount": room["room_type"]?["discount"] ?? 0.0,
                  "images": room["room_type"]?["images"]?.map((image) {
                    return {
                      "id": image["id"],
                      "room_type_id": image["room_type_id"],
                      "image": image["image"],
                      "created_at": image["created_at"],
                      "updated_at": image["updated_at"]
                    };
                  })?.toList() ?? []
                }
              };
            })?.toList() ?? [],
            "user": item["user"],
            "active_booked_rooms": item["active_booked_rooms"]?.map((room) {
              return {
                "id": room["id"],
                "booking_id": room["booking_id"],
                "room_type_id": room["room_type_id"],
                "room_id": room["room_id"],
                "room_number": room["room_number"],
                "booked_for": room["booked_for"],
                "fare": room["fare"],
                "discount": room["discount"],
                "tax_charge": room["tax_charge"],
                "cancellation_fee": room["cancellation_fee"],
                "status": room["status"],
                "created_at": room["created_at"],
                "updated_at": room["updated_at"],
                "room": {
                  "id": room["room"]?["id"] ?? 0,
                  "room_number": room["room"]?["room_number"] ?? ""
                }
              };
            })?.toList() ?? [],
            "guest": item["guest"] != null ? {
              "id": item["guest"]["id"],
              "name": item["guest"]["name"],
              "mobile": item["guest"]["mobile"],
              "email": item["guest"]["email"],
              "address": item["guest"]["address"],
              "created_at": item["guest"]["created_at"],
              "updated_at": item["guest"]["updated_at"]
            } : null
          };
        }).toList();

        bookings.addAll(newData);
        print("All Booking --> ${bookings.value}");

      } else if (response.statusCode == 401) {
        GetStorage().erase();
        Get.offAllNamed("/bottomNav");
      }
    } catch (err) {
      print('Error: $err');
    } finally {
      isLoading.value = false;
    }
  }


  // Future<void> getBookingInfo() async {
  //   try {
  //     isLoading.value = true;
  //     final String? token = box.read('access_token');
  //     final url = '${allBooking}';
  //     print('URL: $url');
  //     final response = await http.get(
  //       Uri.parse(url),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //     print("-----All Booking-----");
  //     print('Status Code ---> ${response.statusCode}');
  //
  //     if (response.statusCode == 200) {
  //       final responseBody = jsonDecode(response.body);
  //
  //       // Extract 'data' from the response with a null check
  //       var data = responseBody['bookings']?['data'] ?? [];
  //       print('Data = $data');
  //
  //       // Clear the current list
  //       bookings.clear();
  //
  //       // Add new items to the list with null checks and proper mapping
  //       bookings.addAll(data.map((item) {
  //         return {
  //           "id": item["id"],
  //           "owner_id": item["owner_id"],
  //           "booking_number": item["booking_number"],
  //           "user_id": item["user_id"],
  //           "guest_id": item["guest_id"],
  //           'time': item['checked_in_at'],
  //           "check_in": item["check_in"],
  //           "check_out": item["check_out"],
  //           "contact_info": {
  //             "name": item["contact_info"]?["name"] ?? "",
  //             "phone": item["contact_info"]?["phone"] ?? ""
  //           },
  //           "total_adult": item["total_adult"],
  //           "total_child": item["total_child"],
  //           "total_discount": item["total_discount"],
  //           "tax_charge": item["tax_charge"],
  //           "booking_fare": item["booking_fare"],
  //           "service_cost": item["service_cost"],
  //           "extra_charge": item["extra_charge"],
  //           "extra_charge_subtracted": item["extra_charge_subtracted"],
  //           "paid_amount": item["paid_amount"],
  //           "cancellation_fee": item["cancellation_fee"],
  //           "refunded_amount": item["refunded_amount"],
  //           "key_status": item["key_status"],
  //           "status": item["status"],
  //           "created_at": item["created_at"],
  //           "updated_at": item["updated_at"],
  //           "total_amount": item["total_amount"],
  //           "due_amount": item["due_amount"],
  //           "tax_percent": item["tax_percent"],
  //           "booked_rooms": item["booked_rooms"]?.map((room) {
  //             return {
  //               "id": room["id"],
  //               "booking_id": room["booking_id"],
  //               "room_type_id": room["room_type_id"],
  //               "room_id": room["room_id"],
  //               "room_number": room["room_number"],
  //               "booked_for": room["booked_for"],
  //               "fare": room["fare"],
  //               "discount": room["discount"],
  //               "tax_charge": room["tax_charge"],
  //               "cancellation_fee": room["cancellation_fee"],
  //               "status": room["status"],
  //               "created_at": room["created_at"],
  //               "updated_at": room["updated_at"],
  //               "room": {
  //                 "id": room["room"]?["id"] ?? 0,
  //                 "owner_id": room["room"]?["owner_id"] ?? 0,
  //                 "room_type_id": room["room"]?["room_type_id"] ?? 0,
  //                 "room_number": room["room"]?["room_number"] ?? "",
  //                 "status": room["room"]?["status"] ?? 0,
  //                 "created_at": room["room"]?["created_at"] ?? "",
  //                 "updated_at": room["room"]?["updated_at"] ?? ""
  //               },
  //               "room_type": {
  //                 "id": room["room_type"]?["id"] ?? 0,
  //                 "owner_id": room["room_type"]?["owner_id"] ?? 0,
  //                 "name": room["room_type"]?["name"] ?? "",
  //                 "total_adult": room["room_type"]?["total_adult"] ?? 0,
  //                 "total_child": room["room_type"]?["total_child"] ?? 0,
  //                 "fare": room["room_type"]?["fare"] ?? 0.0,
  //                 "discount_percentage": room["room_type"]?["discount_percentage"] ?? 0,
  //                 "keywords": room["room_type"]?["keywords"] ?? "",
  //                 "description": room["room_type"]?["description"] ?? "",
  //                 "beds": room["room_type"]?["beds"] ?? 0,
  //                 "cancellation_fee": room["room_type"]?["cancellation_fee"] ?? 0.0,
  //                 "cancellation_policy": room["room_type"]?["cancellation_policy"] ?? "",
  //                 "is_featured": room["room_type"]?["is_featured"] ?? false,
  //                 "status": room["room_type"]?["status"] ?? 0,
  //                 "created_at": room["room_type"]?["created_at"] ?? "",
  //                 "updated_at": room["room_type"]?["updated_at"] ?? "",
  //                 "image": room["room_type"]?["image"] ?? "",
  //                 "discounted_fare": room["room_type"]?["discounted_fare"] ?? 0.0,
  //                 "discount": room["room_type"]?["discount"] ?? 0.0,
  //                 "images": room["room_type"]?["images"]?.map((image) {
  //                   return {
  //                     "id": image["id"],
  //                     "room_type_id": image["room_type_id"],
  //                     "image": image["image"],
  //                     "created_at": image["created_at"],
  //                     "updated_at": image["updated_at"]
  //                   };
  //                 })?.toList() ?? []
  //               }
  //             };
  //           })?.toList() ?? [],
  //           "user": item["user"],
  //           "active_booked_rooms": item["active_booked_rooms"]?.map((room) {
  //             return {
  //               "id": room["id"],
  //               "booking_id": room["booking_id"],
  //               "room_type_id": room["room_type_id"],
  //               "room_id": room["room_id"],
  //               "room_number": room["room_number"],
  //               "booked_for": room["booked_for"],
  //               "fare": room["fare"],
  //               "discount": room["discount"],
  //               "tax_charge": room["tax_charge"],
  //               "cancellation_fee": room["cancellation_fee"],
  //               "status": room["status"],
  //               "created_at": room["created_at"],
  //               "updated_at": room["updated_at"],
  //               "room": {
  //                 "id": room["room"]?["id"] ?? 0,
  //                 "room_number": room["room"]?["room_number"] ?? ""
  //               }
  //             };
  //           })?.toList() ?? [],
  //           "guest": item["guest"] != null ? {
  //             "id": item["guest"]["id"],
  //             "name": item["guest"]["name"],
  //             "mobile": item["guest"]["mobile"],
  //             "email": item["guest"]["email"],
  //             "address": item["guest"]["address"],
  //             "created_at": item["guest"]["created_at"],
  //             "updated_at": item["guest"]["updated_at"]
  //           } : null
  //         };
  //       }).toList());
  //
  //       print("All Booking --> ${bookings.value}");
  //     } else if (response.statusCode == 401) {
  //       GetStorage().erase();
  //       Get.offAllNamed("/bottomNav");
  //     }
  //   } catch (err) {
  //     print('Error: $err');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  // Future<void> filteredBookingInfo({required DateTime arvlDate, required DateTime deptDate}) async {
  //   try {
  //     isLoading.value = true;
  //     final String? token = box.read('access_token');
  //     // Format the dates to exclude the time component
  //     final String formattedArvlDate = DateFormat('yyyy-MM-dd').format(DateTime(arvlDate.year, arvlDate.month, arvlDate.day));
  //     final String formattedDeptDate = DateFormat('yyyy-MM-dd').format(DateTime(deptDate.year, deptDate.month, deptDate.day));
  //
  //     final url = '${allBooking}?date_to=$formattedArvlDate&date_from=$formattedDeptDate';
  //     print('URL: $url');
  //     final response = await http.get(
  //       Uri.parse(url),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //     print("----- BooFilteredking-----");
  //     print('Status Code ---> ${response.statusCode}');
  //
  //     if (response.statusCode == 200) {
  //       final responseBody = jsonDecode(response.body);
  //
  //       // Extract 'data' from the response with a null check
  //       var data = responseBody['bookings']?['data'] ?? [];
  //       print('Data = $data');
  //
  //       // Clear the current list
  //       bookingsInfo.clear();
  //
  //       // Add new items to the list with null checks and proper mapping
  //       bookingsInfo.addAll(data.map((item) {
  //         return {
  //           "id": item["id"],
  //           "owner_id": item["owner_id"],
  //           "booking_number": item["booking_number"],
  //           "user_id": item["user_id"],
  //           "guest_id": item["guest_id"],
  //           'time': item['checked_in_at'],
  //           "check_in": item["check_in"],
  //           "check_out": item["check_out"],
  //           "contact_info": {
  //             "name": item["contact_info"]?["name"] ?? "",
  //             "phone": item["contact_info"]?["phone"] ?? ""
  //           },
  //           "total_adult": item["total_adult"],
  //           "total_child": item["total_child"],
  //           "total_discount": item["total_discount"],
  //           "tax_charge": item["tax_charge"],
  //           "booking_fare": item["booking_fare"],
  //           "service_cost": item["service_cost"],
  //           "extra_charge": item["extra_charge"],
  //           "extra_charge_subtracted": item["extra_charge_subtracted"],
  //           "paid_amount": item["paid_amount"],
  //           "cancellation_fee": item["cancellation_fee"],
  //           "refunded_amount": item["refunded_amount"],
  //           "key_status": item["key_status"],
  //           "status": item["status"],
  //           "created_at": item["created_at"],
  //           "updated_at": item["updated_at"],
  //           "total_amount": item["total_amount"],
  //           "due_amount": item["due_amount"],
  //           "tax_percent": item["tax_percent"],
  //           "booked_rooms": item["booked_rooms"]?.map((room) {
  //             return {
  //               "id": room["id"],
  //               "booking_id": room["booking_id"],
  //               "room_type_id": room["room_type_id"],
  //               "room_id": room["room_id"],
  //               "room_number": room["room_number"],
  //               "booked_for": room["booked_for"],
  //               "fare": room["fare"],
  //               "discount": room["discount"],
  //               "tax_charge": room["tax_charge"],
  //               "cancellation_fee": room["cancellation_fee"],
  //               "status": room["status"],
  //               "created_at": room["created_at"],
  //               "updated_at": room["updated_at"],
  //               "room": {
  //                 "id": room["room"]?["id"] ?? 0,
  //                 "owner_id": room["room"]?["owner_id"] ?? 0,
  //                 "room_type_id": room["room"]?["room_type_id"] ?? 0,
  //                 "room_number": room["room"]?["room_number"] ?? "",
  //                 "status": room["room"]?["status"] ?? 0,
  //                 "created_at": room["room"]?["created_at"] ?? "",
  //                 "updated_at": room["room"]?["updated_at"] ?? ""
  //               },
  //               "room_type": {
  //                 "id": room["room_type"]?["id"] ?? 0,
  //                 "owner_id": room["room_type"]?["owner_id"] ?? 0,
  //                 "name": room["room_type"]?["name"] ?? "",
  //                 "total_adult": room["room_type"]?["total_adult"] ?? 0,
  //                 "total_child": room["room_type"]?["total_child"] ?? 0,
  //                 "fare": room["room_type"]?["fare"] ?? 0.0,
  //                 "discount_percentage": room["room_type"]?["discount_percentage"] ?? 0,
  //                 "keywords": room["room_type"]?["keywords"] ?? "",
  //                 "description": room["room_type"]?["description"] ?? "",
  //                 "beds": room["room_type"]?["beds"] ?? 0,
  //                 "cancellation_fee": room["room_type"]?["cancellation_fee"] ?? 0.0,
  //                 "cancellation_policy": room["room_type"]?["cancellation_policy"] ?? "",
  //                 "is_featured": room["room_type"]?["is_featured"] ?? false,
  //                 "status": room["room_type"]?["status"] ?? 0,
  //                 "created_at": room["room_type"]?["created_at"] ?? "",
  //                 "updated_at": room["room_type"]?["updated_at"] ?? "",
  //                 "image": room["room_type"]?["image"] ?? "",
  //                 "discounted_fare": room["room_type"]?["discounted_fare"] ?? 0.0,
  //                 "discount": room["room_type"]?["discount"] ?? 0.0,
  //                 "images": room["room_type"]?["images"]?.map((image) {
  //                   return {
  //                     "id": image["id"],
  //                     "room_type_id": image["room_type_id"],
  //                     "image": image["image"],
  //                     "created_at": image["created_at"],
  //                     "updated_at": image["updated_at"]
  //                   };
  //                 })?.toList() ?? []
  //               }
  //             };
  //           })?.toList() ?? [],
  //           "user": item["user"],
  //           "active_booked_rooms": item["active_booked_rooms"]?.map((room) {
  //             return {
  //               "id": room["id"],
  //               "booking_id": room["booking_id"],
  //               "room_type_id": room["room_type_id"],
  //               "room_id": room["room_id"],
  //               "room_number": room["room_number"],
  //               "booked_for": room["booked_for"],
  //               "fare": room["fare"],
  //               "discount": room["discount"],
  //               "tax_charge": room["tax_charge"],
  //               "cancellation_fee": room["cancellation_fee"],
  //               "status": room["status"],
  //               "created_at": room["created_at"],
  //               "updated_at": room["updated_at"],
  //               "room": {
  //                 "id": room["room"]?["id"] ?? 0,
  //                 "room_number": room["room"]?["room_number"] ?? ""
  //               }
  //             };
  //           })?.toList() ?? [],
  //           "guest": item["guest"] != null ? {
  //             "id": item["guest"]["id"],
  //             "name": item["guest"]["name"],
  //             "mobile": item["guest"]["mobile"],
  //             "email": item["guest"]["email"],
  //             "address": item["guest"]["address"],
  //             "created_at": item["guest"]["created_at"],
  //             "updated_at": item["guest"]["updated_at"]
  //           } : null
  //         };
  //       }).toList());
  //
  //       print("Filtered Booking --> ${bookingsInfo.value}");
  //     } else if (response.statusCode == 401) {
  //       GetStorage().erase();
  //       Get.offAllNamed("/bottomNav");
  //     }
  //   } catch (err) {
  //     print('Error: $err');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }




  Future<void> getInHouseBookingInfo() async {
    try {
      isLoading.value = true;
      final String? token = box.read('access_token');
      final response = await http.get(
        Uri.parse(allBooking),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print("-----In House Booking Info-----");
      print('Status Code ---> ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        // Extract 'data' from the response with a null check
        var data = responseBody['bookings']?['data'] ?? [];
        print('Data = $data');

        // Clear the current list
        inHouseBookings.clear();

        // Add new items to the list with null checks and proper mapping
        inHouseBookings.addAll(data.map((item) {
          return {
            "id": item["id"],
            "owner_id": item["owner_id"],
            "booking_number": item["booking_number"],
            "user_id": item["user_id"],
            "guest_id": item["guest_id"],
            'time': item['checked_in_at'],
            "check_in": item["check_in"],
            "check_out": item["check_out"],
            "contact_info": {
              "name": item["contact_info"]?["name"] ?? "",
              "phone": item["contact_info"]?["phone"] ?? ""
            },
            "total_adult": item["total_adult"],
            "total_child": item["total_child"],
            "total_discount": item["total_discount"],
            "tax_charge": item["tax_charge"],
            "booking_fare": item["booking_fare"],
            "service_cost": item["service_cost"],
            "extra_charge": item["extra_charge"],
            "extra_charge_subtracted": item["extra_charge_subtracted"],
            "paid_amount": item["paid_amount"],
            "cancellation_fee": item["cancellation_fee"],
            "refunded_amount": item["refunded_amount"],
            "key_status": item["key_status"],
            "status": item["status"],
            "created_at": item["created_at"],
            "updated_at": item["updated_at"],
            "total_amount": item["total_amount"],
            "due_amount": item["due_amount"],
            "tax_percent": item["tax_percent"],
            "booked_rooms": item["booked_rooms"]?.map((room) {
              return {
                "id": room["id"],
                "booking_id": room["booking_id"],
                "room_type_id": room["room_type_id"],
                "room_id": room["room_id"],
                "room_number": room["room_number"],
                "booked_for": room["booked_for"],
                "fare": room["fare"],
                "discount": room["discount"],
                "tax_charge": room["tax_charge"],
                "cancellation_fee": room["cancellation_fee"],
                "status": room["status"],
                "created_at": room["created_at"],
                "updated_at": room["updated_at"],
                "room": {
                  "id": room["room"]?["id"] ?? 0,
                  "owner_id": room["room"]?["owner_id"] ?? 0,
                  "room_type_id": room["room"]?["room_type_id"] ?? 0,
                  "room_number": room["room"]?["room_number"] ?? "",
                  "status": room["room"]?["status"] ?? 0,
                  "created_at": room["room"]?["created_at"] ?? "",
                  "updated_at": room["room"]?["updated_at"] ?? ""
                },
                "room_type": {
                  "id": room["room_type"]?["id"] ?? 0,
                  "owner_id": room["room_type"]?["owner_id"] ?? 0,
                  "name": room["room_type"]?["name"] ?? "",
                  "total_adult": room["room_type"]?["total_adult"] ?? 0,
                  "total_child": room["room_type"]?["total_child"] ?? 0,
                  "fare": room["room_type"]?["fare"] ?? 0.0,
                  "discount_percentage": room["room_type"]?["discount_percentage"] ?? 0,
                  "keywords": room["room_type"]?["keywords"] ?? "",
                  "description": room["room_type"]?["description"] ?? "",
                  "beds": room["room_type"]?["beds"] ?? 0,
                  "cancellation_fee": room["room_type"]?["cancellation_fee"] ?? 0.0,
                  "cancellation_policy": room["room_type"]?["cancellation_policy"] ?? "",
                  "is_featured": room["room_type"]?["is_featured"] ?? false,
                  "status": room["room_type"]?["status"] ?? 0,
                  "created_at": room["room_type"]?["created_at"] ?? "",
                  "updated_at": room["room_type"]?["updated_at"] ?? "",
                  "image": room["room_type"]?["image"] ?? "",
                  "discounted_fare": room["room_type"]?["discounted_fare"] ?? 0.0,
                  "discount": room["room_type"]?["discount"] ?? 0.0,
                  "images": room["room_type"]?["images"]?.map((image) {
                    return {
                      "id": image["id"],
                      "room_type_id": image["room_type_id"],
                      "image": image["image"],
                      "created_at": image["created_at"],
                      "updated_at": image["updated_at"]
                    };
                  })?.toList() ?? []
                }
              };
            })?.toList() ?? [],
            "user": item["user"],
            "active_booked_rooms": item["active_booked_rooms"]?.map((room) {
              return {
                "id": room["id"],
                "booking_id": room["booking_id"],
                "room_type_id": room["room_type_id"],
                "room_id": room["room_id"],
                "room_number": room["room_number"],
                "booked_for": room["booked_for"],
                "fare": room["fare"],
                "discount": room["discount"],
                "tax_charge": room["tax_charge"],
                "cancellation_fee": room["cancellation_fee"],
                "status": room["status"],
                "created_at": room["created_at"],
                "updated_at": room["updated_at"],
                "room": {
                  "id": room["room"]?["id"] ?? 0,
                  "room_number": room["room"]?["room_number"] ?? ""
                }
              };
            })?.toList() ?? [],
            "guest": item["guest"] != null ? {
              "id": item["guest"]["id"],
              "name": item["guest"]["name"],
              "mobile": item["guest"]["mobile"],
              "email": item["guest"]["email"],
              "address": item["guest"]["address"],
              "created_at": item["guest"]["created_at"],
              "updated_at": item["guest"]["updated_at"]
            } : null
          };
        }).toList());

        print("In House Booking Info --> ${inHouseBookings.value}");
      } else if (response.statusCode == 401) {
        GetStorage().erase();
        Get.offAllNamed("/bottomNav");
      }
    } catch (err) {
      print('Error: $err');
    } finally {
      isLoading.value = false;
    }
  }
}
