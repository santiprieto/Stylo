import Foundation

enum AnalyticsEvent {
    case viewedItem(String)
    case savedItem(String)
    case completeLook
    case startedAlert(String)
    case paywallView
    case subscribe
    case shareOutfit(String)
}

protocol AnalyticsService {
    func log(_ event: AnalyticsEvent)
}
