import 'package:device_preview/device_preview.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:smart_connect/app/my_app.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/notifications/fcm_notification.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    //"your_project_id_here"
    url: "https://wgsnmswujkcxtklzdzej.supabase.co",
    //"your_anon_key_here"
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indnc25tc3d1amtjeHRrbHpkemVqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAwNTk3NjksImV4cCI6MjA1NTYzNTc2OX0.V9OK5aAOsu7OZ5ydfdtwN1E9576OYMfcObq2Rf_1pSQ",
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  setupDI();
  await getIt<NotificationsHelper>().initNotifications();
  getIt<NotificationsHelper>().setupFirebaseMessaging();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}
