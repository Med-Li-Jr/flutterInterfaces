
import 'package:flutter/material.dart';

class Guestbook {
   String bookId;
   String userId;
   String timestamp;
   String text;
   String name;

  Guestbook({this.bookId, @required this.userId, @required this.timestamp, @required this.text, @required this.name});

  factory Guestbook.fromJson(Map<String, dynamic> json){
    return Guestbook(  
      userId: json['userId'],
      timestamp: json['timestamp'],
      text: json['text'],
      name: json['name']
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'bookId': bookId,
      'userId': userId,
      'timestamp':timestamp,
      'text':text,
      'name':name
    };
  }
}