import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/commonappbar2controller.dart';
import '../helper/colors.dart';
import '../helper/styles.dart';


Widget buildGeneralInfo(BuildContext context, CommonAppBar2Controller controller) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Res # : UC43DD66891500',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Folio # : 538',
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Arrival', style: Text12),
                            SizedBox(height: 5),
                            InkWell(
                              onTap: () => controller.selectDate(context, true),
                              child: Obx(
                                    () {
                                  final dateText = DateFormat('d MMM yyyy').format(controller.arrivalDate.value);
                                  final parts = dateText.split(' ');
                                  if (parts.length == 3) {
                                    final day = parts[0];
                                    final month = parts[1];
                                    final year = parts[2];
                                    return RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: day,
                                            style: TextStyle(
                                              color: Colors.purpleAccent.withOpacity(0.7),
                                              fontWeight: FontWeight.w900,
                                              fontSize: 25,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' $month $year',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Text('Invalid Date');
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              child: Obx(
                                    () {
                                  final nights = controller.numberOfNights;
                                  return Text(
                                    '$nights',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Departure', style: Text12),
                            SizedBox(height: 5),
                            InkWell(
                              onTap: () => controller.selectDate(context, false),
                              child: Obx(
                                    () {
                                  final dateText = DateFormat('d MMM yyyy').format(controller.departureDate.value);
                                  final parts = dateText.split(' ');
                                  if (parts.length == 3) {
                                    final day = parts[0];
                                    final month = parts[1];
                                    final year = parts[2];
                                    return RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: day,
                                            style: TextStyle(
                                              color: Colors.purpleAccent.withOpacity(0.7),
                                              fontWeight: FontWeight.w900,
                                              fontSize: 25,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' $month $year',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Text('Invalid Date');
                                  }
                                },
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
                        'DELUX NEW  |  DU01',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.roomDetails.length,
                    itemBuilder: (context, index) {
                      final item = controller.roomDetails[index];
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${item['title']}',
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
                                  item['info']!,
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
                      );
                    },
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
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.summary.length,
                        itemBuilder: (context, index) {
                          final item = controller.summary[index];
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${item['title']}',
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
                                      item['price']!,
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
                            ],
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Balance:',
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
                              controller.total,
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
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.charges.length,
                        itemBuilder: (context, index) {
                          final detail = controller.charges[index];
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${detail['title']}',
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
                                      detail['price']!,
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
                            ],
                          );
                        },
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
    ),
  );
}

Widget buildGuestInfo(BuildContext context, CommonAppBar2Controller controller) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
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
                                  '9995099950',
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
                                  'Booking@monoco.in',
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
                                Text(
                                  '03/20/2024  12:00:00 PM',
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
                                      'Departure:',
                                      style: Text15,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3),
                                Text(
                                  '03/21/2024  11:00:00 AM',
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
    ),
  );
}



Widget buildRoomChargesInfo(BuildContext context,CommonAppBar2Controller controller){
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
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
                    '03/20/2024 Wed',
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


Widget buildAddRemark(BuildContext context,CommonAppBar2Controller controller){

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap:()
  {
    final _formKey = GlobalKey<FormState>();
    controller.showAlertBox(context, _formKey);
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
              onTap: () {},
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
              onTap: () {},
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