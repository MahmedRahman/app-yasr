import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class TechnicalSupporDetailesView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TechnicalSupporDetailesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TechnicalSupporDetailesView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  