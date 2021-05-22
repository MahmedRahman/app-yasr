import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/api/api_manger.dart';
import 'package:yasr/app/api/response_model.dart';
import 'package:yasr/app/services/auth.dart';

class WebServices extends APIManger {
  String tokan = Get.find<UserServices>().getUserToken();
  String api_key = '1234567890';

  getRequestLawer(int tabid) async {
    ResponsModel response = await repPost(
        'provider/get_home',
        {
          'key': api_key,
          'token_id': tokan,
          'key_type': tabid,
        },
        showLoading: true);
    return response;
  }

  getRequestDetails(int id_request) async {
    ResponsModel response = await repPost('provider/get_request_details', {
      'key': api_key,
      'token_id': tokan,
      'id_request': id_request,
    });
    return response;
  }

  addLawyerOffer(
      int id_request, String title_offer, String title_description) async {
    ResponsModel response = await repPost(
        'provider/add_lawyer_offer',
        {
          'key': api_key,
          'token_id': tokan,
          'id_request': id_request,
          'title_offer': title_offer,
          'title_description': title_description
        },
        showLoading: true);
    return response;
  }

  offerDeatiles({@required int id_request, @required int id_lawyer}) async {
    ResponsModel response = await repPost(
        'user_api/request_details_lawyer',
        {
          'key': api_key,
          'token_id': tokan,
          'id_request': id_request,
          'id_lawyer': id_lawyer
        },
        showLoading: true);
    return response;
  }

  chose_lawyer({
    @required String payment_value,
    @required String id_lawyer,
    @required String id_offer,
    @required String id_request,
  }) async {
    ResponsModel response = await repPost(
        'user_api/chose_lawyer',
        {
          'key': api_key,
          'token_id': tokan,
          'lawyer_id': id_lawyer,
          'id_offer': id_offer,
          'id_request': id_request,
          'payment_value': payment_value
        },
        showLoading: true);
    return response;
  }

  Future createClientOrder({
    String requested_type,
    String client_type,
    String requested_state,
    String requested_title,
    String requested_description,
    File file,
  }) async {
    /*
    final data = FormData({
      'key': api_key,
      'token_id': tokan,
      'client_type': client_type,
      'requested_type': requested_type,
      'requested_state': requested_state,
      'requested_title': requested_title,
      'requested_description': requested_description,
      //'requested_img1': MultipartFile(file, filename: 'temp.jpg')
    });
*/
    ResponsModel response = await repPost(
      'user_api/add_request',
      {
        'key': api_key,
        'token_id': tokan,
        'client_type': client_type,
        'requested_type': requested_type,
        'requested_state': requested_state,
        'requested_title': requested_title,
        'requested_description': requested_description,
        //'requested_img1': MultipartFile(file, filename: 'temp.jpg')
      },
      showLoading: true,
    );

    return response;
  }

  Future getClientOrderList({@required int requestType}) async {
    ResponsModel response = await repPost(
        'user_api/get_home',
        {
          'key': api_key,
          'token_id': tokan,
          'key_type': requestType,
        },
        showLoading: true);

    return response;
  }

  Future getClientOrderDetailes(String id_request) async {
    ResponsModel response = await repPost(
        'user_api/request_details',
        {
          'key': api_key,
          'token_id': tokan,
          'id_request': id_request,
        },
        showLoading: true);
    return response;
  }

  signin({
    @required phone,
    @required password,
    @required String user_type,
  }) async {
    ResponsModel response = await repPost(
      'agents/agent_login',
      {
        'key': api_key,
        'phone': phone,
        'password': password,
        'client_type': user_type,
        'firebase_token': '',
      },
      showLoading: true,
    );
    return response;
  }

  createClientAccount({
    @required fullname,
    @required address,
    @required phone,
    @required idNumber,
    @required cityId,
    @required password,
  }) async {
    ResponsModel response = await repPost(
        'agents/create_account',
        {
          'key': api_key,
          'fullname': fullname,
          'address': address,
          'phone': phone,
          'id_number': idNumber,
          'city_id': cityId,
          'client_type': '0',
          'password': password
        },
        showLoading: true);
    return response;
  }

  smsSend({
    @required phone,
    @required int userType,
  }) async {
    ResponsModel response = await repPost(
        'agents/send_sms',
        {
          'key': api_key,
          'phone': int.parse(phone),
          'client_type': userType,
        },
        showLoading: true);

    return response;
  }

  smsConfirm({
    @required phone,
    @required activationCode,
    @required int userType,
  }) async {
    //var formData = new FormData();

    ResponsModel response = await repPost(
        'agents/confirm',
        {
          'key': api_key,
          'phone': int.parse(phone),
          'activation_code': int.parse(activationCode),
          'client_type': userType,
        },
        showLoading: true);

    return response;
  }

  createLawyerAccount({
    @required fullname,
    @required address,
    @required phone,
    @required idNumber,
    @required cityId,
  }) async {
    ResponsModel response = await repPost(
        'agents/create_account',
        {
          'key': api_key,
          'fullname': fullname,
          'address': address,
          'phone': phone,
          'id_number': idNumber,
          'city_id': cityId,
          'client_type': '1',
          'lawyer_type': '0'
        },
        showLoading: true);

    return response;
  }
}
