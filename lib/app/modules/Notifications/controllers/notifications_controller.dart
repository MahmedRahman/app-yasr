import 'package:yasr/app/modules/Notifications/model/notifications_model.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/Notifications/provider/notifications_provider.dart';

class NotificationsController extends GetxController {


  //TODO: Implement NotificationsController

  List<AllNotification> allNotifications = List<AllNotification>().obs;

  @override
  void onInit() {
    print('Notifications Controller onInit');
    super.onInit();
  }

  getNotifaction() async {
    await NotifactionProvider().getNotifaction().then((value) {

      final notificationsModel = notificationsModelFromJson(value);

      allNotifications.addAll(notificationsModel.result.allNotifications) ;


        
    });
  }
}
