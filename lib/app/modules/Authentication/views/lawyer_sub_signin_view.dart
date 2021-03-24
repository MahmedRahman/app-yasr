import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class LawyerSubSigninView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LawyerSubSigninView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LawyerSubSigninView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  