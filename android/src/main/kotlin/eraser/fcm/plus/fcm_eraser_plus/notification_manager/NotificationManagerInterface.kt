package eraser.fcm.plus.fcm_eraser_plus.notification_manager

interface NotificationManagerInterface {

    fun clearAllNotifications()

    fun clearByTags(tags: List<String>)

    fun getActiveTags(): List<String>
}