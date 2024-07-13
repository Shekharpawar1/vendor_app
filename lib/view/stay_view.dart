import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/stay_view_controller.dart';
import '../helper/colors.dart';
import '../helper/styles.dart';

class RoomAvailabilityScreen extends StatelessWidget {
  final RoomController controller = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        // leading: InkWell(onTap:()=>Get.back(),child: Icon(Icons.arrow_back_ios_new,color:Colors.white)),
        title:  Text("Stay View",style:Text1),
        // actions: [
        //   IconButton(
        //     onPressed: () => print("Sort button pressed"), // Handle sort button tap
        //     icon: Icon(Icons.sort),
        //   ),
        //   IconButton(
        //     onPressed: () => print("Filter button pressed"), // Handle filter button tap
        //     icon: Icon(Icons.filter_list),
        //   ),
        // ],

      ),
      body: Column(
        children: [
          _buildDateSelector(context),
          _buildTableHeader(),
          _buildRoomAvailabilityTable(),
        ],
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: controller.selectedDate.value,
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null &&
                  pickedDate != controller.selectedDate.value) {
                controller.changeDate(pickedDate);
              }
            },
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                final date = DateTime.now().add(Duration(days: index));
                return GestureDetector(
                  onTap: () {
                    controller.changeDate(date);
                  },
                  child: Obx(() {
                    return Container(
                      width: 80,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: controller.selectedDate.value == date
                            ? Colors.purple
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          date.toString().split(' ')[0],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: controller.selectedDate.value == date
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text("Room", textAlign: TextAlign.center)),
          Expanded(child: Center(child: Text("Thu 21", textAlign: TextAlign.center))),
          Expanded(child: Center(child: Text("Fri 22", textAlign: TextAlign.center))),
          Expanded(child: Center(child: Text("Sat 23", textAlign: TextAlign.center))),
        ],
      ),
    );
  }

  Widget _buildRoomAvailabilityTable() {
    return Expanded(
      child: Obx(() {
        return ListView(
          children: controller.roomTypes.map((roomType) {
            final availability = controller.roomAvailability[roomType];
            final details = controller.roomDetails[roomType] ?? [];
            return ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(roomType)),

                  for (var i = 0; i < availability.length; i++)
                    Expanded(
                      child: Center(
                        child: Container(
                          color: availability[i] == "2/2"
                              ? Colors.red.withOpacity(0.3)
                              : Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(availability[i], textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              children: details.map<Widget>((detail) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Guest: ${detail['guest']}', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('Check-in: ${detail['checkIn']}'),
                      Text('Check-out: ${detail['checkOut']}'),
                    ],
                  ),
                );
              }).toList(),
            );
          }).toList(),
        );
      }),
    );
  }
}
