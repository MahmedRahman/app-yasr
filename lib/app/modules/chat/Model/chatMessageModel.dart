import 'package:flutter/material.dart';

class ChatMessage {
  final String uid;
  final String refuid;
  final String msg;

  ChatMessage( {@required this.uid, @required this.refuid, @required this.msg});

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'refuid': refuid,
        'msg': msg,
      };

  static ChatMessage fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      msg: json['msg'],
      uid: json['uid'],
      refuid: json['refuid'],
    );
  }
}
