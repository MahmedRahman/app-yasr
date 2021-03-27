import 'package:get/get.dart';
import 'package:yasr/app/services/auth.dart';
import 'package:yasr/app/data/helper/AppConstant.dart';

class TechnicalSupporProvider extends GetConnect {

        

          
  String token_id = Get.find<UserServices>() .getUserToken();

  Future getTickets() async {
    final data = FormData({
      'key': apikey,
      'token_id': token_id,
      'limit': '20',
      'page_number': '0',
      'lang': 'en',
    });

    Response response = await post('$siteUrl/pages/tickets', data);

    if (response.body['status']) {
      return response.bodyString;
    } else {
      return Future.error(response.body['message']);
    }
  }

  Future createTickets({
    String tickettypeid,
    String title,
    String content,
  }) async {
    final data = FormData({
      'key': apikey,
      'token_id': token_id,
      'ticket_type_id': tickettypeid,
      'title': title,
      'content': content,
    });

    Response response = await post('$siteUrl/pages/new_ticket', data);

   
    print(response.bodyString);
    
    if (response.body['status']) {
      return response.body['message'];
    } else {
      return Future.error(response.body['message']);
    }
  }
}
