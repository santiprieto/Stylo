import Foundation

struct CatalogFilters {
    var size: String?
    var fit: String?
    var color: String?
}

protocol CatalogService {
    func featured() async throws -> [Item]
    func search(query: String, filters: CatalogFilters) async throws -> [Item]
    func item(id: String) async throws -> Item
}
