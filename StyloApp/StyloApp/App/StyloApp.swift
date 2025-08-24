import SwiftUI

@main
struct StyloApp: App {
    @StateObject private var router = AppRouter()
    @State private var showOnboarding = true

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
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
                .sheet(item: $router.sheet) { sheet in
                    switch sheet {
                    case .filters:
                        Text("Filters")
                    case .paywall:
                        PaywallView(viewModel: PaywallViewModel(service: router.services.paywall))
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
            .fullScreenCover(isPresented: $showOnboarding) {
                OnboardingView(viewModel: OnboardingViewModel()) {
                    showOnboarding = false
                    router.present(.paywall)
                }
            }
        }
    }
}
