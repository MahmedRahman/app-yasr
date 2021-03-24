import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserActivateView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'برجا الانتظار حتى يتم التأكد من البيانات المدخلة وسوف يتم تفعيل حسابك في اقرب وقت',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
