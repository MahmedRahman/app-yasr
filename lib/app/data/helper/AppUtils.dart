import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/data/helper/AppTheme.dart';



class AppUtils {
  showSnackBar({
    @required String title,
    @required String message,
    @required Function onstatusBarClosed,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppTheme().colorPrimary,
      colorText: Colors.white,
      overlayBlur: 4,
      borderWidth: 2,
      margin: EdgeInsets.all(10),
      borderColor: AppTheme().colorAccent,
      snackbarStatus: (value) {

        if (value == SnackbarStatus.CLOSED){
          onstatusBarClosed();
        }
        //onstatusBarClosed(value);
      },
    );
  }
}
