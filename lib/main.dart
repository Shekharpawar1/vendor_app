import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/bindings/login_binding.dart';
import 'package:fun_n_food_vendor/localization/language.dart';
import 'package:fun_n_food_vendor/localization/language_en.dart';
import 'package:fun_n_food_vendor/routes/appRoutes.dart';
import 'package:fun_n_food_vendor/view/home.dart';
import 'package:fun_n_food_vendor/view/profile.dart';
import 'package:fun_n_food_vendor/view/setting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'controller/bottomController.dart';
BaseLanguage  language=LanguagesEn();
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.Login,
        initialBinding: LoginBinding(),
      // home: MainPage(),
    );
  }
}


