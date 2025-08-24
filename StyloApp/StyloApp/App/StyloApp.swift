import SwiftUI

@main
struct StyloApp: App {
    @StateObject private var router = AppRouter()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                TabView {
                    Text("Home")
                        .tabItem { Label("Home", systemImage: "house") }
                    Text("Browse")
                        .tabItem { Label("Browse", systemImage: "square.grid.2x2") }
                    Text("Outfits")
                        .tabItem { Label("Outfits", systemImage: "sparkles") }
                    Text("Closet")
                        .tabItem { Label("Closet", systemImage: "tshirt") }
                    Text("Alerts")
                        .tabItem { Label("Alerts", systemImage: "bell") }
                    Text("Profile")
                        .tabItem { Label("Profile", systemImage: "person.crop.circle") }
                }
                .sheet(item: $router.sheet) { sheet in
                    switch sheet {
                    case .filters:
                        Text("Filters")
                    case .paywall:
                        Text("Paywall")
                    }
                }
                .navigationDestination(for: AppRouter.Route.self) { route in
                    switch route {
                    case .productDetail(let item):
                        Text(item.title)
                    }
                }
            }
            .environmentObject(router)
        }
    }
}
