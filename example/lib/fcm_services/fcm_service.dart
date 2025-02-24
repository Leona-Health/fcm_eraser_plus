import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'fcm_interface.dart';

class FcmService implements FcmInterface {
  static final FcmService _instance = FcmService._interval();

  static FcmService get instance => _instance;

  factory FcmService() => _instance;

  FcmService._interval();

  final _firebaseMess = FirebaseMessaging.instance;

  @override
  Future<void> initialize() async {
    await _firebaseMess.setAutoInitEnabled(true);

    await _firebaseMess.getInitialMessage();

    FirebaseMessaging.onMessage.listen((data) {});

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('A new onMessageOpenedApp event was published!');
    });
  }

  @override
  Future<void> requestPermission() async {
    await FirebaseMessaging.instance.requestPermission();
  }

  @override
  Future<String?> getToken() async {
    try {
      final fcmToken = Platform.isIOS
          ? await _firebaseMess.getAPNSToken()
          : await _firebaseMess.getToken();

      return fcmToken;
    } catch (e, s) {
      log('Error get device token at $e and $s');

      return null;
    }
  }
}
