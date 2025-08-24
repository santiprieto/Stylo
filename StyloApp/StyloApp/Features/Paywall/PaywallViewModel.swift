import SwiftUI
import Combine

@MainActor
final class PaywallViewModel: ObservableObject {
    enum ViewState { case idle, loading, loaded, error(String) }

    @Published var state: ViewState = .idle
    @Published var isSubscribed = false

    private let service: PaywallService

    init(service: PaywallService) {
        self.service = service
    }

    func subscribe(plan: PaywallPlan) {
        Task {
            state = .loading
            do {
                isSubscribed = try await service.subscribe(plan: plan)
                state = .loaded
            } catch {
                state = .error("Subscription failed")
            }
        }
    }

    func restore() {
        Task {
            state = .loading
            do {
                isSubscribed = try await service.restore()
                state = .loaded
            } catch {
                state = .error("Restore failed")
            }
        }
    }
}
