import Foundation

final class MockRecsService: RecsService {
    func forYou(user: UserProfile, closet: [ClosetItem]) async throws -> [Item] {
        Item.samples
    }

    func completeLook(seed: [Item], budget: Double?, context: RecsContext) async throws -> [Item] {
        Item.samples.filter { item in
            !seed.contains(where: { $0.id == item.id })
        }
    }
}
