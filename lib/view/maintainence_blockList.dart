import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/maintainence_controller.dart';
import '../helper/colors.dart';
import '../helper/styles.dart';

class MaintenenceBlockView extends GetView<MaintenenceBlockController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Maintenance Block',
          style: Text1,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildBlockedRoomsList(),
        ),
      ),
    );
  }



  Widget _buildBlockedRoomsList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4, // Number of blocked rooms
      itemBuilder: (context, index) {
        return _buildBlockedRoomItem();
      },
    );
  }

  Widget _buildBlockedRoomItem() {
    return Container(
      decoration: boxDecoration1,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildRoomInfo(),
            _buildDateRange(),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1023 - Couple',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Blocked By PMSTrial@2',
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildDateRange() {
    return Row(
      children: [
        _buildDateText('18 Mar'),
        _buildDateText('to'),
        _buildDateText('21 Mar'),
        _buildDateText('(3 Days)'),
      ],
    );
  }

  Widget _buildDateText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.0,
        color: Colors.grey,
      ),
    );
  }
}
