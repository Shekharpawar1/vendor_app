import 'package:get/get.dart';

import '../helper/images.dart';

class NotificationController extends GetxController{


  RxList ReviewList=[].obs;

  List Review=[
    Reviewclass(image: app_logo, customerName: "John Doe", review: "Lorem ipsumsfgsdfsdfgsdfgsdfgsgdfgsdfgsdfgsdfgsdfsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdf", partner: "Agoda"),
    Reviewclass(image: app_logo, customerName: "John Doe", review: "Lorem ipsumsfgsdfsdfgsdfgsdfgsgdfgsdfgsdfgsdfgsdfsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdf", partner: "Booking"),
    Reviewclass(image: app_logo, customerName: "John Doe", review: "Lorem ipsumsfgsdfsdfgsdfgsdfgsgdfgsdfgsdfgsdfgsdfsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdf", partner: "Make My Trip"),
    Reviewclass(image: app_logo, customerName: "John Doe", review: "Lorem ipsumsfgsdfsdfgsdfgsdfgsgdfgsdfgsdfgsdfgsdfsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdf", partner: "Agoda"),
    Reviewclass(image: app_logo, customerName: "John Doe", review: "Lorem ipsumsfgsdfsdfgsdfgsdfgsgdfgsdfgsdfgsdfgsdfsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdf", partner: "Agoda"),
  ];

  onInit(){
    super.onInit();
    ReviewList.assignAll(Review);
    print("ReviewList -----------------------${ReviewList.value[0].image}");
    update();
  }

}


class Reviewclass {
  String image;

  String customerName;

  String review;

  String partner;

  Reviewclass({
    required this.image,
    required this.customerName,
    required this.review,
    required this.partner,
  });
}