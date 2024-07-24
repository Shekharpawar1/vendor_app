import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/helper/styles.dart';

class EditGuestController extends GetxController{
  final TextEditingController Salutation=TextEditingController();
  final TextEditingController GuestName=TextEditingController();
  final TextEditingController AgeInfo=TextEditingController();
  final TextEditingController Gender=TextEditingController();
  final TextEditingController AddressController=TextEditingController();
  final TextEditingController Country=TextEditingController();
  final TextEditingController State=TextEditingController();
  final TextEditingController city=TextEditingController();
  final TextEditingController zip=TextEditingController();
  final TextEditingController Mobile=TextEditingController();
  final TextEditingController phone=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController fax=TextEditingController();
  final TextEditingController registeration=TextEditingController();
  final TextEditingController IssuingCountry=TextEditingController();
  final TextEditingController identityNo=TextEditingController();
  final TextEditingController IdentityType=TextEditingController();
  final TextEditingController issuingCity=TextEditingController();
  final TextEditingController expDate=TextEditingController();
  final TextEditingController Nationality=TextEditingController();
  final TextEditingController Vip_Status=TextEditingController();
  final TextEditingController Birth_Date=TextEditingController();
  final TextEditingController Birth_Country=TextEditingController();
  final TextEditingController Birth_City=TextEditingController();
  final TextEditingController Spouse_Birth_Date=TextEditingController();
  final TextEditingController Wedding_Anniversary=TextEditingController();
  final TextEditingController company=TextEditingController();

  List CountryList=["India","USA"];
  List GenderList=['Male','Female',"Other"];
  List VipList=['Buisness Man','Government',"Corporate","None"];
  showModal(context,field){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 256.h, // Adjust the height as needed
            child: ListView.builder(

              itemCount: CountryList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  // Use InkWell for tap functionality
                  onTap: () {
                    field.text=CountryList[index];
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      decoration: boxDecoration1,

                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                '${CountryList[index]}'),
                          )),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
  showGenderModal(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height:170,
            child: ListView.builder(

              itemCount: GenderList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  // Use InkWell for tap functionality
                  onTap: () {
                    Gender.text=GenderList[index];
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      decoration: boxDecoration1,

                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                '${GenderList[index]}'),
                          )),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
  showvipmodal(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height:210,
            child: ListView.builder(

              itemCount: VipList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  // Use InkWell for tap functionality
                  onTap: () {
                    Vip_Status.text=VipList[index];
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      decoration: boxDecoration1,

                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                '${VipList[index]}'),
                          )),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }



  Future<void> selectDate(BuildContext context, TextEditingController field) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18),
      firstDate: DateTime(1970),
      lastDate: DateTime(now.year - 18),
    );

    if (picked != null && picked != now) {
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      final String formattedDate = formatter.format(picked);
      field.text = formattedDate;
    }
  }


}