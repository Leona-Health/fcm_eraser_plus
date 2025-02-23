protocol NotificationInterface {
    
    func  clearAllNotifications()
    
    func clearByTags()
    
    func getActiveTags() -> [String]
}
