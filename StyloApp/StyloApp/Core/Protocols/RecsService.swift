import Foundation

struct RecsContext {
    var occasion: String?
}

protocol RecsService {
    func forYou(user: UserProfile, closet: [ClosetItem]) async throws -> [Item]
    func completeLook(seed: [Item], budget: Double?, context: RecsContext) async throws -> [Item]
}
