import Foundation

final class MockClosetService: ClosetService {
    private var store: [ClosetItem] = [ClosetItem.sample]
    private let classifier: ImageClassifier

    init(classifier: ImageClassifier = MockImageClassifier()) {
        self.classifier = classifier
    }

    func items() async throws -> [ClosetItem] {
        store
    }

    func add(_ item: ClosetItem) async throws {
        store.append(item)
    }

    func update(_ item: ClosetItem) async throws {
        if let index = store.firstIndex(where: { $0.id == item.id }) {
            store[index] = item
        }
    }

    func delete(id: String) async throws {
        store.removeAll { $0.id == id }
    }

    func scan(imageData: Data) async throws -> ClosetItem {
        let item = try await classifier.classify(imageData: imageData)
        return ClosetItem(id: UUID().uuidString, source: .photo, item: item, wearCount: 0, lastWorn: nil)
    }
}
