import Foundation

protocol PriceAlertService {
    func alerts() async throws -> [PriceAlert]
    func create(_ alert: PriceAlert) async throws
    func update(_ alert: PriceAlert) async throws
    func delete(id: String) async throws
    func checkAlerts() async throws -> [PriceAlert]
}
