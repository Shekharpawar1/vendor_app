import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/commonappbar2controller.dart';
import '../../../utils/helper/colors.dart';
import '../../../utils/helper/styles.dart';
import '../../../CommonWidgets/view/commonBtn.dart';
import 'charges.dart';

Widget buildGeneralInfo(BuildContext context, CommonAppBar2Controller controller) {
  return SingleChildScrollView(
    child:Obx((){
      if (controller.isLoading.value) {
        return Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(color: primaryColor),
        );
      }


      final data = controller.generalInfo.isNotEmpty ? controller.generalInfo[0] : {};
      final room = controller.bookedRoomInfo.isNotEmpty ? controller.bookedRoomInfo[0] : {};
      final payment = controller.paymentInfo.isNotEmpty ? controller.paymentInfo[0] : {};
      final checkInDate = data['check_in'] != null ? DateTime.parse(data['check_in']) : DateTime.now();
      final checkOutDate = data['check_out'] != null ? DateTime.parse(data['check_out']) : DateTime.now();
      final differenceInDays = checkOutDate.difference(checkInDate).inDays;

      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data['booking_number']?.toString() ?? 'N/A', // Ensure booking_number is a String
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Id # : ${data['id'] != null ? data['id'].toString() : 'N/A'}',
                  // 'Id # : ${data['id']?.toString() ?? 'N/A'}',// Ensure id is a String
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.earthAmericas,
                      color: Colors.black45,
                      size: 18.0,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Email',
                      style: Text10,
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Unconfirmed Reservation',
                      style: Text11,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Arrival date
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Arrival', style: Text12),
                              SizedBox(height: 5),
                              InkWell(
                                onTap: () => controller.selectDate(context, true),
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: DateFormat('d').format(checkInDate),
                                        style: TextStyle(
                                          color: Colors.purpleAccent.withOpacity(0.7),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 25,
                                        ),
                                      ),
                                      TextSpan(
                                        text: DateFormat(' MMM yyyy').format(checkInDate),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Nights
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Nights', style: Text12),
                              SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.purpleAccent.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  '$differenceInDays',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Departure date
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Departure', style: Text12),
                              SizedBox(height: 5),
                              InkWell(
                                onTap: () => controller.selectDate(context, false),
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: DateFormat('d').format(checkOutDate),
                                        style: TextStyle(
                                          color: Colors.purpleAccent.withOpacity(0.7),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 25,
                                        ),
                                      ),
                                      TextSpan(
                                        text: DateFormat(' MMM yyyy').format(checkOutDate),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 2),
                        Text(
                          '${room['room_type']?['name'] ?? 'N/A'}  |  ${room['room_number'] ?? 'N/A'}',
                        )

                      ],
                    ),
                  ),

                  SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Rate Type',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  ':',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                 'Elite Room',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),

                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Avg Daily Rate',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  ':',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Rs. ${double.parse(room['fare'] ?? '0.00').toStringAsFixed(2)}',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),

                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 4),
                    child: Text(
                      'SUMMARY',
                      style: Text4,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Total Charges',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                ':',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Rs. ${double.parse(payment['subtotal']?.toString() ?? '0.00').toStringAsFixed(2)}',

                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Total Credits',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                ':',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                               'Rs. 0.0',

                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Balance',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                ':',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Rs. ${double.parse(payment['subtotal']?.toString() ?? '0.00').toStringAsFixed(2)}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Colors.purpleAccent.withOpacity(0.7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Padding(
                        padding: EdgeInsets.only(top: 12, bottom: 4),
                        child: Text(
                          'DETAILS',
                          style: Text4,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          controller.isExpanded.value
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          controller.isExpanded.value = !controller.isExpanded.value;
                        },
                      ),
                    ],
                  ),

                  controller.isExpanded.value
                      ? Column(
                    children: [
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Room Charges',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    ':',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Rs. ${double.parse(data['booking_fare']?.toString() ?? '0.00').toStringAsFixed(2)}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Discount',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    ':',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Rs. ${double.parse(data['total_discount']?.toString() ?? '0.00').toStringAsFixed(2)}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Tax',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    ':',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Rs. ${double.parse(data['tax_charge']?.toString() ?? '0.00').toStringAsFixed(2)}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Extra Charges',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    ':',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Rs. ${double.parse(data['extra_charge']?.toString() ?? '0.00').toStringAsFixed(2)}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Unposted Inclusion Rate',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    ':',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Rs. 0.00',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Balance Transfer',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    ':',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '0.00',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Amount Paid',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    ':',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Rs. ${double.parse(data['paid_amount']?.toString() ?? '0.00').toStringAsFixed(2)}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Round Off',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    ':',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Rs. ${double.parse(data['booking_fare']?.toString() ?? '0.00').toStringAsFixed(2)}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Total',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    ':',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Rs. ${double.parse(payment['total_amount']?.toString() ?? '0.00').toStringAsFixed(2)}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Colors.purpleAccent.withOpacity(0.7),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  )
                      : SizedBox.shrink(),
                ],
              ),
            ),

          ],
        ),
      );
    })
  );
}

