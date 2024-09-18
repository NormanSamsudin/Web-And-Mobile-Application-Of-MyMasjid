import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/models/activity.dart';
import 'package:flutter_application/models/review.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/glabal_variable.dart';

class ActivityController {
  // fetch banner
  Future<List<ActivityModel>> loadActivity() async {
    try {
      http.Response response = await http
          .get(Uri.parse("$uri/api/v1/activities"), headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      });

      debugPrint(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        if (decodedData.containsKey('data') && decodedData['data'] != null) {
          List<dynamic> reviewsList = decodedData['data'];

          // Map the list of banners to BannerModel instances
          List<ActivityModel> reviews = reviewsList
              .map((banner) =>
                  ActivityModel.fromJson(banner as Map<String, dynamic>))
              .toList();
          return reviews;
        } else {
          return []; // Return an empty list if no banners are found
        }
      } else {
        throw Exception('Failed to load Activities');
      }
    } catch (e) {
      throw Exception('Error load Activities $e');
    }
  }
}