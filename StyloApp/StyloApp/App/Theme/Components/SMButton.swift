import SwiftUI

struct SMButton: View {
    enum Style {
        case filled, outline, subtle
    }

    let title: String
    let style: Style
    var isLoading: Bool = false
    var isDisabled: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: { if !isLoading { action() } }) {
            ZStack {
                if isLoading {
                    ProgressView()
                } else {
                    Text(title)
                        .smBody()
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .frame(minHeight: 44)
        }
        .foregroundColor(foregroundColor)
        .background(backgroundColor)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(borderColor, lineWidth: style == .outline ? 2 : 0))
        .cornerRadius(12)
        .disabled(isLoading || isDisabled)
        .accessibilityLabel(Text(title))
        .accessibleTapArea()
    }

    private var foregroundColor: Color {
        switch style {
        case .filled:
            return .white
        case .outline:
            return ColorTokens.primary
        case .subtle:
            return ColorTokens.primary
        }
    }

    private var backgroundColor: Color {
        switch style {
        case .filled:
            return ColorTokens.primary
        case .outline:
            return Color.clear
        case .subtle:
            return ColorTokens.primary.opacity(0.1)
        }
    }

    private var borderColor: Color {
        switch style {
        case .outline:
            return ColorTokens.primary
        default:
            return Color.clear
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        SMButton(title: "Primary", style: .filled) {}
        SMButton(title: "Outline", style: .outline) {}
        SMButton(title: "Subtle", style: .subtle, isLoading: true) {}
    }
    .padding()
}
