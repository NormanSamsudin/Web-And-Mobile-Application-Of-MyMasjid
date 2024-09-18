import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


final providerContainer = ProviderContainer();

class MosqueController {

  Future<void> setMosqueId(
    String id,
  ) async {
    //access sharedPreferences for token and user data storage
    SharedPreferences preferences = await SharedPreferences.getInstance();

    //String mosqueId = '66ea2d0f948e462d23821a23';

    //Store the token in shared preferences
    await preferences.setString('mouque_id', id);
  }

  Future<String?> getMosqueId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    debugPrint('my token ${preferences.getString('mouque_id')}');
    return preferences.getString('mouque_id');
  }
}
