//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:imei_plugin/imei_plugin.dart';
import 'package:yasr/app/modules/chat/Model/chatMessageModel.dart';

class ChatController extends GetxController {
  //TODO: Implement ChatController
 // CollectionReference users = FirebaseFirestore.instance.collection('users');
 // CollectionReference message =
  //    FirebaseFirestore.instance.collection('message');
  final box = GetStorage();

  String roomID;
  String uuid;
  String refid;
  TextEditingController textEditingController = new TextEditingController();

  adduser() async {
   /*// uuid = await ImeiPlugin.getId();
    users.doc(uuid).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        users.doc(uuid).set({'imei': uuid});
        print('Document add');
      }
    });
*/

  }
/*
  CollectionReference getuser() {
  //  return users;
  }
*/
  sendmsg() {
    ChatMessage chatMessage = new ChatMessage(
      msg: textEditingController.text.toString(),
      refuid: refid,
      uid: uuid,
    );
/*
    message
        .doc(roomID)
        .collection('message')
        .doc('${DateTime.now().millisecondsSinceEpoch}')
        .set(chatMessage.toJson());
*/
    textEditingController.clear();
  }
/*
  CollectionReference getmessage() {
    return true;
  //  return message.doc(roomID).collection('message');
  }
*/
  getChatMessage() {
    //CollectionReference
  /*  Stream<QuerySnapshot> querySnapshot =
        message.doc(roomID).collection('message').snapshots();
    print(querySnapshot.length);*/
  }
}
