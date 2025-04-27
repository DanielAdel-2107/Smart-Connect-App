import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:smart_connect/core/helper/show_toast.dart';
import 'package:flutter/services.dart' show rootBundle;

class NotificationsHelper {
  // creat instance of fbm
  final _firebaseMessaging = FirebaseMessaging.instance;

  // initialize notifications for this app or device
  Future<void> initNotifications() async {
    NotificationSettings settings =
        await _firebaseMessaging.getNotificationSettings();
    if (settings.authorizationStatus == AuthorizationStatus.notDetermined) {
      await _firebaseMessaging.requestPermission();
    }
    String? deviceToken = await _firebaseMessaging.getToken();
    print("Device Token: $deviceToken");
  }

  // handel notifications in case app is opened
  void setupFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        showToast(
            title: message.notification!.title!,
            body: message.notification!.body!,
            type: message.data["type"]);
      }
    });
  }

  // get access token for API calls

Future<String?> getAccessToken() async {
  try {
    String jsonString = await rootBundle.loadString('assets/service-account.json');
    final serviceAccountJson = jsonDecode(jsonString);

    List<String> scopes = [
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    var client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    var credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    client.close();
    return credentials.accessToken.data;
  } catch (e) {
    print("Error getting access token: $e");
    return null;
  }
}  // get body for sending notification to specific user
  Map<String, dynamic> getBody({
    required String topic,
    required String title,
    required String body,
    required String userId,
    String? type,
  }) {
    return {
      "message": {
        "topic": topic,
        "notification": {"title": title, "body": body},
        "android": {
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "sound": "default"
          }
        },
        "apns": {
          "payload": {
            "aps": {"content_available": true}
          }
        },
        "data": {
          "type": type ?? "message",
          "id": userId,
          "click_action": "FLUTTER_NOTIFICATION_CLICK",
          "type": type
        }
      }
    };
  }

  // send notifications to a specific user
  Future<void> sendNotifications({
    required String topic,
    required String title,
    required String body,
    String? userId,
    String? type,
  }) async {
    try {
      var serverKeyAuthorization = await getAccessToken();
      const String urlEndPoint =
          "https://fcm.googleapis.com/v1/projects/smart-connect-2ccaa/messages:send";
      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';
      var response = await dio.post(
        urlEndPoint,
        data: getBody(
          userId: userId ?? "getIt<SupabaseClient>().auth.currentUser!.id",
          topic: topic,
          title: title,
          body: body,
          type: type ?? "message",
        ),
      );
      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');
      log(topic);
    } catch (e) {
      print("Error sending notification: $e");
    }
  }

  // subscribe to a topic
  Future<void> subscribeToTopic({required String topic}) async {
    log('Subscribed to $topic');
    await _firebaseMessaging.requestPermission();

    await _firebaseMessaging.subscribeToTopic(topic);
  }

  // unSubscribe to a topic
  Future<void> unSubscribeToTopic({required String topic}) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }
}
