import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/CommonWidgets/view/appbarwidget.dart';
import 'package:fun_n_food_vendor/controller/booking/quick_booking_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/helper/styles.dart';


class Quickbooking extends GetView<QuickBookingController> {
  const Quickbooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        CommonSliverAppBar("Quick Booking", Icons.refresh, null, () {}, () {},
            true, () => Get.back()),
        spacer5,
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SourceSection(),
          ),
        ),
        spacer3,
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DateSelectionSection(),
          ),
        ),
        spacer3,
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BookingTypeAndRoomsSection(),
          ),
        ),
        spacer3,
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoomInformationSection(),
          ),
        ),
        spacer5,
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GuestInformationSection(),
          ),
        ),
      ]),
      bottomNavigationBar: BottomBookingBar(),
    );
  }
}

class SourceSection extends GetView<QuickBookingController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("source-", style: Text7),
            SizedBox(width: .5.w),
            Text("Walk-in", style: Text9)
          ],
        ),
        SizedBox(height: 1.h),
        Container(
          padding: EdgeInsets.all(10),
          decoration: boxDecoration1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Business source"),
              InkWell(
                onTap: () {
                  controller.showBusinessSourceSheet(context);
                },
                child: Row(children: [
                  Obx(() => Text(controller.selectBusinesssource.value)),
                  Icon(Icons.arrow_drop_down)
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class DateSelectionSection extends GetView<QuickBookingController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => controller.selectDate(context, 'checkin'),
          child: DateBox(
            title: "Check-in",
            date: controller.CheckInDate.value,
            time: controller.CheckInTime.value,
          ),
        ),
        SizedBox(width: .5.w),
        NightsBox(nights: controller.TotalNights.value),
        SizedBox(width: .5.w),
        InkWell(
          onTap: () => controller.selectDate2(context, 'checkout'),
          child: DateBox(
            title: "Check-out",
            date: controller.CheckOutDate.value,
            time: "11:00:00 AM",
          ),
        ),
      ],
    );
  }
}

class BookingTypeAndRoomsSection extends GetView<QuickBookingController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      padding: EdgeInsets.all(10),
      decoration: boxDecoration1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BookingTypeSelector(),
          RoomsSelector(),
        ],
      ),
    );
  }
}

class RoomInformationSection extends GetView<QuickBookingController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Room Information", style: Text9),
        SizedBox(height: 1.h),
        Container(
          decoration: boxDecoration1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RoomInfoRow(
                    label: "Room Type",
                    value: controller.totalRooms.value,
                    controller: controller),
                Divider(),
                RoomInfoRow(
                    label: "Rate Type",
                    value: controller.totalRooms.value,
                    controller: controller),
                Divider(),
                RoomInfoRow(
                    label: "Rate Override",
                    value: controller.totalRooms.value,
                    controller: controller),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GuestInformationSection extends GetView<QuickBookingController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Guest Information", style: Text9),
            Row(
              children: [
                buildBookingTypeObxContainer(
                    controller, 'New', 1, 10.0, 0.0, 10.0, 0.0, 'GuestInfo'),
                buildBookingTypeObxContainer(controller, 'Returning', 2, 0.0,
                    10.0, 0.0, 10.0, 'GuestInfo'),
              ],
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Container(
          decoration: boxDecoration1,
          child: Obx(() => Padding(
                padding: const EdgeInsets.all(8.0),
                child: (controller.GuestType.value == 2)
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: 'search name of the guest',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12.0),
                        ),
                        onChanged: (value) {
                          // Add search functionality here
                          // controller.search(value);
                        },
                      )
                    : Column(
                        children: [
                          GuestInfoRow(label: "Guest Name"),
                          Divider(),
                          GuestInfoRow(label: "Phone number"),
                          Divider(),
                          GuestInfoRow(label: "Email Id"),
                        ],
                      ),
              )),
        ),
      ],
    );
  }
}

class BottomBookingBar extends StatelessWidget {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Total", style: Text7),
                SizedBox(height: 2),
                Text("0000")
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "book now",
                    style: Text8,
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

class DateBox extends StatelessWidget {
  final String title;
  final String date;
  final String time;

  DateBox({required this.title, required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 35.w,
      decoration: boxDecoration1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Text7),
          Text(
            '$date $time',
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class NightsBox extends StatelessWidget {
  final String nights;

  NightsBox({required this.nights});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 20.w,
      decoration: boxDecoration1,
      child: Column(
        children: [Text(nights), Text("night")],
      ),
    );
  }
}

class BookingTypeSelector extends GetView<QuickBookingController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: [
          Text("Booking type"),
          SizedBox(height: .5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildBookingTypeObxContainer(controller, 'Confirm', 1, 10.0, 0.0,
                  10.0, 0.0, 'BookingType'),
              // SizedBox(width: 8.0), // buildBookingTypeObxContainer(
              buildBookingTypeObxContainer(
                  controller, 'Inquiry', 2, 0.0, 0.0, 0.0, 0.0, 'BookingType'),
              // SizedBox(width: 8.0), // Add some space between the buttons
              buildBookingTypeObxContainer(
                  controller, 'Hold', 3, 0.0, 10.0, 0.0, 10.0, 'BookingType'),
            ],
          ),
        ],
      ),
    );
  }
}

class RoomsSelector extends GetView<QuickBookingController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Rooms"),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.5),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(() => Text(controller.totalRooms.value)),
                IconButton(
                  onPressed: () => controller.showModal2(context),
                  icon: Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class RoomInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final controller;

  RoomInfoRow(
      {required this.label, required this.value, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        (label == 'Rate Override')
            ? Obx(
                () => Switch.adaptive(
                  value: controller.isSwitchOn.value,
                  onChanged: (value) {
                    controller.isSwitchOn.value = value;
                  },
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: (label=='Room Type')?
                  InkWell(
                    onTap:()=>controller.showModal3(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() => Text(controller.RoomType.value)),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ): InkWell(
                    onTap:()=>controller.showModal4(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() => Text(controller.RateType.value)),

                          Icon(Icons.arrow_drop_down),

                      ],
                    ),
                  ),
                ),
              )
      ],
    );
  }
}

class GuestInfoRow extends StatelessWidget {
  final String label;

  GuestInfoRow({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$label :"),
        SizedBox(width: 1.h),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: '',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(12.0),
            ),
          ),
        ),
      ],
    );
  }
}

Obx buildBookingTypeObxContainer(
  QuickBookingController controller,
  String bookingType,
  int value,
  double topLeft,
  double topRight,
  double bottomLeft,
  double bottomRight,
  String type,
) {
  return Obx(() {
    bool isSelected = (type == 'BookingType')
        ? (controller.BookingType.value == value)
        : (controller.GuestType.value == value);

    return InkWell(
      onTap: () {
        if (type == 'BookingType') {
          controller.BookingType.value = value;
        } else {
          controller.GuestType.value = value;
        }
      },
      child: Container(
        // width: 90,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              bookingType,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  });
}
