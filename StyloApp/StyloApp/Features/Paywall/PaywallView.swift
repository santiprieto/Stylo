import SwiftUI

struct PaywallView: View {
    @StateObject var viewModel: PaywallViewModel
    @State private var selectedPlan: PaywallPlan = .monthly
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                LinearGradient(colors: [ColorTokens.primary, ColorTokens.secondary], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(height: 180)
                    .mask(Image(systemName: "sparkles").resizable().scaledToFit())
                    .padding()
                Text("Upgrade to Stylo+")
                    .smLargeTitle()
                VStack(alignment: .leading, spacing: 12) {
                    Label("Unlimited recommendations", systemImage: "wand.and.stars")
                    Label("Price drop alerts", systemImage: "bell.badge")
                    Label("Closet insights", systemImage: "chart.bar")
                }
                .smBody()
                planOptions
                SMButton(title: "Continue", style: .filled) {
                    viewModel.subscribe(plan: selectedPlan)
                }
                SMButton(title: "Restore Purchases", style: .subtle) {
                    viewModel.restore()
                }
                Button("Not now") { dismiss() }
                    .smBody()
                    .padding(.top, 8)
                Text("Payment will be charged to your Apple ID account. Terms apply.")
                    .smCaption()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }

    private var planOptions: some View {
        HStack(spacing: 12) {
            planCard(title: "Monthly", price: "$4.99", plan: .monthly)
            planCard(title: "Annual", price: "$49.99", plan: .annual)
        }
    }

    private func planCard(title: String, price: String, plan: PaywallPlan) -> some View {
        SMCard {
            VStack(spacing: 8) {
                Text(title).smTitle()
                Text(price).smPrice()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(selectedPlan == plan ? ColorTokens.primary.opacity(0.1) : Color.clear)
            .onTapGesture { selectedPlan = plan }
        }
    }
}

#Preview {
    PaywallView(viewModel: PaywallViewModel(service: MockPaywallService()))
}
