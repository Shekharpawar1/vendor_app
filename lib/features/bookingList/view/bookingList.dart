import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fun_n_food_vendor/CommonWidgets/view/bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../CommonWidgets/view/custom_refersh_indicator.dart';
import '../../../utils/helper/colors.dart';
import '../../../utils/helper/styles.dart';
import '../controller/booking_list_controller.dart';

class BookingListScreen extends StatefulWidget {
  final String title;
  BookingListScreen({super.key, required this.title});

  @override
  _BookingListScreenState createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> with SingleTickerProviderStateMixin {
  late BookingListController controller;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    controller = Get.put(BookingListController());
    _tabController = TabController(length: 3, vsync: this, initialIndex: controller.currentTabIndex.value);

    // Listen to tab index changes
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        int index = _tabController.index;
        controller.currentTabIndex.value = index;
        String scope;
        switch (index) {
          case 0:
            scope = 'Today';
            break;
          case 1:
            scope = 'Tomorrow';
            break;
          case 2:
            scope = 'Week';
            break;
          default:
            scope = 'Today';
        }
        controller.currentScope.value = scope;
        if (widget.title == 'Arrival') {
          controller.getArrivalInfo(scope: scope);
        } else if (widget.title == 'Departure') {
          if (index == 0) {
            controller.getTodayDepartureInfo();
          } else {
            controller.getDepartureInfo(scope: scope);
          }
        }
      }
    });

    if (widget.title == 'Booking') {
      controller.getBookingInfo();
    } else if (widget.title == 'In-house') {
      controller.getInHouseBookingInfo();
    } else if (widget.title == 'Arrival') {
      controller.getArrivalInfo(scope: 'Today');
    } else if (widget.title == 'Departure') {
      controller.getTodayDepartureInfo();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isArrivalOrDeparture = widget.title == 'Arrival' || widget.title == 'Departure';
    return Scaffold(
      key: GlobalKey<ScaffoldState>(),
      appBar: AppBar(
        title: Text(widget.title, style: Text1, textScaleFactor: 1),
        backgroundColor: primaryColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            iconColor: Colors.white,
            onSelected: (value) {
              switch (value) {
                case 'refresh':
                  if (widget.title == 'Arrival') {
                    controller.getArrivalInfo(scope: controller.currentScope.value);
                  } else if (widget.title == 'Departure') {
                    if (controller.currentTabIndex.value == 0) {
                      controller.getTodayDepartureInfo();
                    } else {
                      controller.getDepartureInfo(scope: controller.currentScope.value);
                    }
                  }
                  break;
                case 'sort':
                // Implement sort functionality
                  break;
                case 'filter':
                // Implement filter functionality
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'refresh',
                child: Text('Refresh', textScaleFactor: 1),
              ),
              PopupMenuItem(
                value: 'sort',
                child: Text('Sort', textScaleFactor: 1),
              ),
              PopupMenuItem(
                value: 'filter',
                child: Text('Filter', textScaleFactor: 1),
              ),
            ],
          ),
        ],
        bottom: isArrivalOrDeparture
            ? TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[300],
          tabs: [
            Tab(text: 'Today'),
            Tab(text: 'Tomorrow'),
            Tab(text: 'This Week'),
          ],
        )
            : null,
      ),
      body: isArrivalOrDeparture
          ? TabBarView(
        controller: _tabController,
        children: [
          BookingListView(controller: controller, isShow: true, title: widget.title),
          BookingListView(controller: controller, isShow: true, title: widget.title),
          BookingListView(controller: controller, isShow: true, title: widget.title),
        ],
      )
          : BookingListView(controller: controller, title: widget.title),
    );
  }
}

class BookingListView extends StatelessWidget {
  final BookingListController controller;
  final String title;
  final bool isShow;

  BookingListView({
    required this.controller,
    this.isShow = false,
    required this.title,
  });

  Future<void> _handleRefresh() async {
    if (title == 'Arrival') {
      await controller.getArrivalInfo(scope: controller.currentScope.value);
    } else if (title == 'Departure') {
      if (controller.currentTabIndex.value == 0) {
        await controller.getTodayDepartureInfo();
      } else {
        await controller.getDepartureInfo(scope: controller.currentScope.value);
      }
    } else if (title == 'Booking') {
      await controller.getBookingInfo();
    } else {
      await controller.getInHouseBookingInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator(color: primaryColor));
      }

      final list = isShow
          ? (title == 'Arrival'
          ? controller.arrivals
          : (controller.currentTabIndex.value == 0
          ? controller.todayDepartures
          : controller.departures))
          : (title == 'Booking'
          ? controller.bookings
          : (title == 'In-house' ? controller.inHouseBookings : []));

