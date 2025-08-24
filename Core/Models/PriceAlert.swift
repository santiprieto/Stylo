import Foundation

struct PriceAlert: Identifiable, Codable, Hashable {
    enum ThresholdType: Codable, Hashable {
        case anyDrop
        case deltaPercent(Int)
        case below(Double)
    }

    let id: String
    var itemId: String
    var threshold: ThresholdType
    var isActive: Bool
    var createdAt: Date
}

extension PriceAlert {
    static let sample = PriceAlert(
        id: "alert1",
        itemId: Item.sample.id,
        threshold: .deltaPercent(20),
        isActive: true,
        createdAt: Date()
    )
}
