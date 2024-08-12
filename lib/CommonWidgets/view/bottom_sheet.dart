import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../features/booking_details/view/BookingDetails.dart';

class BookingBottomSheet {
  final BuildContext context;
  final String bookingId;
  final String title;

  BookingBottomSheet({
    required this.context,
    required this.bookingId,
    required this.title,
  });

  void show() {
    if (title == 'Arrival') {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.remove_red_eye),
                  title: Text('View Reservation'),
                  onTap: () {
                    Get.to(() => BookingDetails(BookingId: bookingId));
                    print("getting called");
                  },
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.fileAlt,
                    size: 18,
                  ),
                  title: Text('Audit Trail'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Edit guest profile'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.visibility_off),
                  title: Text('Mark No Show'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.hotel),
                  title: Text('Assign Room'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.swap_horiz),
                  title: Text('Amend Stay'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.minusCircle,
                    size: 18,
                  ),
                  title: Text('Void Transaction'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.print),
                  title: Text('Print Invoice'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.close),
                  title: Text('Close'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    } else if (title == 'Departure') {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.remove_red_eye),
                  title: Text('View Reservation'),
                  onTap: () {
                    Get.to(() => BookingDetails(BookingId: bookingId));
                    print("getting called");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.swap_horiz),
                  title: Text('Ammed Stay'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.flight),
                  title: Text('Check Out'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.fileAlt,
                    size: 18,
                  ),
                  title: Text('Audit Trail'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.minusCircle,
                    size: 18,
                  ),
                  title: Text('Void Transaction'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.print),
                  title: Text('Print Invoice'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.close),
                  title: Text('Close'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    } else if (title == 'Booking') {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.remove_red_eye),
                  title: Text('View Reservation'),
                  onTap: () {
                    Get.to(() => BookingDetails(BookingId: bookingId));
                    print("getting called");
                  },
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.fileAlt,
                    size: 18,
                  ),
                  title: Text('Audit Trail'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Edit guest profile'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.minusCircle,
                    size: 18,
                  ),
                  title: Text('Void Transaction'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.swap_horiz),
                  title: Text('Ammend Stay'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.cancel),
                  title: Text('Cancel Reservation'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.syncAlt,
                    size: 18,
                  ),
                  title: Text('Change Reservation Type'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Send Email Reservation Voucher'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.hotel),
                  title: Text('Assign Room'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.print),
                  title: Text('Print Reservation Voucher'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.close),
                  title: Text('Close'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.remove_red_eye),
                  title: Text('View Reservation'),
                  onTap: () {
                    Get.to(() => BookingDetails(BookingId: bookingId));
                    print("getting called");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.swap_horiz),
                  title: Text('Ammed Stay'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.minusCircle
                  ),
                  title: Text('Void Transaction'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.block),
                  title: Text('Undo Check-in/Day-use'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.hotel),
                  title: Text('Room Move'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.swap_horiz),
                  title: Text('Auido Trail'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.cancel),
                  title: Text('Void Transaction'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.print),
                  title: Text('Stop Room Move'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.print),
                  title: Text('Print Invoice'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.close),
                  title: Text('Close'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
