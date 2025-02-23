import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'fcm_eraser_plus_platform_interface.dart';
import 'utils/app_constant.dart';
import 'utils/keys_constant.dart';
import 'utils/methods_constant.dart';

class MethodChannelFcmEraserPlus extends FcmEraserPlusPlatform {
  static const _methodChannel = MethodChannel(AppConstant.ERASER_CHANNEL);

  @override
  Future<void> clearAllNotifications() async {
    try {
      await _methodChannel.invokeMethod<bool>(MethodsConstant.CLEAR_ALL);
    } on PlatformException catch (e) {
      log('Error clear all notifications at: ${e.message}');
    }
  }

  @override
  Future<void> clearByTags({required List<String> tags}) async {
    try {
      await _methodChannel.invokeMethod<bool>(
        MethodsConstant.CLEAR_BY_TAGS,
        <String, dynamic>{KeysConstant.TAGS: tags},
      );
    } on PlatformException catch (e) {
      log('Error clear by tags at: ${e.message}');
    }
  }

  @override
  Future<void> setCountBadge({required int count, bool isClear = true}) async {
    if (Platform.isAndroid) throw ('The func not implemented on Android.');

    try {
      await _methodChannel.invokeMethod<bool>(
        MethodsConstant.SET_BADGE,
        <String, dynamic>{
          KeysConstant.BADGE: count,
          KeysConstant.IS_CLEAR: isClear,
        },
      );
    } on PlatformException catch (e) {
      log('Error set count badge at: ${e.message}');
    }
  }

  @override
  Future<List<String>> getActiveTags() async {
    try {
      final response = await _methodChannel.invokeMethod<List<Object?>>(MethodsConstant.ACTIVE_TAGS);

      final activeTags = response?.map((e) => e.toString()).toList() ?? [];

      return activeTags;
    } on PlatformException catch (e) {
      log('Error get active notifications at: ${e.message}');

      return [];
    }
  }
}
