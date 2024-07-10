
import 'package:get/get.dart';
import '../helper/styles.dart' as sl;
import '../main.dart';

class Homecontroller extends GetxController{
  RxString title=''.obs;
  void onInit(){
    super.onInit();
    getCalled();
  }
  List item = [

    CountOccupancy(title: 'Void', count: 0),
    CountOccupancy(title: 'Cancelled', count: 0),
    CountOccupancy(title: 'No Show', count: 0),
    ];
  List item2 = [

    CountOccupancy(title: 'Total Review', count: 0),
    CountOccupancy(title: 'Positive', count: 0),
    CountOccupancy(title: 'Negative', count: 0),
  ];

  getCalled(){
    title.value='shekhar';
    print("homeCalled");
    update();
  }
}


class CountOccupancy{
  String title;
  int count;
  CountOccupancy({
    required this.title,
    required this.count,
});
}