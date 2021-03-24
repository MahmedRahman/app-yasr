//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/chat/controllers/chat_controller.dart';
import 'package:yasr/app/routes/app_pages.dart';

class ChatUserView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    controller.adduser();
    return Text('data');
    
    /* Scaffold(
      appBar: AppBar(
        title: Text('ChatUserView'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: controller.getuser().snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              print('xxxxxx');
              print(controller.uuid);
              return controller.uuid != document.data()['imei']
                  ? Card(
                      child: new ListTile(
                        onTap: () {
                          String groupChatId;
                          String uid = controller.uuid;
                          String prefs = document.data()['imei'].toString();

                          if (uid.hashCode <= prefs.hashCode) {
                            groupChatId = '$uid-$prefs';
                          } else {
                            groupChatId = '$prefs-$uid';
                          }
                          controller.refid = document.data()['imei'].toString();
                          controller.roomID = groupChatId;

                          Get.toNamed(Routes.ChatView);
                        },
                        title: new Text(document.data()['imei']),
                      ),
                    )
                  : Text('This is me');
            }).toList(),
          );
        },
      ),
    );*/
  }
}
