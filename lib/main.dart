import 'dart:async';

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:Sanaa/features/language/controllers/localization_controller.dart';
import 'package:Sanaa/features/setting/controllers/theme_controller.dart';
import 'package:Sanaa/helper/notification_helper.dart';
import 'package:Sanaa/helper/route_helper.dart';
import 'package:Sanaa/theme/dark_theme.dart';
import 'package:Sanaa/theme/light_theme.dart';
import 'package:Sanaa/util/app_constants.dart';
import 'package:Sanaa/util/messages.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'helper/get_di.dart' as di;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
 late List<CameraDescription> cameras;

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  if(GetPlatform.isAndroid){
    await Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });
  }

  
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  // await Firebase.initializeApp();

  ///firebase crashlytics


  cameras = await availableCameras();

  Map<String, Map<String, String>> languages = await di.init();

  int? orderID;
 // NotificationBody? body;
  try {
    final RemoteMessage? remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (remoteMessage != null) {
      //body = NotificationHelper.convertNotification(remoteMessage.data);
    }
    await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
    FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  }catch(e) {
    if (kDebugMode) {
      print("");
    }
  }

  runApp(MyApp(languages: languages, orderID: orderID));

}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>>? languages;
  final int? orderID;
  const MyApp({Key? key, required this.languages, required this.orderID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
          child: GetMaterialApp(
            navigatorObservers: [FlutterSmartDialog.observer],
            builder: FlutterSmartDialog.init(),
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,
            navigatorKey: Get.key,
            theme: themeController.darkTheme ? dark : light,
            locale: localizeController.locale,
            translations: Messages(languages: languages),
            fallbackLocale: Locale(AppConstants.languages[0].languageCode!, AppConstants.languages[0].countryCode),
            initialRoute: RouteHelper.getSplashRoute(),
            getPages: RouteHelper.routes,
            defaultTransition: Transition.topLevel,
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      },
      );
    },
    );
  }
}
