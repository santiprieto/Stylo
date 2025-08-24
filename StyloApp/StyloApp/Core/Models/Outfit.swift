import Foundation

struct Outfit: Identifiable, Codable, Hashable {
    let id: String
    var title: String?
    var items: [Item]
    var occasion: String?
    var budget: Double?
    var createdAt: Date
}

extension Outfit {
    static let sample = Outfit(
        id: "outfit1",
        title: "Weekend Vibes",
        items: Item.samples,
        occasion: "Casual",
        budget: 200,
        createdAt: Date()
    )
}
