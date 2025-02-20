package easer.fcm.plus.fcm_eraser_plus.notification_manager

interface NotificationManagerInterface {

    fun clearAllNotifications(): Boolean

    fun clearByTags(tags: List<String>): Boolean
}