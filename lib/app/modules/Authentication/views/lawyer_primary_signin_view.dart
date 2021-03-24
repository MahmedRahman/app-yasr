import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class LawyerPrimarySigninView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LawyerPrimarySigninView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LawyerPrimarySigninView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  