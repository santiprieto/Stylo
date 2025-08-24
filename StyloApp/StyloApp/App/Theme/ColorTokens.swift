import SwiftUI

enum ColorTokens {
    static let primary = Color(red: 0.12, green: 0.47, blue: 0.98)
    static let secondary = Color(red: 0.93, green: 0.30, blue: 0.47)
    static let accentGradient = Gradient(colors: [primary, secondary])
    static let neutralBackground = Color(UIColor.systemBackground)
    static let neutralText = Color(UIColor.label)
    static let success = Color(red: 0.20, green: 0.65, blue: 0.32)
    static let warning = Color(red: 0.95, green: 0.62, blue: 0.15)
    static let error = Color(red: 0.85, green: 0.11, blue: 0.21)
}
