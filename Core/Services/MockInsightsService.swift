import Foundation

final class MockInsightsService: InsightsService {
    func summary(user: UserProfile, closet: [ClosetItem]) async throws -> String {
        "You favor neutral palettes and straight-leg fits."
    }
}
