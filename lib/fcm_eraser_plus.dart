import 'package:fcm_eraser_plus/fcm_eraser_plus_method_channel.dart';

class FcmEraserPlus {
  static late final FcmEraserPlus _instance = FcmEraserPlus._interval();

  static FcmEraserPlus get instance => _instance;

  factory FcmEraserPlus() => _instance;

  FcmEraserPlus._interval();

  final _fcmEraserPlus = MethodChannelFcmEraserPlus();

  Future<bool> clearAllNotifications() async {
    final status = await _fcmEraserPlus.clearAllNotifications();

    return status;
  }

  Future<void> clearByTags({required List<String> tags}) {
    // TODO: implement clearByTags
    throw UnimplementedError();
  }

  Future<void> setCountBadge({required int count}) {
    // TODO: implement setCountBadge
    throw UnimplementedError();
  }
}
