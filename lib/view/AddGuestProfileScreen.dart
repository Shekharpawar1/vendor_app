import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/CommonWidgets/commonBtn.dart';
import 'package:fun_n_food_vendor/controller/add_guest_controller.dart';
import 'package:fun_n_food_vendor/helper/styles.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../helper/colors.dart';

class AddGuestInfo extends GetView<AddGuestController> {
  const AddGuestInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Sharer Info',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        // leading:Padding(
        //   padding: EdgeInsets.only(top:25.0, left: 10),
        //   child: Icon(Icons.arrow_back_ios,color:Colors.white),
        // ),
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.cancel, color: Colors.white),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: boxDecoration1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Guest Information",
                          style: Text4,
                        ),
                      ),
                      // SizedBox(width:80.w,child: Divider()),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                                controller: controller,
                                label: "Salutation",
                                TextController: controller.Salutation),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Name",
                              TextController: controller.GuestName,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Adult",
                              TextController: controller.AgeInfo,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Gender",
                              TextController: controller.Gender,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: boxDecoration1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Contact Information",
                          style: Text4,
                        ),
                      ),
                      // SizedBox(width:80.w,child: Divider()),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Address",
                              TextController: controller.AddressController,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Country",
                              TextController: controller.Country,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "State",
                              TextController: controller.State,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "City",
                              TextController: controller.city,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Zip",
                              TextController: controller.zip,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Mobile No.",
                              TextController: controller.Mobile,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Phone No.",
                              TextController: controller.phone,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Email",
                              TextController: controller.email,
                            ),
                          ),Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Fax No.",
                              TextController: controller.fax,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Registeration No.",
                              TextController: controller.registeration,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: boxDecoration1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Identity Information",
                          style: Text4,
                        ),
                      ),
                      // SizedBox(width:80.w,child: Divider()),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Identity Number",
                              TextController: controller.identityNo,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Issuing Country",
                              TextController: controller.IssuingCountry,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Identity Type",
                              TextController: controller.IdentityType,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Issuing City",
                              TextController: controller.issuingCity,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Expiry Date",
                              TextController: controller.expDate,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: boxDecoration1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Other Information",
                          style: Text4,
                        ),
                      ),
                      // SizedBox(width:80.w,child: Divider()),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Nationality",
                              TextController: controller.Nationality,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Vip Status",
                              TextController: controller.Vip_Status,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Birth Date",
                              TextController: controller.Birth_Date,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Birth Country",
                              TextController: controller.Birth_Country,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Birth City",
                              TextController: controller.Birth_City,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Spouse Birth Date",
                              TextController: controller.Spouse_Birth_Date,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Wedding Anniversary",
                              TextController: controller.Wedding_Anniversary,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestInfoRow(
                              controller: controller,
                              label: "Company",
                              TextController: controller.company,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBookingBar3(),
    );
  }
}

class GuestInfoRow extends StatelessWidget {
  final String label;
  final TextEditingController TextController;
  final AddGuestController  controller;

  GuestInfoRow({
    required this.label,
    required this.TextController,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$label :"),
        if (_needsCustomHandler(label))
          Expanded(
            child: _buildCustomField(context),
          )
        else
          Expanded(
            child: TextField(
              controller: TextController,
              decoration: InputDecoration(
                hintText: 'Enter $label',
                hintStyle: Text7,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
          ),
      ],
    );
  }

  bool _needsCustomHandler(String label) {
    return [
      'Country',
      'Issuing Country',
      'Nationality',
      'Birth Country',
      'Vip Status',
      'Gender',
      'Birth Date',
      'Spouse Birth Date',
      'Wedding Anniversary'
    ].contains(label);
  }

  Widget _buildCustomField(BuildContext context) {
    IconData icon;
    Function onTap;

    switch (label) {
      case 'Country':
      case 'Issuing Country':
      case 'Nationality':
      case 'Birth Country':
        icon = Icons.arrow_drop_down;
        onTap = () => controller.showModal(context, _getControllerField(label));
        break;
      case 'Vip Status':
        icon = Icons.arrow_drop_down;
        onTap = () => controller.showvipmodal(context);
        break;
      case 'Gender':
        icon = Icons.arrow_drop_down;
        onTap = () => controller.showGenderModal(context);
        break;
      case 'Birth Date':
        icon = Icons.calendar_today;
        onTap = () => controller.selectDate(context, controller.Birth_Date);
        break;
      case 'Spouse Birth Date':
        icon = Icons.calendar_today;
        onTap = () => controller.selectDate(context, controller.Spouse_Birth_Date);
        break;
      case 'Wedding Anniversary':
        icon = Icons.calendar_today;
        onTap = () => controller.selectDate(context, controller.Wedding_Anniversary);
        break;
      default:
        throw Exception('Invalid label: $label');
    }

    return InkWell(
      onTap: () {
        onTap();
        print("Getting called--------------------------------");
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: TextController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Enter $label',
                  hintStyle: Text7,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ),
            IconButton(
              icon: Icon(icon),
              onPressed: () => onTap(),
            ),
          ],
        ),
      ),
    );
  }

  dynamic _getControllerField(String label) {
    switch (label) {
      case 'Country':
        return controller.Country;
      case 'Issuing Country':
        return controller.IssuingCountry;
      case 'Nationality':
        return controller.Nationality;
      case 'Birth Country':
        return controller.Birth_Country;
      default:
        throw Exception('Invalid label for controller field: $label');
    }
  }
}



class BottomBookingBar3 extends StatelessWidget {
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
        child: CommonButton(
          title: 'Save',
          onPressed: () {},
          color: primaryColor,
        ),
      ),
    );
  }
}