Widget buildGuestInfo(BuildContext context, CommonAppBar2Controller controller) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Obx(() {
      // Display a loading indicator if data is loading
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        );
      }

      final data = controller.generalInfo.isNotEmpty ? controller.generalInfo[0] : {};
      final guest = data['guest'] ?? {};
      final checkInDate = data['check_in'] != null ? DateTime.parse(data['check_in']) : DateTime.now();
      final checkOutDate = data['check_out'] != null ? DateTime.parse(data['check_out']) : DateTime.now();
      final differenceInDays = checkOutDate.difference(checkInDate).inDays;

      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 4),
                    child: Text(
                      'Guest Information',
                      style: Text4,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Phone No:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    (data != null && data['contact_info'] != null && data['contact_info']['phone'] != null)
                                        ? data['contact_info']['phone']
                                        : '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.mobileAlt,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Mobile No:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    guest['mobile'] ?? '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.email,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Email Id:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    data['guest']?['email'] ?? '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.fax,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Fax No:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 4),
                    child: Text(
                      'Identity Information',
                      style: Text4,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.visibility,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Identity No:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.visibility,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Identity Type:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.av_timer,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Expairy Date:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.calendarDay,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Date of Birth:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.flag,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Nationality:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Dominance Republic',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 4),
                    child: Text(
                      'Transport Information',
                      style: Text4,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Pick up:',
                              style: Text9,
                            ),
                            SizedBox(width: 115),
                            Text(
                              'Drop off:',
                              style: Text9,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.planeArrival,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Arrival By:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.planeDeparture,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Departure By:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.bus,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Vehicle:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.bus,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Vehicle:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.calendarDay,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Date:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.calendarDay,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Date:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.clock,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Time:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.clock,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Time:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 4),
                    child: Text(
                      'Other Information',
                      style: Text4,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.clock,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Arrival:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: DateFormat('d MMM yyyy').format(checkInDate),
                                          style:Text10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.clock,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Departure:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: DateFormat('d MMM yyyy').format(checkOutDate),
                                          style:Text10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.clock,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Cancellation Date:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.userFriends,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Pax:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '2/0',
                                    style: Text10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.indianRupeeSign,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Rate Type:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.bookBookmark,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Reservation Type:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Quotation',
                                    style: Text10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.locationPinLock,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Buisness Source:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Email',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.cloud,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Market:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.dashcube,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Company:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.person,
                                        color: Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Travel Agent:',
                                        style: Text15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '',
                                    style: Text10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }),
  );
}

