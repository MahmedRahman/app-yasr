import 'package:get/get.dart';

import 'package:yasr/app/modules/Client/controllers/Client_controller.dart';

class ClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientController>(
      () => ClientController(),
    );
  }
}
