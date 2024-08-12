import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  Timer? _timer;
  final GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _redirect();
  }

  @override
  void onReady() {
    super.onReady();
    _redirect(); // Automatically handle redirection after splash screen
  }

  Future<void> _redirect() async {
    _timer = Timer(
      const Duration(milliseconds: 3000), // Adjusted duration if needed
          () async {
        final userId = box.read("user_id");
        if (userId == null || userId.isEmpty) {
          Get.offNamed("/login");
        } else {
          Get.offNamed("/bottomNav");
        }
      },
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
