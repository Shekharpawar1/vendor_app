import 'package:get/get.dart';

import '../features/bookingList/controller/booking_list_controller.dart';

class BookingListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BookingListController>(()=>BookingListController());
    // TODO: implement dependencies
  }

}