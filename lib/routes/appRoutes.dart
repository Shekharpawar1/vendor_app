

import 'package:fun_n_food_vendor/main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../bindings/homeBinding.dart';
import '../bindings/login_binding.dart';
import '../bindings/notificationBinding.dart';
import '../bindings/profileBinding.dart';
import '../bindings/settingBinding.dart';
import '../view/BottomNav.dart';
import '../view/Loginscreen.dart';
import '../view/home.dart';
import '../view/notification.dart';
import '../view/profile.dart';
import '../view/setting.dart';

class AppRoutes {
  static const home = '/home';
  static const profile = '/profile';
  static const settings = '/settings';
  static const bottomNav = '/bottomNav';
  static const Notification = '/notification';
  static const Login='/login';

  static const initialRoute="/login";

  static final routes = [

    GetPage(name: home, page: () => HomeScreen(),binding: HomeBinding()),
    GetPage(name: profile, page: () => ProfileScreen(),binding: ProfileBinding()),
    GetPage(name: settings, page: () => SettingScreen(),binding:SettingBinding()),
    GetPage(name: Notification, page: () => NotificationScreen(),binding:NotificationBinding()),
    GetPage(name: Login, page: () => Loginscreen(),binding:LoginBinding()),
    GetPage(name: bottomNav, page: () => MainPage()),
  ];
}
