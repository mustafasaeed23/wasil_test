// import 'dart:convert';
// import 'dart:io';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:store_app/core/constant.dart';


// import '../cache_helper/cache_helper.dart';
// import '../cache_helper/cache_values.dart';

// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   // // Navigate to the Main Layout
//   // navigatorKey.currentState?.pushNamedAndRemoveUntil(
//   //   Routes.mainLayoutScreen,
//   //   (route) => false,
//   // );
//   // WidgetsBinding.instance.addPostFrameCallback((_) {
//   //   customerSupportRatingMessage(message);
//   // });
//   printDebug(message.data.toString());
// }

// void handleMessage(RemoteMessage message) {
//   // Extract data payload
//   final data = message.data;

//   // Check if the notification requires opening the rating dialog
//   if (data['notifType'] == 'support_rating') {
//     // Delay showing the dialog until after navigation completes

//     showCustomerSupportRatingDialog(context: navigatorKey.currentContext!, chatId: data['chatId']);
//   } else if (data['notifType'] == 'rate_trip') {
//     showBusReservationRatingDialog(
//       context: navigatorKey.currentContext!,
//       reservationId: data['reservationId'],
//     );
//   }
// }

// class PushNotificationService {
//   final _fcm = FirebaseMessaging.instance;
//   String? fCMToken;
//   String? apnsToken;

//   final _androidChannel = const AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     description: "This channel is used for important notifications",
//     importance: Importance.defaultImportance,
//   );
//   final _localNotifications = FlutterLocalNotificationsPlugin();
//   void handleOpeningAppWhenMessagePressed(RemoteMessage message) async {
//     navigatorKey.currentState?.pushNamedAndRemoveUntil(
//       Routes.mainLayoutScreen,
//       (route) => false,
//     );
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (navigatorKey.currentContext != null) {
//         printDebug("notification data : ${message.data.toString()}");
//         handleMessage(message);
//       }
//     });
//   }

//   void handleOpenedAppMessage(RemoteMessage event) {
//     {
//       printDebug("notification data : ${event.data.toString()}");
//       final notification = event.notification;
//       if (notification == null) return;
//       if (Platform.isAndroid) {
//         showLocalNotification(event);
//       }
//       handleMessage(event);
//     }
//   }

//   void showLocalNotification(RemoteMessage event) {
//     printDebug("showLocalNotification");
//     printDebug("notification data : ${event.data.toString()}");
//     printDebug("notification title : ${event.notification?.title}");
//     printDebug("notification body : ${event.notification?.body}");
//     final notification = event.notification;
//     if (notification == null) return;
//     _localNotifications.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             _androidChannel.id,
//             _androidChannel.name,
//             channelDescription: _androidChannel.description,
//             icon: '@drawable/ic_launcher',
//             styleInformation: BigTextStyleInformation(
//               event.notification!.body!,
//               contentTitle: event.notification!.title,
//             ),
//           ),
//           iOS: const DarwinNotificationDetails(
//             presentAlert: true,
//             presentBadge: true,
//             presentSound: true,
//           ),
//         ),
//         payload: jsonEncode(event.toMap()));
//   }

//   Future<void> initLocalNotifications() async {
//     const android = AndroidInitializationSettings('@drawable/ic_launcher');
//     const ios = DarwinInitializationSettings();

//     const settings = InitializationSettings(android: android, iOS: ios);

//     await _localNotifications.initialize(
//       settings,
//     );
//   }

//   Future<void> initPushNotifications() async {
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     FirebaseMessaging.instance.getInitialMessage().then((message) {
//       if (message != null) {
//         RemoteNotification? notification = message.notification;
//         AndroidNotification? android = message.notification?.android;
//         if (notification != null && android != null) {
//           handleOpeningAppWhenMessagePressed(message);
//         }
//       }
//     });
//     FirebaseMessaging.onMessageOpenedApp.listen(handleOpeningAppWhenMessagePressed);
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//     FirebaseMessaging.onMessage.listen((handleOpenedAppMessage));
//   }

//   Future<void> initialize() async {
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     final settings = await _fcm.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//       providesAppNotificationSettings: true,
//     );
//     if (settings.authorizationStatus == AuthorizationStatus.authorized ||
//         settings.authorizationStatus == AuthorizationStatus.provisional) {
//       printDebug('User granted notification permission.');
//       try {
//         // Get the FCM token
//         apnsToken = await _fcm.getAPNSToken();
//         printDebug("APNS Token: $apnsToken");
//         fCMToken = await _fcm.getToken();
//         printDebug("FCM Token: $fCMToken");
//         // Save the token if it's not null
//         if (fCMToken != null) {
//           await CacheHelper.saveData(key: CacheKeys.deviceToken, value: fCMToken);
//         } else {
//           printDebug("Token is null");
//         }
//       } catch (e) {
//         // Handle any errors that occur
//         printDebug("Error retrieving token: $e");
//       }
//     } else {
//       printDebug('User declined or has not accepted notification permission.');
//     }

//     initPushNotifications();
//     initLocalNotifications();
//   }
// }
