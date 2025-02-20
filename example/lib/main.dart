import 'dart:developer';
import 'package:fcm_eraser_plus_example/fcm_services/fcm_service.dart';
import 'package:fcm_eraser_plus_example/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fcm_eraser_plus/fcm_eraser_plus.dart';

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
  late String? _token;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _initFCMService();
  }

  Future<void> _initFCMService() async {
    await _fcmService.requestPermission();
    await _fcmService.initialize();

    _token = await _fcmService.getToken();

    log('TechMind: $_token');
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Center(
                    child: Text('FCM Token: $_token'),
                  ),
                  MaterialButton(
                    onPressed: () => _fcmEraserPlusPlugin.clearAllNotifications(),
                    child: Text('Clear all notifications'),
                  )
                ],
              ),
      ),
    );
  }
}
