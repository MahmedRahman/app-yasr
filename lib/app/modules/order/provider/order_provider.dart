import 'package:get/get.dart';
import 'package:yasr/app/services/services.dart';
import 'package:yasr/app/utils/AppConstant.dart';

class OrderProvider extends GetConnect {
  String token_id = Get.find<UserServices>().getUserToken();

  Future<String> getClientOrderList() async {
    final data =
        FormData({'key': apikey, 'token_id': token_id, 'key_type': '0'});

    Response response = await post('$siteUrl/user_api/get_home', data);

    if (response.body['status']) {
      return response.bodyString;
    } else {
      return Future.error(response.body['message']);
    }
  }

  Future createClientOrder({
    String requested_type,
    String client_type,
    String requested_state,
    String requested_title,
    String requested_description,
  }) async {
    final data = FormData({
      'key': apikey,
      'token_id': token_id,
      'client_type': client_type,
      'requested_type': requested_type,
      'requested_state': requested_state,
      'requested_title': requested_title,
      'requested_description': requested_description,
    });

    Response response = await post('$siteUrl/user_api/add_request', data);

    print(response.bodyString);

    if (response.body['status']) {
      return response.body['message'];
    } else {
      return Future.error(response.body['message']);
    }
  }

  Future<String> getClientOrderDetailes(String id_request) async {
    final data = FormData({
      'key': apikey,
      'token_id': token_id,
      'id_request': id_request,
    });

    Response response = await post('$siteUrl/user_api/request_details', data);

    if (response.body['status']) {
      return response.bodyString;
    } else {
      return Future.error(response.body['message']);
    }
  }
}