Widget buildRoomChargesInfo(BuildContext context, CommonAppBar2Controller controller) {
  final data = controller.generalInfo.isNotEmpty ? controller.generalInfo[0] : {};
  final room = controller.bookedRoomInfo.isNotEmpty ? controller.bookedRoomInfo[0] : {};
  final payment = controller.paymentInfo.isNotEmpty ? controller.paymentInfo[0] : {};
  final DateFormat formatter = DateFormat('EEEE, d MMM, yyyy'); // Example format: Friday, Aug 9, 2024

  final checkInDate = data['check_in'] != null
      ? DateTime.parse(data['check_in'])
      : DateTime.now();
  final checkOutDate = data['check_out'] != null
      ? DateTime.parse(data['check_out'])
      : DateTime.now();

  final checkInFormatted = formatter.format(checkInDate); // Includes day name
  final checkOutFormatted = formatter.format(checkOutDate); // Includes day name

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Obx((){
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        );
      }
      return ListView.builder(
        itemCount: controller.bookedRoomInfo.length,
        itemBuilder: (context, index) {
          final room = controller.bookedRoomInfo[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 4),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: DateFormat('d MMM yyyy, EEEE').format(checkInDate),
                            style: Text4,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Room No:', style: Text15),
                                  SizedBox(height: 3),
                                  Text(room['room_number'] ?? 'N/A', style: Text13),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Rate Type', style: Text15),
                                  SizedBox(height: 3),
                                  Text(room['room_type']?['name'] ?? 'N/A', style: Text13),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('PAX', style: Text15),
                                  SizedBox(height: 3),
                                  Text(room['pax'] ?? 'N/A', style: Text13),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Child Age', style: Text15),
                                  SizedBox(height: 3),
                                  Text(room['child_age'] ?? 'N/A', style: Text13),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Room Charges', style: Text15),
                                  SizedBox(height: 3),
                                  Text(
                                    (room['fare'] != null
                                        ? (room['fare'] is num ? (room['fare'] as num).toDouble() : double.tryParse(room['fare'].toString()) ?? 0.0)
                                        : 0.0).toStringAsFixed(2),
                                    style: Text13,
                                  )

                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Discount', style: Text15),
                                  SizedBox(height: 3),
                                  Text(
                                    (room['discount'] != null
                                        ? (room['discount'] is num ? (room['discount'] as num).toDouble() : double.tryParse(room['discount'].toString()) ?? 0.0)
                                        : 0.0).toStringAsFixed(2),
                                    style: Text13,
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Tax', style: Text15),
                                  SizedBox(height: 3),
                                  Text(
                                    (room['tax_charge'] != null
                                        ? (room['tax_charge'] is num ? (room['tax_charge'] as num).toDouble() : double.tryParse(room['tax_charge'].toString()) ?? 0.0)
                                        : 0.0).toStringAsFixed(2),
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Adjustment', style: Text15),
                                  SizedBox(height: 3),
                                  Text(room['adjustment']?.toString() ?? '-', style: Text13),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Net Amount', style: Text15),
                                  SizedBox(height: 3),
                                  Text(
                                    (payment['subtotal'] != null
                                        ? (payment['subtotal'] is num ? (payment['subtotal'] as num).toDouble() : double.tryParse(payment['subtotal'].toString()) ?? 0.0)
                                        : 0.0).toStringAsFixed(2),
                                    style: Text13,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    })
  );
}

Widget buildFolioDetails(BuildContext context, CommonAppBar2Controller controller) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(12.0),
    child: Obx(() {
      // Display a loading indicator if data is loading
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        );
      }

      // Ensure that data is available before accessing it
      if (controller.generalInfo.isEmpty || controller.bookedRoomInfo.isEmpty || controller.paymentInfo.isEmpty) {
        return Center(
          child: Text('No data available', style: Text2),
        );
      }

      final data = controller.generalInfo[0];
      final room = controller.bookedRoomInfo[0];
      final payment = controller.paymentInfo[0];
      final checkInDate = data['check_in'] != null ? DateTime.parse(data['check_in']) : DateTime.now();
      final checkOutDate = data['check_out'] != null ? DateTime.parse(data['check_out']) : DateTime.now();
      final differenceInDays = checkOutDate.difference(checkInDate).inDays;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Folio # : ${data['id']?.toString() ?? 'N/A'} - ${data['contact_info']?['name'] ?? ''}',
                style: Text2,
              ),
              CommonButton(
                title: 'PRINT',
                onPressed: () {controller.getAuditTrailInfo();},
                height: 35,
                width: 30,
                color: Colors.purple.withOpacity(0.7),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('UnPosted Inclusion'),
              SizedBox(width: 8),
              Text(
                '||',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Text('Posted Inclusion'),
            ],
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Day Use Charges',
                        style: Text2,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.calendarDay,
                            color: Colors.grey,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text('20-03-20'),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ 25,000',
                            style: Text9,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text('mohammandmonoco@gmail.com'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VAT 15%',
                        style: Text2,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.calendarDay,
                            color: Colors.grey,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text('20-03-20'),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ 3,750',
                            style: Text9,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text('mohammandmonoco@gmail.com'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Electricity Fee',
                            style: Text2,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.calendarDay,
                                color: Colors.grey,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Text('20-03-20'),
                            ],
                          ),
                        ],
                      ),
                      CommonButton(
                          title: 'PRINT',
                          onPressed: (){},
                          height:35,
                          width: 45,
                          color: Colors.purpleAccent.withOpacity(0.7)
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ 0',
                            style: Text9,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text('mohammandmonoco@gmail.com'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Electricity Fee',
                            style: Text2,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.calendarDay,
                                color: Colors.grey,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Text('20-03-21'),
                            ],
                          ),
                        ],
                      ),
                      CommonButton(
                          title: 'PRINT',
                          onPressed: (){},
                          height:35,
                          width: 45,
                          color: Colors.purpleAccent.withOpacity(0.7)
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ 0',
                            style: Text9,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text('mohammandmonoco@gmail.com'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Water Fee',
                            style: Text2,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.calendarDay,
                                color: Colors.grey,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Text('20-03-20'),
                            ],
                          ),
                        ],
                      ),
                      CommonButton(
                          title: 'PRINT',
                          onPressed: (){},
                          height:35,
                          width: 45,
                          color: Colors.purpleAccent.withOpacity(0.7)
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ 0',
                            style: Text9,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text('mohammandmonoco@gmail.com'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Water Fee',
                            style: Text2,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.calendarDay,
                                color: Colors.grey,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Text('20-03-21'),
                            ],
                          ),
                        ],
                      ),
                      CommonButton(
                          title: 'PRINT',
                          onPressed: (){},
                          height:35,
                          width: 45,
                          color: Colors.purpleAccent.withOpacity(0.7)
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ 0',
                            style: Text9,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text('mohammandmonoco@gmail.com'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Room Services',
                                style: Text2,
                              ),
                              SizedBox(width: 20),
                              Row(
                                children: [
                                  Text('Ref. No:', style: Text2),
                                  Text('87'),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.calendarDay,
                                color: Colors.grey,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Text('20-03-20'),
                            ],
                          ),
                        ],
                      ),

                      CommonButton(
                          title: 'PRINT',
                          onPressed: (){},
                          height:35,
                          width: 45,
                          color: Colors.purpleAccent.withOpacity(0.7)
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ 3,000',
                            style: Text9,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text('m345999@gmail.com'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }),
  );
}

