import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../utils/helper/api_helper.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  TextEditingController UsernameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController HotelCodeController = TextEditingController();
  final box = GetStorage();
  final Formkey = GlobalKey<FormState>();
  RxBool isVisible = false.obs;

  // RegExp emailReg = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  RegExp passReg = RegExp(r'^(?=.*[A-Z])(?=.*[!@#\$&*~])(?=.*[0-9]).{8,}$');

  isPasswordVisible() {
    print("function called");
    isVisible.toggle();
    update();
  }


  formValidation() {
    if (Formkey.currentState!.validate()) {
      // Get.offAllNamed("/bottomNav");
      loginUser();
    }
    else {
      UsernameController.dispose();
      PasswordController.dispose();
      HotelCodeController.dispose();
      Get.snackbar("Error", "Form validation failed");
    }
  }

  var isLoading = false.obs;
  late LoginModel loginModel;
  Future<void> loginUser() async {
    isLoading.value = true;
    try {
      Map<String, String> data = {
        'username': UsernameController.text.trim(),
        'password': PasswordController.text.trim(),
        'loginTyp': 'owner',
        // 'hotel_code': HotelCodeController.text.trim(),
      };

      final response = await http.post(Uri.parse(loginApi), body: data);

      print('Status Code ---> ${response.statusCode}');
      print('Data ---> ${jsonEncode(data)}');
      print('Response Body ---> ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        loginModel = LoginModel.fromJson(decodedData);

        // Store data in box
        box.write("userData", decodedData['data']);

        // Store token
        String? token = loginModel.data?.accessToken;
        String? id = loginModel.data?.user?.id.toString(); // Make sure id is converted to String if needed
        if (token != null) {
          box.write("access_token", token);
        }
        if (id != null) {
          box.write("user_id", id); // Changed to "user_id" to distinguish from access token
        }
        Get.offAllNamed("/bottomNav");
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar("Alert", "Please check credentials", snackPosition: SnackPosition.BOTTOM);
        });
      }
    } catch (err) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar("Alert", "Something went wrong!!", snackPosition: SnackPosition.BOTTOM);
      });
    } finally {
      isLoading.value = false; // Set loading to false in the finally block
    }
  }

}