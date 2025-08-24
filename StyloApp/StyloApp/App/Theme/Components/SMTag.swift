import SwiftUI

struct SMTag: View {
    let title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .smCaption()
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .frame(minHeight: 44)
                .background(background)
                .foregroundColor(foreground)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(border, lineWidth: 1))
                .cornerRadius(16)
        }
        .accessibilityLabel(Text("\(title) \(isSelected ? "selected" : "" )"))
        .accessibleTapArea()
    }

    private var background: Color {
        isSelected ? ColorTokens.primary.opacity(0.2) : Color.clear
    }

    private var foreground: Color {
        isSelected ? ColorTokens.primary : ColorTokens.neutralText
    }

    private var border: Color {
        isSelected ? ColorTokens.primary : ColorTokens.neutralText.opacity(0.3)
    }
}

#Preview {
    VStack(spacing: 16) {
        SMTag(title: "Casual", isSelected: false) {}
        SMTag(title: "Sporty", isSelected: true) {}
    }
    .padding()
}
