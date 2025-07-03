import Foundation

class NotificationService: NotificationProtocal {
    static let shared = NotificationService()

    func clearAllNotifications() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }

    func clearByTags(tags: [String]) {
        if tags.isEmpty {
            return
        }
        
        
        UNUserNotificationCenter.current().getDeliveredNotifications {
            notifications in

            let notifications = notifications.filter { tags.contains($0.request.content.threadIdentifier) }
            
            let identifiers = notifications.map(\request.identifier)
            
            UNUserNotificationCenter.current().removeDeliveredNotifications(
                withIdentifiers: idetifiers)
        }
    }

    func setBadges(count: Int, isClear: Bool) {
        UIApplication.shared.applicationIconBadgeNumber = count

        if isClear {
            clearAllNotifications()
        }

    }

    func getActiveTags(completion: @escaping ([String]) -> Void) {
        UNUserNotificationCenter.current().getDeliveredNotifications {
            notifications in
            let tags = notifications.map { $0.request.content.threadIdentifier }
            completion(tags)
        }
    }

}
