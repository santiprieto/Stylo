import SwiftUI

struct StyleQuizView: View {
    @Binding var selected: Set<StylePreference>

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Pick your styles")
                .smTitle()
            let columns = [GridItem(.adaptive(minimum: 120))]
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(StylePreference.allCases, id: \.self) { style in
                        SMTag(title: style.rawValue.capitalized, isSelected: selected.contains(style)) {
                            if selected.contains(style) {
                                selected.remove(style)
                            } else {
                                selected.insert(style)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

#Preview {
    StyleQuizView(selected: .constant([.streetwear]))
}
