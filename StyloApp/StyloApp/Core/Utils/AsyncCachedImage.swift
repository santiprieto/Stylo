import SwiftUI

struct AsyncCachedImage<Content: View, Placeholder: View>: View {
    let url: URL?
    let content: (Image) -> Content
    let placeholder: () -> Placeholder

    init(url: URL?,
         @ViewBuilder content: @escaping (Image) -> Content,
         @ViewBuilder placeholder: @escaping () -> Placeholder) {
        self.url = url
        self.content = content
        self.placeholder = placeholder
    }

    var body: some View {
        if let url {
            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let image):
                    content(image)
                case .failure:
                    placeholder()
                case .empty:
                    placeholder()
                @unknown default:
                    placeholder()
                }
            }
        } else {
            placeholder()
        }
    }
}
