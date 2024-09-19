import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_application/models/user.dart';

class LostModel {
  final String id;
  final String mosqueId;
  final String imageUrl;
  final String status;

  LostModel(
      {required this.id,
      required this.mosqueId,
      required this.imageUrl,
      required this.status});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "_id": id,
      "mosqueId": mosqueId,
      "imageUrl": imageUrl,
      "status": status
    };
  }

  String toJson() => json.encode(toMap());

  factory LostModel.fromJson(Map<String, dynamic> map) {
    return LostModel(
      id: map['_id'] as String,
      mosqueId: map['mosqueId'] as String,
      imageUrl: map['imageUrl'] as String,
      status: map['status'] as String,
    );
  }
}
