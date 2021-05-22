import 'package:yasr/app/api/response_model.dart';
import 'package:yasr/app/api/web_serives.dart';
import 'package:yasr/app/modules/Notifications/model/notifications_model.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  //TODO: Implement NotificationsController

  var allNotifications = Future.value().obs;

  @override
  void onInit() {
    super.onInit();
  }

  getNotifaction() async {
    ResponsModel responsModel = await WebServices().getNotifaction();

    if (responsModel.success) {
      Response response = responsModel.data;
      final notificationsModel =
          notificationsModelFromJson(response.bodyString);
      allNotifications.value =
          Future.value(notificationsModel.result.allNotifications);
     
    }
  }
}
