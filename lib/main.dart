//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yasr/app/data/helper/AppConstant.dart';
import 'package:yasr/app/data/helper/AppTheme.dart';
import 'package:yasr/app/data/helper/AppTranslation.dart';
import 'package:yasr/app/services/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      title: appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );


}

  void initServices() async {
    await Get.putAsync<UserServices>(() async => await UserServices());
    //await Get.putAsync<NetworkServices>(() async => await NetworkServices());
  }
