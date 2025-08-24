import Foundation

struct Item: Identifiable, Codable, Hashable {
    let id: String
    var title: String
    var brand: String
    var price: Double
    var salePrice: Double?
    var colors: [String]
    var sizes: [String]
    var fit: String
    var images: [URL]
    var merchantURL: URL
    var affiliateTag: String?
    var attributes: [String: String]
}

extension Item {
    static let sample = Item(
        id: "item1",
        title: "Air Max 90",
        brand: "Nike",
        price: 120,
        salePrice: 90,
        colors: ["Red", "White"],
        sizes: ["8", "9", "10"],
        fit: "True to size",
        images: [URL(string: "https://example.com/airmax90.jpg")!],
        merchantURL: URL(string: "https://example.com/airmax90")!,
        affiliateTag: nil,
        attributes: ["category": "shoes"]
    )

    static let sample2 = Item(
        id: "item2",
        title: "501 Original Fit Jeans",
        brand: "Levi's",
        price: 89,
        salePrice: nil,
        colors: ["Blue"],
        sizes: ["30", "32", "34"],
        fit: "Regular",
        images: [URL(string: "https://example.com/501.jpg")!],
        merchantURL: URL(string: "https://example.com/501")!,
        affiliateTag: nil,
        attributes: ["category": "pants"]
    )

    static let samples: [Item] = [sample, sample2]
}
