import SwiftUI
import Combine

final class AppRouter: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?

    struct ServiceContainer {
        let catalog: CatalogService
        let recs: RecsService
        let alerts: PriceAlertService
        let closet: ClosetService
        let insights: InsightsService
        let paywall: PaywallService
        let analytics: AnalyticsService

        static func mock() -> ServiceContainer {
            ServiceContainer(
                catalog: MockCatalogService(),
                recs: MockRecsService(),
                alerts: MockPriceAlertService(),
                closet: MockClosetService(),
                insights: MockInsightsService(),
                paywall: MockPaywallService(),
                analytics: MockAnalyticsService()
            )
        }
    }

    enum Route: Hashable {
        case productDetail(Item)
    }

    enum Sheet: Identifiable {
        case filters
        case paywall

        var id: String {
            switch self {
            case .filters: return "filters"
            case .paywall: return "paywall"
            }
        }
    }

    let services: ServiceContainer

    init(services: ServiceContainer = .mock()) {
        self.services = services
    }

    func navigate(to route: Route) {
        path.append(route)
    }

    func present(_ sheet: Sheet?) {
        self.sheet = sheet
    }
}
