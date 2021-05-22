import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_provider_controller.dart';

class OrderProviderView extends GetView<OrderProviderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrderProviderView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OrderProviderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
