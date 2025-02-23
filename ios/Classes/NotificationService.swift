import Foundation


class NotificationService : NotificationProtocal{
    static let shared = NotificationService()
    
    func clearAllNotifications() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    func clearByTags(tags: [String]) {
        if tags.isEmpty {
            return
        }
        
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: tags)
        
    }
    
    func setBadges(count: Int, isClear : Bool) {
        UIApplication.shared.applicationIconBadgeNumber = count
        
        if isClear{
            clearAllNotifications()
        }
    }
    
    
    func getActiveTags() async -> [String] {
        return []
    }
    
}
