import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yasr/app/services/auth.dart';

class ChatMessage {
  final String apiToken;
  final String createdAt;
  final String message;
  final String messageType;
  final String senderName;
  final String userType;

  ChatMessage({
    this.apiToken = '00000000000000',
     @required this.createdAt ,
    @required this.message,
    this.messageType = 'text',
   @required this.senderName  ,
    this.userType = '0',
  });

  Map<String, dynamic> toJson() => {
        'apiToken': apiToken,
        'createdAt': createdAt,
        'message': message,
        'messageType': messageType,
        'senderName': senderName,
        'userType': userType,
      };
/*
  static ChatMessage fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      msg: json['msg'],
      uid: json['uid'],
      refuid: json['refuid'],
    );
  }

  */
}
