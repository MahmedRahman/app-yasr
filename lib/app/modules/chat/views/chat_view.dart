//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/chat/Model/chatMessageModel.dart';
import 'package:yasr/app/modules/chat/controllers/chat_controller.dart';
import 'package:yasr/app/utils/AppTheme.dart';

class ChatView extends GetView<ChatController> {
 
  final ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Text('data');
    
    
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
