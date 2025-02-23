import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fcm_eraser_plus/fcm_eraser_plus.dart';
import 'fcm_services/fcm_service.dart';
import 'firebase_options.dart';
import 'widgets/base_button.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _fcmEraserPlusPlugin = FcmEraserPlus.instance;
  final _fcmService = FcmService.instance;

  @override
  void initState() {
    super.initState();

    _initFCMService();
  }

  Future<void> _initFCMService() async {
    await _fcmService.requestPermission();
    await _fcmService.initialize();
  }

  Future<void> _getFcmToken() async {
    final token = await _fcmService.getToken();

    log('FCM Token:\n$token');
  }

  Future<void> _clearAll() async {
    await _fcmEraserPlusPlugin.clearAllNotifications();
  }

  Future<void> _clearByTags({required List<String> tags}) async {
    await _fcmEraserPlusPlugin.clearByTags(tags: tags);
  }

  Future<void> _getActiveTags() async {
    final activeTags = await _fcmEraserPlusPlugin.getActiveTags();

    log('Active tags:\n$activeTags');
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: const Text(
            'FCM Eraser Plus',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          width: width,
          height: height,
          child: Column(
            children: [
              BaseButton(
                label: 'Get FCM Token',
                onTap: _getFcmToken,
              ),
              const SizedBox(height: 20),
              BaseButton(
                label: 'Clear all notifications',
                onTap: _clearAll,
              ),
              const SizedBox(height: 20),
              BaseButton(
                label: 'Clear with tags',
                onTap: () async => _clearByTags(tags: ['TechMind']),
              ),
              const SizedBox(height: 20),
              BaseButton(
                label: 'Get active tags',
                onTap: _getActiveTags,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
