import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RoomController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var roomTypes = [
    "Couple Room",
    "CS01 - HIRUN FERNANDO",
    "Deluxe",
    "Deluxe Double Room",
    "Deluxe Double Twin",
    "Deluxe Standard",
    "Deluxe Twine",
    "Doble",
    "Double Luxe",
    "Double room",
    "Double Suite",
    "DULEX NEW",
    "Duplex Suite"
  ].obs;

  var roomAvailability = {}.obs;
  var roomDetails = {}.obs;

  @override
  void onInit() {
    super.onInit();
    initializeRoomAvailability();
    initializeRoomDetails();
  }

  void initializeRoomAvailability() {
    for (var room in roomTypes) {
      roomAvailability[room] = [
        "2/2",
        "2/2",
        "2/2",
        "1/2"
      ].obs;
    }
  }

  void initializeRoomDetails() {
    roomDetails['Couple Room'] = [
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},{'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Smith', 'checkIn': '20/07', 'checkOut': '22/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Ms. Johnson', 'checkIn': '21/07', 'checkOut': '23/07'},



    ];
    roomDetails['CS01 - HIRUN FERNANDO'] = [
      {'guest': 'Mr. Fernando', 'checkIn': '21/07', 'checkOut': '23/07'},
      {'guest': 'Mr. Lee', 'checkIn': '22/07', 'checkOut': '24/07'}
    ];
  }

  void changeDate(DateTime date) {
    selectedDate.value = date;
  }

  void selectRoom(String room) {
    // Optional: handle room selection if needed
  }
}