import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:yasr/app/modules/entry_point/controllers/entry_point_controller.dart';
import 'package:yasr/app/modules/entry_point/views/splash_view.dart';

class EntryPointView extends GetView {
  @override
  Widget build(BuildContext context) {

  //AuthiocationController _auth = Get.put<AuthiocationController>(AuthiocationController());


    EntryPointController entryPointController = Get.put<EntryPointController>(EntryPointController());

    return SplashView();
  }
}
  