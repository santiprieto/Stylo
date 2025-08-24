import Foundation

struct ClosetItem: Identifiable, Codable, Hashable {
    enum Source: String, Codable {
        case manual, photo, `import`
    }

    let id: String
    var source: Source
    var item: Item
    var wearCount: Int
    var lastWorn: Date?
}

extension ClosetItem {
    static let sample = ClosetItem(
        id: "closet1",
        source: .manual,
        item: Item.sample,
        wearCount: 5,
        lastWorn: nil
    )
}
