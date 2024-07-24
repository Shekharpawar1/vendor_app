import 'dart:convert';
import 'dart:js_interop_unsafe';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/utils/helper/api_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/helper/styles.dart';
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
  RxList<dynamic> generalInfo = <dynamic>[].obs;

  Future<void> getInfo() async {
    try {
      isLoading.value = true;
      final String? token = box.read('access_token');
      final url = '${bookingDetail}';
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

        var data = responseBody['data']['booking'];

        // Clear previous data
        generalInfo.clear();

        // Add mapped data to generalInfo
        generalInfo.add({
          'id': data['id'],
          'booking_number': data['booking_number'],
          'check_in': data['check_in'],
          'check_out': data['check_out'],
          'contact_info': {
            'name': data['contact_info']['name'],
            'phone': data['contact_info']['phone'],
          },
          'total_adult': data['total_adult'],
          'total_child': data['total_child'],
          'total_discount': data['total_discount'],
          'tax_charge': data['tax_charge'],
          'booking_fare': data['booking_fare'],
          'service_cost': data['service_cost'],
          'extra_charge': data['extra_charge'],
          'paid_amount': data['paid_amount'],
          'cancellation_fee': data['cancellation_fee'],
          'refunded_amount': data['refunded_amount'],
          'key_status': data['key_status'],
          'status': data['status'],
          'checked_in_at': data['checked_in_at'],
          'checked_out_at': data['checked_out_at'],
          'created_at': data['created_at'],
          'updated_at': data['updated_at'],
          'total_amount': data['total_amount'],
          'due_amount': data['due_amount'],
          'tax_percent': data['tax_percent'],
          'used_extra_service': data['used_extra_service'],
          'payments': data['payments'],
          'booked_rooms': data['booked_rooms'],
        });
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
