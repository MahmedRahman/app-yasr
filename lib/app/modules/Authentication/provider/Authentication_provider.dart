import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:yasr/app/data/helper/AppConstant.dart';

class AuthenticationProvider extends GetConnect {
  Future signinClient({
    @required phone,
    @required idNumber,
  }) async {
    final data = FormData({
      'key': apikey,
      'phone': phone,
      'id_number': idNumber,
      'client_type': '0',
      'firebase_token': '',
    });

    Response response = await post('$siteUrl/agents/agent_login', data);

    print(response.body['status']);

    switch (response.body['status']) {
      case true:
        return response.bodyString;
        break;
      case false:
        return Future.error(response.bodyString);
        break;
      default:
    }
  }

  Future createClientAccount({
    @required fullname,
    @required address,
    @required phone,
    @required idNumber,
    @required cityId,
  }) async {
    final data = FormData({
      'key': apikey,
      'fullname': fullname,
      'address': address,
      'phone': phone,
      'id_number': idNumber,
      'city_id': cityId,
      'client_type': '0',
    });
    Response response = await post('$siteUrl/agents/create_account', data);

    switch (response.body['status']) {
      case true:
        return response.bodyString;
        break;
      case false:
        return Future.error(response.body['message']);
        break;
      default:
    }
  }


  Future createLawyerAccount({
    @required fullname,
    @required address,
    @required phone,
    @required idNumber,
    @required cityId,
  }) async {
    final data = FormData({
      'key': apikey,
      'fullname': fullname,
      'address': address,
      'phone': phone,
      'id_number': idNumber,
      'city_id': cityId,
      'client_type': '1',
      'lawyer_type' : '0'
    });
    Response response = await post('$siteUrl/agents/create_account', data);

    switch (response.body['status']) {
      case true:
        return response.bodyString;
        break;
      case false:
        return Future.error(response.body['message']);
        break;
      default:
    }
  }

 Future signinLawyer({
    @required phone,
    @required idNumber,
  }) async {
    final data = FormData({
      'key': apikey,
      'phone': phone,
      'id_number': idNumber,
      'client_type': '1',
      'firebase_token': '',
    });

    Response response = await post('$siteUrl/agents/agent_login', data);

    print(response.body['status']);

    switch (response.body['status']) {
      case true:
        return response.bodyString;
        break;
      case false:
        return Future.error(response.bodyString);
        break;
      default:
    }
  }



  Future smsSend({
    @required phone,
  }) async {
    final data = FormData({
      'key': apikey,
      'phone': phone,
      'client_type': '0',
    });
    Response response = await post('$siteUrl/agents/send_sms', data);
    switch (response.body['status']) {
      case true:
        return response.bodyString;
        break;
      case false:
        return Future.error(response.body['error']);
        break;
      default:
    }
  }

  Future smsConfirm({
    @required phone,
    @required activationCode,
  }) async {
    final data = FormData({
      'key': apikey,
      'phone': phone,
      'activation_code': activationCode,
      'client_type' : '0',
    });

    Response response = await post('$siteUrl/agents/confirm', data);


print(response.bodyString);

    switch (response.body['status']) {
      case true:
        return response.bodyString;
        break;
      case false:
        return Future.error(response.body['message']);
        break;
      default:
    }
  }
}
