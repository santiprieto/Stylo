import Foundation
import Combine

enum Formatters {
    static let currency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    static func price(_ value: Double, currencyCode: String = Locale.current.currency?.identifier ?? "USD") -> String {
        currency.currencyCode = currencyCode
        return currency.string(from: NSNumber(value: value)) ?? "\(value)"
    }

    static func percent(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: value)) ?? "\(value * 100)%"
    }
}
