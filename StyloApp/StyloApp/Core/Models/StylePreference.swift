import Foundation

enum StylePreference: String, CaseIterable, Codable {
    case streetwear, minimal, classic, sporty, business, y2k
}

enum FitPreference: String, CaseIterable, Codable {
    case slim, regular, relaxed, oversized
}

enum PalettePreference: String, CaseIterable, Codable {
    case neutral, vibrant, pastel
}
