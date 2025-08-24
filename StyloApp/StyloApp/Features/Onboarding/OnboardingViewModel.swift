import SwiftUI

@MainActor
final class OnboardingViewModel: ObservableObject {
    enum ViewState { case idle, loading, loaded, error(String) }
    enum Step: Int, CaseIterable {
        case welcome, sizes, styles, palettes, budget, notifications, summary
    }

    @Published var state: ViewState = .idle
    @Published var step: Step = .welcome
    @Published var profile = UserProfile.sample
    @Published var selectedStyles: Set<StylePreference> = []
    @Published var selectedPalettes: Set<PalettePreference> = []
    @Published var notificationsEnabled: Bool = true

    func next() {
        if let next = Step(rawValue: step.rawValue + 1) {
            step = next
        } else {
            finish()
        }
    }

    func finish() {
        profile.palette = selectedPalettes.map { $0.rawValue }
        state = .loaded
    }
}
