import 'fcm_eraser_plus_method_channel.dart';

class FcmEraserPlus {
  static final FcmEraserPlus _instance = FcmEraserPlus._interval();

  static FcmEraserPlus get instance => _instance;

  factory FcmEraserPlus() => _instance;

  FcmEraserPlus._interval();

  final _fcmEraserPlus = MethodChannelFcmEraserPlus();

  /// [clearAllNotifications] is used to delete all notifications.
  Future<void> clearAllNotifications() async {
    await _fcmEraserPlus.clearAllNotifications();
  }

  /// [clearByTags] is used to delete notifications with a list of tags.
  ///
  /// [tags] is the list of tags to be deleted.
  Future<void> clearByTags({required List<String> tags}) async {
    await _fcmEraserPlus.clearByTags(tags: tags);
  }

  /// [setBadge] is used to set the badge count for iOS.
  ///
  /// [isClear] = true to delete all notifications, false to skip.
  Future<void> setBadge({required int count, bool isClear = true}) async {
    await _fcmEraserPlus.setBadge(count: count, isClear: isClear);
  }

  /// [getActiveTags] is used to retrieve the list of active tags.
  Future<List<String>> getActiveTags() async {
    final activeTags = await _fcmEraserPlus.getActiveTags();

    return activeTags;
  }
}
