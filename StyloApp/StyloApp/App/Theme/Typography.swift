import SwiftUI

struct Typography {
    struct LargeTitle: ViewModifier {
        func body(content: Content) -> some View {
            content.font(.largeTitle.weight(.bold))
        }
    }

    struct Title: ViewModifier {
        func body(content: Content) -> some View {
            content.font(.title.weight(.bold))
        }
    }

    struct Body: ViewModifier {
        func body(content: Content) -> some View {
            content.font(.body)
        }
    }

    struct Caption: ViewModifier {
        func body(content: Content) -> some View {
            content.font(.caption)
        }
    }

    struct Price: ViewModifier {
        func body(content: Content) -> some View {
            content.font(.system(.body, design: .monospaced).weight(.medium))
        }
    }
}

extension View {
    func smLargeTitle() -> some View { modifier(Typography.LargeTitle()) }
    func smTitle() -> some View { modifier(Typography.Title()) }
    func smBody() -> some View { modifier(Typography.Body()) }
    func smCaption() -> some View { modifier(Typography.Caption()) }
    func smPrice() -> some View { modifier(Typography.Price()) }
}
