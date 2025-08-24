import Foundation

enum PaywallPlan {
    case monthly
    case annual
}

protocol PaywallService {
    func subscribe(plan: PaywallPlan) async throws -> Bool
    func restore() async throws -> Bool
    func status() async throws -> Bool
}
