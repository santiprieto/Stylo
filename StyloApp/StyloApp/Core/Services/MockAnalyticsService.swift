import Foundation

final class MockAnalyticsService: AnalyticsService {
    func log(_ event: AnalyticsEvent) {
        print("Analytics event:", event)
    }
}
