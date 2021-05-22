import 'package:get/get.dart';

import '../controllers/order_provider_controller.dart';

class OrderProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderProviderController>(
      () => OrderProviderController(),
    );
  }
}
