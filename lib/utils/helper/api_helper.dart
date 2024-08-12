final  String Base_url='https://funresort.digiatto.online';

final String API_V1_PATH = '/api/';

final String BaseUrl = Base_url+API_V1_PATH;

final String loginApi=BaseUrl+"login";
final String allBookingRequest=BaseUrl+'booking/all-request';
final String changeHotelStatusApi=Base_url+"";
final String audioTrail = BaseUrl+'report/booking-actions';
final String extraCharges = BaseUrl+'manage/add-charge';

///Booking list api
final String booking = Base_url+API_V1_PATH+"booking/";

final String dashboardApi=booking+"dashboard";
final String allBooking = booking+"all-booking";
final String bookingDetail = booking+"booking-detail";
final String inHouseBooking = booking+"";
final String arrival = booking+"pending-check-in";
final String departure = booking+"upcoming/checkout";
final String todayDeparture = booking+"delay-checkout";