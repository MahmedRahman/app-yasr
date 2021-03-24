import 'package:get/get.dart';
import 'package:yasr/app/modules/Notifications/controllers/notifications_controller.dart';


class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(),
    );
  }
}
