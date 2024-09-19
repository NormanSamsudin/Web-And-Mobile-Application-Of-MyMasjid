import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_application/models/user.dart';

class ActivityModel {
  final String id;
  final String mosqueId;
  final String programName;
  final String speaker;
  final DateTime createdAt;
  final String imageUrl;

  ActivityModel(
      {required this.id,
      required this.mosqueId,
      required this.programName,
      required this.speaker,
      required this.createdAt,
      required this.imageUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "_id": id,
      "mosqueId": mosqueId,
      "programName": programName,
      "speaker": speaker,
      "createdAt": createdAt.toString(),
      "imageUrl": imageUrl
    };
  }

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromJson(Map<String, dynamic> map) {
    return ActivityModel(
      id: map['_id'] as String,
      mosqueId: map['mosqueId'] as String,
      programName: map['programName'] as String,
      speaker: map['speaker'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      imageUrl: map['imageUrl'] as String,
    );
  }
}
