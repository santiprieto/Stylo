import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "house.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundStyle(.blue)
            Text("Welcome to the Home tab")
                .font(.title2)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
