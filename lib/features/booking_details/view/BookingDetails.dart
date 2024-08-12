import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/commonappbar2controller.dart';
import '../../../utils/helper/colors.dart';
import '../components/BookingDetails.dart';

class BookingDetails extends StatefulWidget {
  final String BookingId;
  BookingDetails({super.key, required this.BookingId});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  late final CommonAppBar2Controller controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the correct BookingId
    controller = Get.put(CommonAppBar2Controller(widget.BookingId));
  }
  @override
  Widget build(BuildContext context) {

    // controller.id.value = int.parse(widget.Bookingid);
    // print("id---- ${controller.id.value}");
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Padding(
            padding: EdgeInsets.only(top: 25.0, left: 10),
            child: Obx(() {
              final data = controller.generalInfo.isNotEmpty ? controller.generalInfo[0] : {};
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['contact_info']?['name'] ?? 'N/A',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'DOMNICIAN REPUBLIC',
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              );
            }),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 15.0, right: 10),
              child: IconButton(
                onPressed: () =>
                    // print(widget.Bookingid),
                    Get.back(),
                icon: Icon(Icons.cancel, color: Colors.white),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0), // Adjust the height as needed
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorWeight: 2,
              tabs: [
                Tab(text: 'GENERAL INFO'),
                Tab(text: 'GUEST INFO'),
                Tab(text: 'ROOM CHARGES'),
                Tab(text: 'FOLIO DETAILS'),
                Tab(text: 'REMARKS'),
                Tab(text: 'AUDIT TRAIL'),
                Tab(text: 'SHARER INFORMATION'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildGeneralInfo(context, controller),
            buildGuestInfo(context, controller),
            buildRoomChargesInfo(context, controller),
            buildFolioDetails(context, controller),
            buildAddRemark(context, controller),
            buildAudioTrail(context, controller),
            buildSharerInfo(context, controller),
          ],
        ),
        bottomNavigationBar: BottomBookingBar2(),
      ),
    );
  }
}


