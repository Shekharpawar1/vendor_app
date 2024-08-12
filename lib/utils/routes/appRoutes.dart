import 'package:fun_n_food_vendor/bindings/booking/quick_booking_binding.dart';
import 'package:fun_n_food_vendor/bindings/bottom_binding.dart';
import 'package:fun_n_food_vendor/bindings/edit%20guest%20binding/editGuestBinding.dart';
import 'package:fun_n_food_vendor/bindings/maintenence_binding.dart';
import 'package:fun_n_food_vendor/bindings/manager_report_binding.dart';
import 'package:fun_n_food_vendor/bindings/quick_view_binding.dart';
import 'package:fun_n_food_vendor/bindings/rating/ReviewListBinding.dart';
import 'package:fun_n_food_vendor/bindings/critiqueBinding.dart';
import 'package:fun_n_food_vendor/bindings/rating/rating_binding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../bindings/adguestinfobinding.dart';
import '../../bindings/auth/login_binding.dart';
import '../../bindings/booking_list_binding.dart';
import '../../bindings/bookingdetailsBinding.dart';
import '../../bindings/homeBinding.dart';
import '../../bindings/home_status_binding.dart';
import '../../bindings/notificationBinding.dart';
import '../../bindings/profileBinding.dart';
import '../../bindings/settingBinding.dart';
import '../../bindings/work_order_binding.dart';
import '../../features/AddGuestProfileScreen.dart';
import '../../features/Booking/view/quickBooking.dart';
import '../../features/booking_details/view/BookingDetails.dart';
import '../../features/bookingList/view/bookingList.dart';
import '../../features/edit_guest_info/view/editGuestProfile.dart';
import '../../features/home/view/BottomNav.dart';
import '../../features/auth/view/Loginscreen.dart';
import '../../features/home/view/home.dart';
import '../../features/home_Status_screen.dart';
import '../../features/maintainence_blockList.dart';
import '../../features/manager_report.dart';
import '../../features/notification.dart';
import '../../features/other/critique_dashboard.dart';
import '../../features/profile.dart';
import '../../features/quickViewScreen.dart';
import '../../features/rating/rating.dart';
import '../../features/rating/review_list.dart';
import '../../features/setting.dart';
import '../../features/work_order_list.dart';


class AppRoutes {
  static const home = '/home';
  static const profile = '/profile';
  static const settings = '/settings';
  static const bottomNav = '/bottomNav';
  static const Notification = '/notification';
  static const Login='/login';
  static const BookingList='/bookingList';
  static const CritiqueDashboardScreen='/CritiqueDashboard';
  static const ReviewList='/reviewList';
  static const ratingScreen='/ratingScreen';
  static const quickView='/quickView';
  static const quickbooking='/quickbooking';
  static const workorder='/workorder';
  static const initialRoute="/login";
  static const MaintenenceBlock="/MaintenenceBlockView";
  static const managerReport="/ManagerReport";
  static const Homestatus="/homeStatus";
  static const GuestProfile="/Guestprofile";
  static const bookingDetails="/bookingDetails";
  static const addGuestInfo="/addGuestInfo";
  static const editGuestInfo="/editGuestInfo";
  static final routes = [
    GetPage(
        name: home,
        page: () => HomeScreen(),
        binding: HomeBinding()
    ),
    GetPage(
        name: profile,
        page: () => ProfileScreen(),
        binding: ProfileBinding()
    ),
    GetPage(
        name: settings,
        page: () => SettingScreen(),
        binding:SettingBinding()
    ),
    GetPage(
        name: Notification,
        page: () => NotificationScreen(),
        binding:NotificationBinding()
    ),
    GetPage(
        name: Login,
        page: () => Loginscreen(),
        binding:LoginBinding()
    ),
    GetPage(
        name: bottomNav,
        page: () => MainPage(),
        binding: BottomNavBinding()
    ),
    GetPage(
        name: BookingList,
        page: () => BookingListScreen(title: '',),
        binding: BookingListBinding()
    ),
    GetPage(
        name: CritiqueDashboardScreen,
        page: () => CritiqueDashboard(),
        binding: CritiqueBinding()
    ),
    GetPage(
        name: ReviewList,
        page: () => ReviewListScreen(),
        binding: Reviewlistbinding()
    ),
    GetPage(
        name: ratingScreen,
        page: () =>RatingScreen(),
        binding: RatingBinding()
    ),
    GetPage(
        name: quickView,
        page: () =>Quickviewscreen(),
        binding:QuickViewBinding()
    ) ,
    GetPage(
        name: quickbooking,
        page: () =>Quickbooking(),
        binding:QuickBookingBinding()
    ) ,
    GetPage(
        name: workorder,
        page: () =>WorkOrderList(title: 'Work Order List'),
        binding:WorkOrderListBinding()
    ) ,
    GetPage(
        name: MaintenenceBlock,
        page: () =>MaintenenceBlockView(),
        binding:MaintenenceBinding()
    ),
    GetPage(
        name: managerReport,
        page: () =>ManagerReportScreen(),
        binding:ManagerReportBinding()
    ) ,
    GetPage(
        name: Homestatus,
        page: () =>HouseStatusScreen(),
        binding:HomeStatusBinding()
    ) ,
    GetPage(
        name: GuestProfile,
        page: () =>HouseStatusScreen(),
        binding:HomeStatusBinding()
    ) ,
    // GetPage(
    //     name: bookingDetails,
    //     // page: () =>BookingDetails(),
    //     binding:BookingDetailsbinding()
    // ) ,
    GetPage(
        name: addGuestInfo,
        page: () =>AddGuestInfo(),
        binding:Adguestinfobinding()
    ) ,
    GetPage(
        name: editGuestInfo,
        page: () =>EditGuest(),
        binding:Editguestbinding()
    ) ,
  ];
}
