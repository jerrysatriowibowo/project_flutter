import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project/app/providers/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  
  final formKey = GlobalKey<FormState>();
  RxBool showOption = false.obs;
  RxInt selectedIndex = 0.obs;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
    print("Selected Index: $index");
  }

  void setShowOption(bool value) {
    showOption.value = value;
    print("Show Option: $value");
  }

  var email = ''.obs;
  var password = ''.obs;

  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  Future<void> login() async {
    try {
      var response = await _performLogin();
      var responseBody = json.decode(response.body);

      if (response.statusCode == 200 && responseBody['token'] != null) {
        _saveUserData(responseBody);
        Get.offAllNamed('/bottom-menu');
      } else {
        Get.snackbar('Error', 'Login failed. ${responseBody['message']}');
      }
    } catch (e) {
      print('Error during login: $e');
      Get.snackbar('Error', 'An error occurred during login.');
    }
  }

  Future<http.Response> _performLogin() async {
    var apiUrl = '/login';
    var requestBody = {'email': email.value, 'password': password.value};

    var response = await http.post(
      Uri.parse(Api.baseUrl + apiUrl),
      body: requestBody,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );

    return response;
  }

  void _saveUserData(Map<String, dynamic> responseBody) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', responseBody['token']);
    localStorage.setString('user', json.encode(responseBody['user']));
  }
}