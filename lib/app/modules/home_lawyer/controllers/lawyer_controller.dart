import 'package:get/get.dart';
import 'package:yasr/app/api/response_model.dart';
import 'package:yasr/app/api/web_serives.dart';
import 'package:yasr/app/modules/home_lawyer/model/laywer_home.dart';

class LawyerController extends GetxController {
  //TODO: Implement LawyerController

  final count = 0.obs;

  @override
  void onInit() {}

  var allRequests = Future.value().obs;

  getRequestLawer(int tabid) async {

    ResponsModel responsModel = await WebServices().getRequestLawer(tabid);



    if (responsModel.success) {

      Response response = responsModel.data;


      if (response.body['status']) {
        final homeLawerRequestModel =
            homeLawerRequestModelFromJson(response.bodyString);

        allRequests.value =
            Future.value(homeLawerRequestModel.result.allRequests);
      }

      
    }
  }
}
