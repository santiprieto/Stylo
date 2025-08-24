import Foundation

protocol ImageClassifier {
    func classify(imageData: Data) async throws -> Item
}