      if (list.isEmpty) {
        return Center(
          child: Card(
            elevation: 4.0,
            margin: EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'No booking is found',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 1,
              ),
            ),
          ),
        );
      }

      if (title != 'Booking') {
        return CustomRefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) => Container(
              height: 30.h,
              width: 100.w,
              child: ReservationCard(controller: controller, data: list[index], title: title),
            ),
          ),
        );
      } else {
        return CustomRefreshIndicator(
          onRefresh: _handleRefresh,
          child: Column(
            children: [
              Filter(controller: controller),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                    height: 30.h,
                    width: 100.w,
                    child: ReservationCard(controller: controller, data: list[index], title: title),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}


class ReservationCard extends StatelessWidget {
  final String title;
  final BookingListController controller;
  final dynamic data;

  ReservationCard({super.key, required this.controller, required this.data, required this.title});

  get bookingId => ((data['booked_rooms'] != null && data['booked_rooms'].isNotEmpty)
      ? data['booked_rooms'][0]['booking_id'] ?? 0
      : 0).toString();
  int calculateNightDifference(String checkIn, String checkOut) {
    DateTime checkInDate = DateTime.parse(checkIn);
    DateTime checkOutDate = DateTime.parse(checkOut);
    return checkOutDate.difference(checkInDate).inDays;
  }

  @override
  Widget build(BuildContext context) {
    // Ensure data is not null and has required fields
    if (data == null) {
      return Container(
        child: Text('No data available'),
      );
    }
    final int nightDifference = calculateNightDifference(data['check_in'], data['check_out']);
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['check_in'], style: TextStyle(color: Colors.grey), textScaleFactor: 1),
                    Divider(height: 8.0),
                    Text(data['check_out'], style: TextStyle(color: Colors.grey), textScaleFactor: 1),
                  ],
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['contact_info']['name'] ?? 'N/A', style: TextStyle(color: Colors.purple), textScaleFactor: 1),
                      Row(
                        children: [
                          Text('Res ', textScaleFactor: 1),
                          Container(
                            color: Colors.orange,
                            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                            child: Text(data['booking_number']?.toString() ?? 'N/A', style: TextStyle(color: Colors.white), textScaleFactor: 1),
                          ),
                          SizedBox(width: 8.0),
                          Text('Folio ${data['id']?.toString() ?? 'N/A'}', textScaleFactor: 1),
                          Spacer(),
                          InkWell(
                            // onTap: () => controller.showBottomSheet(context, bookingId),
                            onTap: () => BookingBottomSheet(context: context,title: title, bookingId: data['id']?.toString() ?? '0', bookingNumber: data['booking_number']?.toString() ?? '0').show(),
                            child: Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(Icons.hotel, size: 16.0),
                          SizedBox(width: 4.0),
                          Text('$nightDifference Night Stay', textScaleFactor: 1),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.home, size: 16.0),
                          SizedBox(width: 4.0),
                          Text('${data['booked_rooms']?[0]['room_number']?.toString() ?? 'N/A'} Room(s)', textScaleFactor: 1),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 16.0),
                          SizedBox(width: 4.0),
                          title == 'Departure'
                              ? Row(
                            children: [
                              Text('Departure at', textScaleFactor: 1),
                              Text(' ${data['time']?.toString() ?? '10:00 AM'}', textScaleFactor: 1),
                            ],
                          )
                              : Row(
                            children: [
                              Text('Arriving at', textScaleFactor: 1),
                              Text(' ${data['time']?.toString() ?? '12:00 PM'}', textScaleFactor: 1),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rs ${data['total_amount']?.toString() ?? '0.00'}', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold), textScaleFactor: 1),
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 4.0),
                    Text('Email', textScaleFactor: 1),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Filter extends StatelessWidget {
  final BookingListController controller;
  const Filter({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Arrival', style: Text12),
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () => controller.selectDate(context, true),
                          child: Obx(() {
                            final dateText = DateFormat('yyyy-MM-dd').format(controller.arrivalDate.value);
                            final parts = dateText.split('-');
                            if (parts.length == 3) {
                              final year = parts[0];
                              final month = parts[1];
                              final day = parts[2];
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
                                      text: ' - $month - $year',
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
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.arrowRight,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('Departure', style: Text12),
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () => controller.selectDate(context, false),
                          child: Obx(() {
                            final dateText = DateFormat('yyyy-MM-dd').format(controller.departureDate.value);
                            final parts = dateText.split('-');
                            if (parts.length == 3) {
                              final year = parts[0];
                              final month = parts[1];
                              final day = parts[2];
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
                                      text: '- $month - $year',
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
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => controller.getBookingInfo(isVisible: true, arvlDate:controller.arrivalDate.value, deptDate:controller.departureDate.value),
                  child: Container(
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.search,
                          color: Colors.grey,
                          size: 20,
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
    );
  }
}
