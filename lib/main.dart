//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yasr/app/services/services.dart';
import 'package:yasr/app/utils/AppTheme.dart';
import 'package:yasr/app/utils/AppTranslation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app/modules/network/controllers/network_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await GetStorage.init();
  await initServices();

  runApp(
    GetMaterialApp(
      translations: AppTranslation(),
      locale: Locale('ar', 'EG'),
      fallbackLocale: Locale('ar', 'EG'),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "EG"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      theme: AppTheme().themeData(),
    
      //defaultTransition: Transition.rightToLeft,
      title: "منصة يسر",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );


}

  void initServices() async {
    await Get.putAsync<UserServices>(() async => await UserServices());
    //await Get.putAsync<NetworkServices>(() async => await NetworkServices());
  }
