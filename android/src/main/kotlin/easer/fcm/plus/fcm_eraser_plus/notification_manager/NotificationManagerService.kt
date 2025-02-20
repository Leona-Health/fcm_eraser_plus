package easer.fcm.plus.fcm_eraser_plus.notification_manager

import android.app.NotificationManager
import android.content.Context
import android.content.Context.NOTIFICATION_SERVICE

class NotificationManagerService constructor(private val context: Context) :
    NotificationManagerInterface {



    override fun clearAllNotifications(): Boolean {
        val notificationManager = context.getSystemService(NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.cancelAll()
        return true
    }

    override fun clearByTags(tags: List<String>): Boolean {
        return true
    }

}