import Foundation

final class MockPaywallService: PaywallService {
    private var subscribed = false

    func subscribe(plan: PaywallPlan) async throws -> Bool {
        subscribed = true
        return subscribed
    }

    func restore() async throws -> Bool {
        subscribed
    }

    func status() async throws -> Bool {
        subscribed
    }
}
