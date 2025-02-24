import 'fcm_eraser_plus_method_channel.dart';

class FcmEraserPlus {
  static final FcmEraserPlus _instance = FcmEraserPlus._interval();

  static FcmEraserPlus get instance => _instance;

  factory FcmEraserPlus() => _instance;

  FcmEraserPlus._interval();

  final _fcmEraserPlus = MethodChannelFcmEraserPlus();

  Future<void> clearAllNotifications() async {
    await _fcmEraserPlus.clearAllNotifications();
  }

  Future<void> clearByTags({required List<String> tags}) async {
    await _fcmEraserPlus.clearByTags(tags: tags);
  }

  Future<void> setBadge({required int count, bool isClear = true}) async {
    await _fcmEraserPlus.setBadge(count: count, isClear: isClear);
  }

  Future<List<String>> getActiveTags() async {
    final activeTags = await _fcmEraserPlus.getActiveTags();

    return activeTags;
  }
}
