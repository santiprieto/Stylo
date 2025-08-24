import SwiftUI

struct SMCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding()
            .background(RoundedRectangle(cornerRadius: 16).fill(ColorTokens.neutralBackground))
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    SMCard {
        VStack(alignment: .leading) {
            Text("Card Title").smTitle()
            Text("Card body text goes here.")
        }
    }
    .padding()
}
