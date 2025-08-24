import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Welcome back!")
                    .smLargeTitle()
                SMCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Recommended for You")
                            .smTitle()
                        Text("Check out the latest picks tailored to your style.")
                            .smBody()
                    }
                }
                SMCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Trending Now")
                            .smTitle()
                        Text("See what's popular this week.")
                            .smBody()
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Home")
    }
}

struct BrowseView: View {
    private let categories = ["Tops", "Bottoms", "Shoes", "Accessories"]

    var body: some View {
        List(categories, id: \.self) { category in
            Text(category)
        }
        .navigationTitle("Browse")
    }
}

struct OutfitsView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Build outfits from items in your closet.")
                .smBody()
            SMButton(title: "Create Outfit", style: .filled) { }
            Spacer()
        }
        .padding()
        .navigationTitle("Outfits")
    }
}

struct ClosetView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Save items you love to your closet for quick access.")
                .smBody()
            SMButton(title: "Add Item", style: .filled) { }
            Spacer()
        }
        .padding()
        .navigationTitle("Closet")
    }
}

struct AlertsView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("No alerts yet. Price drops and other updates will show up here.")
                .smBody()
            Spacer()
        }
        .padding()
        .navigationTitle("Alerts")
    }
}

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(ColorTokens.primary)
            Text("Guest User")
                .smTitle()
            SMButton(title: "Edit Profile", style: .outline) { }
            Spacer()
        }
        .padding()
        .navigationTitle("Profile")
    }
}

#Preview {
    TabView {
        HomeView()
            .tabItem { Label("Home", systemImage: "house") }
        BrowseView()
            .tabItem { Label("Browse", systemImage: "square.grid.2x2") }
        OutfitsView()
            .tabItem { Label("Outfits", systemImage: "sparkles") }
        ClosetView()
            .tabItem { Label("Closet", systemImage: "tshirt") }
        AlertsView()
            .tabItem { Label("Alerts", systemImage: "bell") }
        ProfileView()
            .tabItem { Label("Profile", systemImage: "person.crop.circle") }
    }
}
