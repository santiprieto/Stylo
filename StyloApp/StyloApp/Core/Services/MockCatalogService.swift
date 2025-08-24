import Foundation

final class MockCatalogService: CatalogService {
    private var items: [Item] = Item.samples

    func featured() async throws -> [Item] {
        items
    }

    func search(query: String, filters: CatalogFilters) async throws -> [Item] {
        items.filter { item in
            (query.isEmpty || item.title.lowercased().contains(query.lowercased())) &&
            (filters.size == nil || item.sizes.contains(filters.size!)) &&
            (filters.color == nil || item.colors.contains(filters.color!))
        }
    }

    func item(id: String) async throws -> Item {
        items.first { $0.id == id } ?? Item.sample
    }
}
