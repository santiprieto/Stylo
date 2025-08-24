import Foundation

final class MockPriceAlertService: PriceAlertService {
    private var store: [PriceAlert] = [PriceAlert.sample]

    func alerts() async throws -> [PriceAlert] {
        store
    }

    func create(_ alert: PriceAlert) async throws {
        store.append(alert)
    }

    func update(_ alert: PriceAlert) async throws {
        if let index = store.firstIndex(where: { $0.id == alert.id }) {
            store[index] = alert
        }
    }

    func delete(id: String) async throws {
        store.removeAll { $0.id == id }
    }

    func checkAlerts() async throws -> [PriceAlert] {
        store.filter { $0.isActive }
    }
}
