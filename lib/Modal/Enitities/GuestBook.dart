import 'package:flutter/material.dart';

class Guestbook {
  String bookId;
  String userId;
  String timestamp;
  String description;
  String name;
  double dataDouble;
  int dataInt;
  bool dataBool;

  Guestbook(
      {this.bookId,
      @required this.userId,
      @required this.timestamp,
      @required this.description,
      @required this.name,
      @required this.dataDouble,
      @required this.dataInt,
      @required this.dataBool});

  factory Guestbook.fromJson(Map<String, dynamic> json) {
    return Guestbook(
      userId: json['userId'],
      timestamp: json['timestamp'],
      description: json['description'],
      name: json['name'],
      dataDouble: json['dataDouble'],
      dataInt: json['dataInt'],
      dataBool: json['dataBool'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bookId': bookId,
      'userId': userId,
      'timestamp': timestamp,
      'description': description,
      'name': name,
      'dataDouble': dataDouble,
      'dataInt': dataInt,
      'dataBool': dataBool
    };
  }
}
