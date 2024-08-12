import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/utils/helper/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/helper/styles.dart';
import '../model/booking_detail_model.dart';
class CommonAppBar2Controller extends GetxController {

  /// General Info Part
  var selectedIndex = 0.obs; // Initialize with index 0 (Food Charges)
  TextEditingController dateController = TextEditingController();

  // Observable variables for arrival and departure dates
  var arrivalDate = DateTime.now().obs;
  var departureDate = (DateTime.now().add(Duration(days: 1))).obs;

  CommonAppBar2Controller(String id){
    bookingId.value = id;
  }

  @override
  void onInit() {
    super.onInit();
    getInfo();
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

  String get total => '\$31,750';
  TextEditingController ResController=TextEditingController();
  TextEditingController DateController=TextEditingController();
  TextEditingController FolioController=TextEditingController();
  TextEditingController MasterTypeController=TextEditingController();
  TextEditingController MasterController=TextEditingController();
  TextEditingController AmountController=TextEditingController();
  TextEditingController commentController=TextEditingController();
  TextEditingController QuantityController=TextEditingController();
  TextEditingController DiscountController=TextEditingController();
  TextEditingController TaxInclusiveController=TextEditingController();

  showPaymentModal(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return PaymentModal(
          resController: ResController,
          dateController: DateController,
          folioController: FolioController,
          masterTypeController: MasterTypeController,
          masterController: MasterController,
          amountController: AmountController,
          commentController: commentController, Formkey: Formkey,
        );
      },
    );
  }
  final FormKey3=GlobalKey<FormState>();
  showExtraChargeModal(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return ExtraChargesModal(
          resController: ResController,
          dateController: DateController,
          folioController: FolioController,
          masterTypeController: MasterTypeController,
          quantityController:QuantityController,
          DiscountController:DiscountController,
          TaxInclusiveController:TaxInclusiveController,
          masterController: MasterController,
          amountController: AmountController,
          commentController: commentController, Formkey: FormKey3,
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
  var bookingId = ''.obs; // Observable variable
  RxList generalInfo = [].obs;
  RxList bookedRoomInfo = [].obs;
  RxList roomTypeInfo = [].obs;
  RxList paymentInfo =[].obs;

  Future<void> getInfo() async {
    try {
      isLoading.value = true;
      final String? token = box.read('access_token');
      print('controller id  ---${bookingId.value}');
      // final String? id = box.read('user_id');
      final url = '${bookingDetail}/${bookingId.value}';
      print("URL: $url");

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print('Status Code ---> ${response.statusCode}');
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final booking = Booking.fromJson(responseBody);

        // Clear previous data
        generalInfo.clear();
        bookedRoomInfo.clear();
        paymentInfo.clear();

        // Add new data from the parsed Booking model
        generalInfo.value.add(booking.data.booking.toJson());

        // Handle dynamic date keys and ensure it's a list
        List<dynamic> roomList = [];
        booking.data.bookedRooms.roomsByDate.forEach((dateKey, rooms) {
          roomList.addAll(rooms.map((room) => room.toJson()));
        });

        // Assign the room list to bookedRoomInfo
        bookedRoomInfo.value = roomList;

        paymentInfo.value.add(booking.data.paymentInfo.toJson());


        print("General Info --> ${generalInfo}");
        print("Booked Room Info --> ${bookedRoomInfo}");
        print("Payment Info --> ${paymentInfo}");
      } else if (response.statusCode == 401) {
        GetStorage().erase();
        Get.offAllNamed("/bottomNav");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }



// Future<void> getInfo() async {
  //   try {
  //     isLoading.value = true;
  //     final String? token = box.read('access_token');
  //     final String? id = box.read('user_id');
  //     final url = '${bookingDetail}/$id';
  //     print("URL: $url");
  //
  //     final response = await http.get(
  //       Uri.parse(url),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //
  //     print('Status Code ---> ${response.statusCode}');
  //     if (response.statusCode == 200) {
  //       final responseBody = jsonDecode(response.body);
  //       var data = responseBody['data'] ?? {};
  //       print('Data = ${data}');
  //
  //       // Clear previous data
  //       generalInfo.clear();
  //       bookedRoomInfo.clear();
  //       paymentInfo.clear();
  //
  //       // Extract booking data
  //       var booking = data['booking'] ?? {};
  //
  //       // Map general booking data safely
  //       var mappedBooking = {
  //         'id': booking['id'] ?? 'N/A',
  //         'booking_number': booking['booking_number'] ?? 'N/A',
  //         'check_in': booking['check_in'] ?? 'N/A',
  //         'check_out': booking['check_out'] ?? 'N/A',
  //         'contact_info': {
  //           'name': booking['contact_info']?['name'] ?? 'N/A',
  //           'phone': booking['contact_info']?['phone'] ?? 'N/A',
  //         },
  //         'total_adult': booking['total_adult'] ?? 0,
  //         'total_child': booking['total_child'] ?? 0,
  //         'total_discount': booking['total_discount'] ?? '0.0',
  //         'tax_charge': booking['tax_charge'] ?? '0.0',
  //         'booking_fare': booking['booking_fare'] ?? '0.0',
  //         'service_cost': booking['service_cost'] ?? '0.0',
  //         'extra_charge': booking['extra_charge'] ?? '0.0',
  //         'paid_amount': booking['paid_amount'] ?? '0.0',
  //         'total_amount': booking['total_amount'] ?? 0,
  //         'due_amount': booking['due_amount'] ?? 0,
  //         'tax_percent': booking['tax_percent'] ?? 0,
  //         'cancellation_fee': booking['cancellation_fee'] ?? '0.0',
  //         'refunded_amount': booking['refunded_amount'] ?? '0.0',
  //       };
  //
  //       generalInfo.value.add(mappedBooking);
  //
  //       // Map booked rooms data
  //       var bookedRooms = booking['booked_rooms'] ?? [];
  //       if (bookedRooms.isNotEmpty) {
  //         bookedRoomInfo.addAll(bookedRooms.map((room) {
  //           return {
  //             'id': room['id'] ?? 'N/A',
  //             'booking_id': room['booking_id'] ?? 'N/A',
  //             'room_type_id': room['room_type_id'] ?? 'N/A',
  //             'room_id': room['room_id'] ?? 'N/A',
  //             'room_number': room['room_number'] ?? 'N/A',
  //             'booked_for': room['booked_for'] ?? 'N/A',
  //             'fare': room['fare'] ?? '0.0',
  //             'discount': room['discount'] ?? '0.0',
  //             'tax_charge': room['tax_charge'] ?? '0.0',
  //             'cancellation_fee': room['cancellation_fee'] ?? '0.0',
  //             'status': room['status'] ?? 'N/A',
  //             'room': room['room'] != null ? (room['room'] as List).map((roomInfo) {
  //               return {
  //                 'id': roomInfo['id'] ?? 'N/A',
  //                 'owner_id': roomInfo['owner_id'] ?? 'N/A',
  //                 'room_type_id': roomInfo['room_type_id'] ?? 'N/A',
  //                 'room_number': roomInfo['room_number'] ?? 'N/A',
  //                 'status': roomInfo['status'] ?? 'N/A',
  //               };
  //             }).toList() : [],
  //           };
  //         }).toList());
  //
  //         // Now correctly map room type information if available
  //         roomTypeInfo.addAll(data['bookedRooms']['room_type'].map((roomType) {
  //           if (roomType != null) {
  //             return {
  //               'name': roomType['name'] ?? 'N/A',
  //               'image': roomType['image'] ?? '',
  //               'discounted_fare': roomType['discounted_fare'] ?? 0,
  //               'discount': roomType['discount'] ?? 0,
  //             };
  //           }
  //         }).toList());
  //       }
  //
  //
  //
  //       // Extract payment info safely
  //       var paymentInfoData = data['paymentInfo'] ?? {};
  //       paymentInfo.value.add({
  //         'subtotal': paymentInfoData['subtotal'] ?? 0,
  //         'total_amount': paymentInfoData['total_amount'] ?? 0,
  //         'canceled_fare': paymentInfoData['canceled_fare'] ?? 0,
  //         'canceled_tax_charge': paymentInfoData['canceled_tax_charge'] ?? 0,
  //         'payment_received': paymentInfoData['payment_received'] ?? 0,
  //         'refunded': paymentInfoData['refunded'] ?? 0,
  //       });
  //
  //       print("General Info --> ${generalInfo}");
  //       print("Booked Room Info --> ${bookedRoomInfo}");
  //       print("RoomType Info --> ${roomTypeInfo}");
  //       print("Payment Info --> ${paymentInfo}");
  //     } else if (response.statusCode == 401) {
  //       GetStorage().erase();
  //       Get.offAllNamed("/bottomNav");
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }




}


class GuestInfoRow extends StatelessWidget {
  final String label;
  final TextEditingController TextController;


  GuestInfoRow({
    required this.label,
    required this.TextController,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$label :"),
        // if (_needsCustomHandler(label))
        //   Expanded(
        //     child: _buildCustomField(context),
        //   )
        // else
          Expanded(
            child: TextField(
              controller: TextController,
              decoration: InputDecoration(
                hintText: 'Enter $label',
                hintStyle: Text7,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
          ),
      ],
    );
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
class PaymentModal extends StatelessWidget {
  final TextEditingController resController;
  final TextEditingController dateController;
  final TextEditingController folioController;
  final TextEditingController masterTypeController;
  final TextEditingController masterController;
  final TextEditingController amountController;
  final TextEditingController commentController;
  final Formkey;

  const PaymentModal({
    Key? key,
    required this.resController,
    required this.dateController,
    required this.folioController,
    required this.masterTypeController,
    required this.masterController,
    required this.amountController,
    required this.commentController,
    required this.Formkey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GuestInfoRow(label: 'Res / Vou no.', TextController: resController),
                    const SizedBox(height: 8.0),
                    GuestInfoRow(label: 'Date', TextController: dateController),
                    SizedBox(height: 8.0),
                    GuestInfoRow(label: 'Folio', TextController: folioController),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GuestInfoRow(label: 'Master Type', TextController: masterTypeController),
                    SizedBox(height: 8.0),
                    GuestInfoRow(label: 'Master', TextController: masterController),
                    SizedBox(height: 16.0),
                    GuestInfoRow(label: 'Amount', TextController: amountController),
                  ],
                ),
              ),
              TextField(
                controller: commentController,
                maxLines: null, // Allows for multiline input
                decoration: InputDecoration(
                  hintText: 'Enter your comment here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ],
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
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            if (Formkey.currentState!.validate()) {
              Formkey.currentState?.dispose();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Processing Data')),
              );
              Navigator.pop(context); // Remove modal after processing
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
class ExtraChargesModal extends StatelessWidget {
  final TextEditingController resController;
  final TextEditingController dateController;
  final TextEditingController folioController;
  final TextEditingController masterTypeController;
  final TextEditingController masterController;
  final TextEditingController amountController;
  final TextEditingController commentController;
  final TextEditingController quantityController;
  final TextEditingController DiscountController;
  final TextEditingController TaxInclusiveController;
  final Formkey;

  const ExtraChargesModal({
    Key? key,
    required this.resController,
    required this.dateController,
    required this.folioController,
    required this.masterTypeController,
    required this.masterController,
    required this.amountController,
    required this.commentController,
    required this.Formkey, required this.quantityController, required this.DiscountController, required this.TaxInclusiveController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GuestInfoRow(label: 'Res / Vou no.', TextController: resController),
                    const SizedBox(height: 8.0),
                    GuestInfoRow(label: 'Date', TextController: dateController),
                    SizedBox(height: 8.0),
                    GuestInfoRow(label: 'Folio', TextController: folioController),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GuestInfoRow(label: 'Master Type', TextController: masterTypeController),
                    SizedBox(height: 8.0),
                    GuestInfoRow(label: 'Master', TextController: masterController),
                    SizedBox(height: 16.0),
                    GuestInfoRow(label: 'Qty', TextController: quantityController),
                    SizedBox(height: 16.0),
                    GuestInfoRow(label: 'Discount', TextController: DiscountController),
                    SizedBox(height: 16.0),
                    GuestInfoRow(label: 'Amount', TextController: amountController),
                    SizedBox(height: 16.0),
                    GuestInfoRow(label: 'Tax', TextController: TaxInclusiveController),
                  ],
                ),
              ),
              TextField(
                controller: commentController,
                maxLines: null, // Allows for multiline input
                decoration: InputDecoration(
                  hintText: 'Enter your comment here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ],
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
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            if (Formkey.currentState!.validate()) {
              Formkey.currentState?.dispose();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Processing Data')),
              );
              Navigator.pop(context); // Remove modal after processing
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
