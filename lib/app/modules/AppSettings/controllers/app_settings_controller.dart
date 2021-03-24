import 'package:get/get.dart';
import 'package:yasr/app/modules/AppSettings/provider/app_settings_provider.dart';

class AppSettingsController extends GetxController {
  var about = ''.obs;
  var termsConditions = ''.obs;
  @override
  void onInit() {
    print('TechnicalSuppor Init');
    //getaboutPage();
    //getTickets();
    super.onInit();
  }

  getaboutPage() {
    AppSettingsProvider().aboutPage().then((value) {
      about.value = value;
    });
  }

  getTermsConditionsPage() {
    AppSettingsProvider().termsConditionsPage().then((value) {
      termsConditions.value = value;
    });
  }
}
