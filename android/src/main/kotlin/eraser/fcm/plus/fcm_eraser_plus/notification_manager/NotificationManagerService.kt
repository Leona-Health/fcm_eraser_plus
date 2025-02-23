package eraser.fcm.plus.fcm_eraser_plus.notification_manager

import android.app.NotificationManager
import android.content.Context
import android.content.Context.NOTIFICATION_SERVICE
import android.os.Build

class NotificationManagerService(private val context: Context) : NotificationManagerInterface {

    override fun clearAllNotifications() {
        val notificationManager =
            context.getSystemService(NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.cancelAll()
    }

    override fun clearByTags(tags: List<String>) {
        if (tags.isEmpty()) return

        val notificationManager =
            context.getSystemService(NOTIFICATION_SERVICE) as NotificationManager

        val activeNotifications = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            notificationManager.activeNotifications
        } else {
            emptyArray()
        }

        if (activeNotifications.isEmpty()) return

        for (notification in activeNotifications) {
            if (tags.contains(notification.tag)) {
                notificationManager.cancel(notification.tag, notification.id)
            }
        }

    }

    override fun getActiveTags(): List<String> {
        val notificationManager =
            context.getSystemService(NOTIFICATION_SERVICE) as NotificationManager

        val activeNotifications = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            notificationManager.activeNotifications
        } else {
            emptyArray()
        }

        if (activeNotifications.isEmpty()) return emptyList()

        val activesTags: List<String> = activeNotifications.map { e -> e.tag }

        return activesTags

    }

}