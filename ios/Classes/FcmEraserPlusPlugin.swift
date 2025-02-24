import Flutter
import UIKit

public class FcmEraserPlusPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: ChannelConstant.ERASER_CHANNEL,
            binaryMessenger: registrar.messenger())
        let instance = FcmEraserPlusPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(
        _ call: FlutterMethodCall, result: @escaping FlutterResult
    ) {
        switch call.method {
        case MethodsConstant.CLEAR_ALL:
            NotificationService.shared.clearAllNotifications()

            result(true)

        case MethodsConstant.CLEAR_BY_TAGS:
            let args = call.arguments as! [String: [String]]
            let tags = args[KeysConstant.TAGS] ?? []

            NotificationService.shared.clearByTags(tags: tags)

            result(true)

        case MethodsConstant.SET_BADGE:
            let args = call.arguments as! [String: Any]

            let count = args[KeysConstant.COUNT]! as? Int
            let isClear = args[KeysConstant.IS_CLEAR]! as? Bool

            NotificationService.shared.setBadges(
                count: count ?? 0, isClear: isClear ?? true)

            result(true)
            
        case MethodsConstant.ACTIVE_TAGS:
            NotificationService.shared.getActiveTags { tags in

                result(tags)
            }

        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
