import 'package:get/get_connect/connect.dart';

import 'package:yasr/app/data/helper/AppConstant.dart';

class AppSettingsProvider extends GetConnect {
  Future aboutPage() async {
    final data = FormData({
      'key': apikey,
    });
    Response response = await post('$siteUrl/pages/about', data);
    print(response.bodyString);
    if (response.body['status']) {
      
      return response.body['result']['about'];
    } else {
      return Future.error(response.body['message']);
    }
  }


  Future termsConditionsPage() async {
    final data = FormData({
      'key': apikey,
    });
    Response response = await post('$siteUrl/pages/terms_conditions', data);
    if (response.body['status']) {
      return response.body['result']['terms'];
    } else {
      return Future.error(response.body['message']);
    }
  }
  
}