Widget buildAudioTrail(BuildContext context, CommonAppBar2Controller controller) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }


      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.auditTrailList.length,
        itemBuilder: (context, index) {
          final data = controller.auditTrailList.isNotEmpty ? controller.auditTrailList[index] : null;
          if (data == null) {
            return SizedBox.shrink();
          }

          return Container(
            margin: EdgeInsets.only(bottom: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.remark.replaceAll('_', ' ').replaceFirst(data.remark[0], data.remark[0].toUpperCase()),
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 10),
                      data.details != null && data.details!.isNotEmpty
                          ? Row(
                        children: [
                          Expanded(
                            child: Text(
                              data.details!,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      )
                          : SizedBox.shrink(),

                      if (data.details != null && data.details!.contains('Tax')) // Add condition for Taxes
                        Row(
                          children: [
                            SizedBox(height: 10),
                            Icon(
                              Icons.attach_money,
                              size: 20,
                              color: Colors.green,
                            ),
                            SizedBox(width: 5),
                            Text('Taxes Applied'),
                          ],
                        ),


                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 20,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 5),
                          Text(data.actionBy.email),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                size: 15,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text(data.createdAt, style: Text16,),
                            ],
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.paperPlane,
                                size: 18,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text('192.168.29.199', style: Text16,),
                            ],
                          ),


                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }),
  );
}

