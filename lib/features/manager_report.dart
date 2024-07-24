import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/manager_report_controller.dart';
import '../utils/helper/styles.dart';

class ManagerReportScreen extends GetView<ManagerReportController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('MANAGER REPORT', style: Text1),
        leading: InkWell(
          onTap:()=>Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDateSection(),
              SizedBox(height: 20),
              _buildParticularsSection(),
              SizedBox(height: 20),
              _buildExtraChargesSection(),
              SizedBox(height: 20),
              _buildExtraChargesSection(),
              SizedBox(height: 20),
              _buildExtraChargesSection(),
              SizedBox(height: 20),
              _buildExtraChargesSection(),
              SizedBox(height: 20),
              _buildExtraChargesSection(),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildDateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('As on Date', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PTD', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('03/01/2024', style: TextStyle(fontSize: 16)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('YTD', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('01/01/2024', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildParticularsSection() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Particulars', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple)),
        SizedBox(height: 10),
        _buildChargeItem('Day Use Charges', controller.dayUseCharges.value),
        _buildChargeItem('Late Checkout Charges', controller.lateCheckoutCharges.value),
        _buildChargeItem('Room Charges', controller.roomCharges.value),
        _buildChargeItem('Cancellation Revenue', controller.cancellationRevenue.value),
        _buildChargeItem('No Show Revenue', controller.noShowRevenue.value),
        _buildChargeItem('Discount 5%', controller.discount.value),
        _buildChargeItem('Adjustment', controller.adjustment.value),
        Divider(),
        _buildChargeItem('Total', controller.total.value, isTotal: true),
      ],
    ));
  }

  Widget _buildExtraChargesSection() {
    return Obx(() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:boxDecoration1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Extra Charges', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple)),
              SizedBox(height: 10),
              _buildChargeItem('Extra Bed', controller.extraBed.value),
              _buildChargeItem('Electricity Fee', controller.electricityFee.value),
              _buildChargeItem('Water Fee', controller.waterFee.value),
              _buildChargeItem('Airport Pick Up by Mini', controller.airportPickupByMini.value),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildChargeItem(String title, int value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: isTotal ? 18 : 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(value.toString(), style: TextStyle(fontSize: isTotal ? 18 : 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
