import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_application/models/user.dart';

class AboutModel {
  final String id;
  final String mosqueId;
  final String fullName;
  final String position;
  final String contact;
  final String imageUrl;


  AboutModel(
      {required this.id,
      required this.mosqueId,
      required this.fullName,
      required this.position,
      required this.contact,
      required this.imageUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "_id": id,
      "mosqueId": mosqueId,
      "fullName": fullName,
      "position": position,
      "contact": contact,
      "imageUrl": imageUrl
    };
  }

  String toJson() => json.encode(toMap());

  factory AboutModel.fromJson(Map<String, dynamic> map) {
    return AboutModel(
      id: map['_id'] as String,
      mosqueId: map['mosqueId'] as String,
      fullName: map['fullName'] as String,
      position: map['position'] as String,
      contact: map['contact'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
