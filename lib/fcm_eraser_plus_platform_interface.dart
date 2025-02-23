import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'fcm_eraser_plus_method_channel.dart';

abstract class FcmEraserPlusPlatform extends PlatformInterface {
  /// Constructs a FcmEraserPlusPlatform.
  FcmEraserPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static FcmEraserPlusPlatform _instance = MethodChannelFcmEraserPlus();

  static FcmEraserPlusPlatform get instance => _instance;

  static set instance(FcmEraserPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> clearAllNotifications();

  Future<void> clearByTags({required List<String> tags});

  Future<void> setCountBadge({required int count, bool isClear = true});

  Future<List<String>> getActiveTags();
}
