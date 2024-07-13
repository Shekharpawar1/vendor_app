import 'package:get/get.dart';

class RatingController extends GetxController{

  RxDouble overRating=0.0.obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updateValue();
  }

  RxList DetailedRatingList=[].obs;
  List detailsRating=[
    DetailsRatingClass(title: 'cleanlines', rating: 10.0, percentage: 10.0),
  DetailsRatingClass(title: 'comfort', rating: 10.0, percentage: 10.0),
  DetailsRatingClass(title: 'facilities', rating: 10.0, percentage: 10.0),
  DetailsRatingClass(title: 'food & drinks', rating: 10.0, percentage: 10.0),
  DetailsRatingClass(title: 'free wifi', rating: 10.0, percentage: 10.0),
  DetailsRatingClass(title: 'hotel condition', rating: 10.0, percentage: 10.0),
  DetailsRatingClass(title: 'location', rating: 10.0, percentage: 10.0),
  DetailsRatingClass(title: 'room', rating: 10.0, percentage: 10.0),
  DetailsRatingClass(title: 'services', rating: 10.0, percentage: 10.0),
  DetailsRatingClass(title: 'staff', rating: 10.0, percentage: 10.0),
  DetailsRatingClass(title: 'value for money', rating: 10.0, percentage: 10.0),];
  updateValue(){
    overRating.value=10.0;
    DetailedRatingList.assignAll(detailsRating);
    update();
  }



}

class DetailsRatingClass {
  String title;
  double rating;
  double percentage;
  DetailsRatingClass({
    required this.title,
    required this.rating,
    required this.percentage,
});
}




