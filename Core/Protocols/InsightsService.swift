import Foundation

protocol InsightsService {
    func summary(user: UserProfile, closet: [ClosetItem]) async throws -> String
}
