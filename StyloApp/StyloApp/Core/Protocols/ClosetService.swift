import Foundation

protocol ClosetService {
    func items() async throws -> [ClosetItem]
    func add(_ item: ClosetItem) async throws
    func update(_ item: ClosetItem) async throws
    func delete(id: String) async throws
    func scan(imageData: Data) async throws -> ClosetItem
}
