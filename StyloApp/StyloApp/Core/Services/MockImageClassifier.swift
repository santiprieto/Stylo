import Foundation

final class MockImageClassifier: ImageClassifier {
    func classify(imageData: Data) async throws -> Item {
        Item.sample
    }
}
