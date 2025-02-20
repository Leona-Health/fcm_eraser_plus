import 'dart:developer';
import 'package:fcm_eraser_plus/utils/app_constant.dart';
import 'package:flutter/services.dart';
import 'fcm_eraser_plus_platform_interface.dart';

class MethodChannelFcmEraserPlus extends FcmEraserPlusPlatform {
  static const _methodChannel = const MethodChannel(AppConstant.ERASER_CHANNEL);

  @override
  Future<bool> clearAllNotifications() async {
    try {
      final status = await _methodChannel.invokeMethod<bool>(AppConstant.METHOD_CLEAR_ALL);

      return status ?? false;
    } on PlatformException catch (e) {
      log('Failed clear all notifications for following reason: ${e.message}');

      return false;
    }
  }

  @override
  Future<void> clearByTags({required List<String> tags}) {
    // TODO: implement clearByTags
    throw UnimplementedError();
  }

  @override
  Future<void> setCountBadge({required int count}) {
    // TODO: implement setCountBadge
    throw UnimplementedError();
  }
}
