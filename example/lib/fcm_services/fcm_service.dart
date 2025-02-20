import 'dart:developer';
import 'package:fcm_eraser_plus_example/fcm_services/fcm_interface.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FcmService implements FcmInterface {
  static late final FcmService _instance = FcmService._interval();

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
      final _fcmToken = await _firebaseMess.getToken();

      return _fcmToken;
    } catch (e, s) {
      log('Error get device token at $e and $s');

      return null;
    }
  }
}
