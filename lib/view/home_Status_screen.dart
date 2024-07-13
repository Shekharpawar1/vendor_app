import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/helper/colors.dart';
import 'package:get/get.dart';
import '../controller/home_Status_controller.dart';
import '../helper/styles.dart';


class HouseStatusScreen extends GetView<HouseStatusController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('HOUSE STATUS',style:Text1),
        leading: InkWell(
          onTap:()=>Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
               Container(
                 decoration:boxDecoration1,
                 child: Column(children:[_buildSectionHeader('AHMED'),
                   _buildHouseStatusList(controller.houseStatus),]),
               ),
              SizedBox(height: 10,),
              Container(
                decoration:boxDecoration1,
                child: Column(children:[ _buildSectionHeader('COLEEN PIETERSE'),
                  _buildHouseStatusList(controller.houseStatus),]),
              )


              // _buildSectionHeader('HAKLY'),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildHouseStatusList(RxList<Map<String, dynamic>> houseStatus) {
    return Obx(() => Container(
      child: Column(
        children: houseStatus.map((status) {
          return _buildHouseStatusItem(
            status['name'],
            status['availability'],
            status['color'],
          );
        }).toList(),
      ),
    ));
  }

  Widget _buildHouseStatusItem(String name, String availability, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Availability: $availability',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
          Icon(Icons.more_vert, color: Colors.grey),
        ],
      ),
    );
  }
}
