package easer.fcm.plus.fcm_eraser_plus

import android.content.Context
import easer.fcm.plus.fcm_eraser_plus.notification_manager.NotificationManagerService
import easer.fcm.plus.fcm_eraser_plus.utils.AppConstant
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class FcmEraserPlusPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var notificationManagerService: NotificationManagerService
    private var context: Context? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, AppConstant.ERASER_CHANNEL)
        channel.setMethodCallHandler(this)

        // Get context and init notification manager.
        context = flutterPluginBinding.applicationContext
        notificationManagerService = NotificationManagerService(context!!)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {

        when (call.method) {
            AppConstant.METHOD_CLEAR_ALL -> {
                val status = notificationManagerService.clearAllNotifications();
                result.success(status)
            }

            AppConstant.METHOD_CLEAR_BY_TAGS -> {
                val tags = call.argument<List<String>>(AppConstant.KEY_TAGS)
                notificationManagerService.clearByTags(tags ?: emptyList())

            }

            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = null
        channel.setMethodCallHandler(null)
    }
}
