import SwiftUI

struct SMPriceBadge: View {
    let price: Double
    let salePrice: Double?
    var currency: String = Locale.current.currency?.identifier ?? "USD"

    var body: some View {
        HStack(spacing: 4) {
            if let sale = salePrice, sale < price {
                Text(Formatters.price(price, currencyCode: currency))
                    .smPrice()
                    .foregroundColor(.secondary)
                    .strikethrough()
                Text(Formatters.price(sale, currencyCode: currency))
                    .smPrice()
                    .foregroundColor(ColorTokens.error)
                    .fontWeight(.bold)
                Text(Formatters.percent(1 - sale/price))
                    .smCaption()
                    .foregroundColor(ColorTokens.success)
            } else {
                Text(Formatters.price(price, currencyCode: currency))
                    .smPrice()
                    .fontWeight(.bold)
            }
        }
        .padding(4)
        .background(RoundedRectangle(cornerRadius: 8).fill(ColorTokens.neutralBackground))
    }
}

#Preview {
    VStack(spacing: 16) {
        SMPriceBadge(price: 120, salePrice: 90)
        SMPriceBadge(price: 80, salePrice: nil)
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}
