import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:yasr/app/services/services.dart';
import 'package:yasr/app/data/helper/AppConstant.dart';

class NotifactionProvider extends GetConnect {
  String token_id = Get.find<UserServices>() .getUserToken();
  Future<String> getNotifaction() async {
    final data = FormData({
      'key': apikey,
      'token_id': token_id,
      'limit': '20',
      'page_number': '0',
    });

    Response response =
        await post('$siteUrl/pages/get_list_notifications', data);

    if (response.body['status']) {
      
      return response.bodyString;
    } else {
      return Future.error(response.body['message']);
    }
  }
}