Widget buildAddRemark(BuildContext context,CommonAppBar2Controller controller){

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap:()
  {

    controller.showAlertBox(context);
  },
            child: Container(
              height:60,
                decoration: boxDecoration1,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Add Remark",style:Text13),
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("+",style:Text13)
              )])
            ),
          ),
          SizedBox(height: 30),
          ListView.builder(itemBuilder:(BuildContext context,int index){
            return Container(
              decoration: boxDecoration1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 4),
                    child: Text(
                      '03/21/2024 Thu',
                      style: Text4,
                    ),
                  ),
                  Divider(),
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Room No:',
                                      style: Text15,
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'Du01',
                                      style: Text13,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rate Type',
                                      style: Text15,
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'Elite Room',
                                      style: Text13,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PAX',
                                      style: Text15,
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      '2/0',
                                      style: Text13,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Child Age',
                                      style: Text15,
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      '-',
                                      style: Text13,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Room Charges',
                                      style: Text15,
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      '-0',
                                      style: Text13,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Discount',
                                      style: Text15,
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      '-0',
                                      style: Text13,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tax',
                                      style: Text15,
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      '-0',
                                      style: Text13,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Adjustment',
                                      style: Text15,
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      '-0',
                                      style: Text13,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Net Amount',
                                      style: Text15,
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      '-0',
                                      style: Text13,
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ],
                      )
                  ),
                ],
              ),
            );
          },itemCount:1,
          ),
          SizedBox(height: 30),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   child: Column(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(top: 12, bottom: 4),
          //         child: Text(
          //           'Transport Information',
          //           style: Text4,
          //         ),
          //       ),
          //       Divider(),
          //       Padding(
          //         padding: const EdgeInsets.all(12.0),
          //         child: Column(
          //           children: [
          //             Row(
          //               children: [
          //                 Text(
          //                   'Pick up:',
          //                   style: Text9,
          //                 ),
          //                 SizedBox(width: 115),
          //                 Text(
          //                   'Drop off:',
          //                   style: Text9,
          //                 ),
          //               ],
          //             ),
          //             SizedBox(height: 10),
          //             Row(
          //               children: [
          //                 Expanded(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Row(
          //                         children: [
          //                           Icon(
          //                             Icons.av_timer,
          //                             size: 20,
          //                             color: Colors.grey,
          //                           ),
          //                           SizedBox(width: 5),
          //                           Text(
          //                             'Expairy Date:',
          //                             style: Text15,
          //                           ),
          //                         ],
          //                       ),
          //                       SizedBox(height: 3),
          //                       Text(
          //                         '',
          //                         style: Text13,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 SizedBox(width: 20),
          //                 Expanded(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Row(
          //                         children: [
          //                           FaIcon(
          //                             FontAwesomeIcons.calendarDay,
          //                             color: Colors.grey,
          //                             size: 18.0,
          //                           ),
          //                           SizedBox(width: 5),
          //                           Text(
          //                             'Date of Birth:',
          //                             style: Text15,
          //                           ),
          //                         ],
          //                       ),
          //                       SizedBox(height: 3),
          //                       Text(
          //                         '',
          //                         style: Text10,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(height: 10),
          //             Row(
          //               children: [
          //                 Expanded(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Row(
          //                         children: [
          //                           Icon(
          //                             Icons.flag,
          //                             size: 20,
          //                             color: Colors.grey,
          //                           ),
          //                           SizedBox(width: 5),
          //                           Text(
          //                             'Nationality:',
          //                             style: Text15,
          //                           ),
          //                         ],
          //                       ),
          //                       SizedBox(height: 3),
          //                       Text(
          //                         'Dominance Republic',
          //                         style: Text13,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    ),
  );
}

