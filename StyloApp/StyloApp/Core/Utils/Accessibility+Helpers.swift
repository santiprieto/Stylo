import SwiftUI

extension View {
    /// Ensures minimum tappable area for accessibility
    public func accessibleTapArea() -> some View {
        self.padding(8).contentShape(Rectangle())
    }
}
