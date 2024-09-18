import 'dart:convert';
import 'package:flutter_application/models/user.dart';

class Review {
  final String userId;
  final String message;
  final String rating;
  final String date;
  final String imageUrl;

  Review(
      {required this.userId,
      required this.message,
      required this.rating,
      required this.date,
      required this.imageUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "userId": userId,
      "mesasge": message,
      "rating": rating,
      "date": date,
      "imageUrl": imageUrl
    };
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(Map<String, dynamic> map) {
    return Review(
      userId: map['userId'] as String,
      message: map['message'] as String,
      rating: map['rating'] as String,
      date: map['date'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