Widget buildSharerInfo(BuildContext context, CommonAppBar2Controller controller) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap:()=>Get.toNamed("/addGuestInfo"),
            child: Container(
              height: 60,
              decoration: boxDecoration1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Add Sharer", style: Text13),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("+", style: Text13),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 200, // Adjust the height as per your requirement
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: boxDecoration1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MR. MONOCO',
                              style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'DOMNICIAN REPUBLIC',
                              style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 1,
            ),
          ),
          SizedBox(height: 30),
          // Uncomment and adjust this section if needed
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   child: Column(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(top: 12, bottom: 4),
          //         child: Text(
          //           'Transport Information',
          //           style: Text4,
          //         ),
          //       ),
          //       Divider(),
          //       Padding(
          //         padding: const EdgeInsets.all(12.0),
          //         child: Column(
          //           children: [
          //             Row(
          //               children: [
          //                 Text(
          //                   'Pick up:',
          //                   style: Text9,
          //                 ),
          //                 SizedBox(width: 115),
          //                 Text(
          //                   'Drop off:',
          //                   style: Text9,
          //                 ),
          //               ],
          //             ),
          //             SizedBox(height: 10),
          //             Row(
          //               children: [
          //                 Expanded(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Row(
          //                         children: [
          //                           Icon(
          //                             Icons.av_timer,
          //                             size: 20,
          //                             color: Colors.grey,
          //                           ),
          //                           SizedBox(width: 5),
          //                           Text(
          //                             'Expiry Date:',
          //                             style: Text15,
          //                           ),
          //                         ],
          //                       ),
          //                       SizedBox(height: 3),
          //                       Text(
          //                         '',
          //                         style: Text13,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 SizedBox(width: 20),
          //                 Expanded(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Row(
          //                         children: [
          //                           FaIcon(
          //                             FontAwesomeIcons.calendarDay,
          //                             color: Colors.grey,
          //                             size: 18.0,
          //                           ),
          //                           SizedBox(width: 5),
          //                           Text(
          //                             'Date of Birth:',
          //                             style: Text15,
          //                           ),
          //                         ],
          //                       ),
          //                       SizedBox(height: 3),
          //                       Text(
          //                         '',
          //                         style: Text10,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(height: 10),
          //             Row(
          //               children: [
          //                 Expanded(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Row(
          //                         children: [
          //                           Icon(
          //                             Icons.flag,
          //                             size: 20,
          //                             color: Colors.grey,
          //                           ),
          //                           SizedBox(width: 5),
          //                           Text(
          //                             'Nationality:',
          //                             style: Text15,
          //                           ),
          //                         ],
          //                       ),
          //                       SizedBox(height: 3),
          //                       Text(
          //                         'Dominican Republic',
          //                         style: Text13,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    ),
  );
}

class BottomBookingBar2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.1), // Lower opacity for a subtle shadow
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(2, 2), // Shadow position
          ),
          BoxShadow(
            color: Colors.black
                .withOpacity(0.1), // Lower opacity for a subtle shadow
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(-2, -2), // Shadow position
          ),
          BoxShadow(
            color: Colors.black
                .withOpacity(0.1), // Lower opacity for a subtle shadow
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(2, -2), // Shadow position
          ),
          BoxShadow(
            color: Colors.black
                .withOpacity(0.1), // Lower opacity for a subtle shadow
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(-2, 2), // Shadow position
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              // onTap: () {Get.find<CommonAppBar2Controller>().showPaymentModal(context);},
              onTap: () {
                showPaymentScreen();
              },
              child: Container(

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Payment",
                    style: Text13,
                  ),
                ),
              ),
            ),
            InkWell(
              // onTap: () {Get.find<CommonAppBar2Controller>().showExtraChargeModal(context);},
              onTap: () {
                 showExtraChargesScreen();
                },
              child: Container(

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Extra Charges",
                    style: Text13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}