import 'package:platform_device_id/platform_device_id.dart';
import 'dart:ui' as ui;
import 'package:onesignal_flutter/onesignal_flutter.dart';


class Onesignal{
  static Future setupOneSignal() async{
    final String? deviceId = await PlatformDeviceId.getDeviceId;
    final String deviceLang = ui.window.locale.languageCode;

    OneSignal onesignal = OneSignal.shared;

    onesignal.promptUserForPushNotificationPermission();
    onesignal.setExternalUserId(deviceId!);
    onesignal.setLanguage(deviceLang);
    onesignal.sendTags({"deviceId":deviceId, "deviceLang":deviceLang} );

    onesignal.setNotificationOpenedHandler((openedResult) {
      String? data = openedResult.notification.additionalData as String;
      if (data != null){
        // uygulama açılacak
      }
    });
  }
}

