import 'package:get/get.dart';

import 'package:yasr/app/modules/entry_point/controllers/entry_point_controller.dart';

class EntryPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntryPointController>(
      () => EntryPointController(),
    );
  }
}
