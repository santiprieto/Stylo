import Foundation

struct UserProfile: Identifiable, Codable, Hashable {
    typealias ColorName = String

    let id: String
    var sizeTop: String
    var sizeBottom: String
    var sizeShoes: String
    var palette: [ColorName]
    var budgetRange: ClosedRange<Double>
    var country: String
    var currency: String
    var notificationPrefs: [String: Bool]
}

extension UserProfile {
    static let sample = UserProfile(
        id: "user1",
        sizeTop: "M",
        sizeBottom: "32",
        sizeShoes: "9",
        palette: ["Neutral", "Vibrant"],
        budgetRange: 50...200,
        country: "US",
        currency: "USD",
        notificationPrefs: ["priceDrops": true]
    )
}
