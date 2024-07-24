// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import '../components/BookingDetails.dart';
// import '../../../controller/commonappbar2controller.dart';
// import '../../../utils/helper/colors.dart';
//
// class BookingDetails extends StatelessWidget {
//    BookingDetails({super.key});
//  // final CommonAppBar2Controller controller = Get.put(CommonAppBar2Controller());
//
//   @override
//   Widget build(BuildContext context) {
//
//     final CommonAppBar2Controller controller = Get.put(CommonAppBar2Controller());
//     print("im here------------------------");
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         title: Padding(
//           padding: EdgeInsets.only(top:25.0, left: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'MR. MONOCO',
//                 style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
//               ),
//               Text(
//                 'DOMNICIAN REPUBLIC',
//                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
//               ),
//             ],
//           ),
//         ),
//         automaticallyImplyLeading: false,
//         // leading:Padding(
//         //   padding: EdgeInsets.only(top:25.0, left: 10),
//         //   child: Icon(Icons.arrow_back_ios,color:Colors.white),
//         // ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(top:15.0, right: 10),
//             child: IconButton(onPressed:()=>Get.back(),icon: Icon(Icons.cancel,color:Colors.white),),
//           )
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(60.0), // Adjust the height as needed
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildBottomItem('GENERAL INFO', 0,controller),
//                 _buildBottomItem('GUEST INFO', 1,controller),
//                 _buildBottomItem('ROOM CHARGES', 2,controller),
//                 _buildBottomItem('FOLIO DETAILS', 3,controller),
//                 _buildBottomItem('REMARKS', 4,controller),
//                 _buildBottomItem('AUDIT TRAIL', 5,controller),
//                 _buildBottomItem('SHARER INFORMATION', 6,controller),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Obx(() {
//         switch (controller.selectedIndex.value) {
//           case 0:
//             return buildGeneralInfo(context, controller);
//           case 1:
//             return buildGuestInfo(context, controller);
//           case 2:
//             return buildRoomChargesInfo(context,controller);
//           // return RoomCharges();
//           case 3:
//           // return FolioDetails();
//             return buildFolioDetails(context,controller);
//           case 4:
//             return buildAddRemark(context,controller);
//           // return Remarks();
//           case 5:
//             return buildAudioTrail(context,controller);
//           // return AudioTrail();
//           case 6:
//             return buildSharerInfo(context,controller);
//           // return SharerInformation();
//           default:
//             return Center(
//               child: Text(
//                 'Invalid Index',
//                 style: TextStyle(fontSize: 24),
//               ),
//             );
//         }
//       }),
//       bottomNavigationBar: BottomBookingBar2(),
//     );
//   }
//
//   Widget _buildBottomItem(String title, int index,controller) {
//     return GestureDetector(
//       onTap: () => controller.selectItem(index),
//       child: Obx(() {
//         bool isSelected = controller.selectedIndex.value == index;
//         return Container(
//           padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
//           decoration: BoxDecoration(
//             border: isSelected
//                 ? Border(
//               bottom: BorderSide(
//                 color: Colors.white,
//                 width: 2.0, // Thickness of the underline
//               ),
//             )
//                 : null,
//           ),
//           child: Text(
//             title,
//             style: TextStyle(
//               fontSize: 16.0,
//               fontWeight: FontWeight.w500,
//               // color: isSelected ? Colors.white : Colors.black,
//               color: Colors.white ,
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/commonappbar2controller.dart';
import '../../../utils/helper/colors.dart';
import '../components/BookingDetails.dart';

class BookingDetails extends StatelessWidget {
  BookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonAppBar2Controller controller = Get.put(CommonAppBar2Controller());

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Padding(
            padding: EdgeInsets.only(top: 25.0, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MR. MONOCO',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  'DOMNICIAN REPUBLIC',
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 15.0, right: 10),
              child: IconButton(
                onPressed: () => Get.back(),
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
