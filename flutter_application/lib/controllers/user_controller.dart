import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application/models/user.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:flutter_application/provider/user_provider.dart';
import 'package:flutter_application/services/manage_http_response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/views/screens/authentication/login_screen.dart';
import 'package:flutter_application/views/screens/main_screen.dart';

final providerContainer = ProviderContainer();

class UserController {
  
   Future<String> getUserToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Retrieve the stored auth token
    String? authToken = preferences.getString('auth_token');
    return authToken.toString(); 
  }

  //  Future<Map<String, dynamic>> getUserData() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();

  //   // Retrieve the stored user data as a JSON string
  //   String? userDataString = preferences.getString('user');

  //   if (userDataString != null) {
  //     // Decode the JSON string to a map
  //     Future<Map<String, dynamic>> userMap = jsonDecode(userDataString);

  //     // Return the fullName from the map
  //     return userMap;
  //   } else {
  //     return {};
  //   }
  // }

    Future<String> getUserFullname() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    // Retrieve the stored user data as a JSON string
    String? userDataString = preferences.getString('user');

    if (userDataString != null) {
      // Decode the JSON string to a map
      Map<String, dynamic> userMap = jsonDecode(userDataString);

      // Return the fullName from the map
      ///debugPrint('fullName: ' + userMap['fullName']);
      return userMap['fullName'];
    } else {
      return '';
    }
  }
}
