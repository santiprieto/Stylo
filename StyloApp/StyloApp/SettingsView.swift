import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "gearshape.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundStyle(.green)
            Text("Adjust your preferences")
                .font(.title2)
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
