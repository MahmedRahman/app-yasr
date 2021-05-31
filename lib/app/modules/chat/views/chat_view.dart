//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/data/helper/AppConstant.dart';
import 'package:yasr/app/modules/chat/Model/chatMessageModel.dart';
import 'package:yasr/app/modules/chat/controllers/chat_controller.dart';
import 'package:yasr/app/data/helper/AppTheme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatView extends GetView<ChatController> {
  final ScrollController listScrollController = ScrollController();
  final fb = FirebaseDatabase.instance;
  TextEditingController inputtext = new TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference();
    final Future<FirebaseApp> _future = Firebase.initializeApp();

    return Scaffold(
      appBar: AppBar(
        title: Text('اسم الطلب'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<Object>(
                stream: ref.child('chat').child(RoomId).onValue,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    Event e = snapshot.data;

                    Map<dynamic, dynamic> map = e.snapshot.value;

                    List<dynamic> MsgList = map.values.toList();
                    MsgList.sort((a, b) {
                      return b["createdAt"].compareTo(a["createdAt"]);
                    });
                    return ListView(
                      reverse: true,
                      children: List.generate(MsgList.length, (index) {
                        return ListTile(
                          title: Text(MsgList.elementAt(index)['message']),
                        );
                      }),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: inputtext,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              )),
              IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    ChatMessage chatMessage = new ChatMessage(
                      message: inputtext.text,
                      createdAt: DateTime.now().toString(),
                    );
                    ref
                        .child('chat')
                        .child(RoomId)
                        .push()
                        .set(chatMessage.toJson());

                    inputtext.clear();
                  })
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );

    /*Scaffold(
      appBar: AppBar(
        title: Text('ChatView'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: controller.getmessage().snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return Expanded(
                child: SingleChildScrollView(
                  controller: listScrollController,
                  child: Column(

                    verticalDirection: VerticalDirection.down ,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                     
                      children: snapshot.data.docs.map((e) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.red,
                            child: Text(e.data()['msg']),
                          ),
                        );
                      }).toList()),
                ),
              );
            },
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller.textEditingController,
                          decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          controller.sendmsg();
                          listScrollController.animateTo(listScrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOut);
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                        backgroundColor: AppTheme().colorPrimary,
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );*/
  }
}
