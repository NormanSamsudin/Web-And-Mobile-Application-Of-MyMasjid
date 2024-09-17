import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/models/banner.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/glabal_variable.dart';

class BannerController {
  // fetch banner
  Future<List<BannerModel>> loadBanners() async {
    try {
      http.Response response = await http
          .get(Uri.parse("$uri/api/v1/banners"), headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      });

      debugPrint(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        if (decodedData.containsKey('data') &&
            decodedData['data'] != null) {
          List<dynamic> bannersList = decodedData['data'];

          // Map the list of banners to BannerModel instances
          List<BannerModel> banners = bannersList
              .map((banner) =>
                  BannerModel.fromJson(banner as Map<String, dynamic>))
              .toList();

          return banners;
        } else {
          return []; // Return an empty list if no banners are found
        }
      } else {
        throw Exception('Failed to load Banners');
      }
    } catch (e) {
      throw Exception('Error load Banners');
    }
  }
}
