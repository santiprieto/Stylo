import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel
    var onFinished: () -> Void

    var body: some View {
        TabView(selection: $viewModel.step) {
            welcome.tag(OnboardingViewModel.Step.welcome)
            sizes.tag(OnboardingViewModel.Step.sizes)
            StyleQuizView(selected: $viewModel.selectedStyles)
                .tag(OnboardingViewModel.Step.styles)
            palettes.tag(OnboardingViewModel.Step.palettes)
            budget.tag(OnboardingViewModel.Step.budget)
            notifications.tag(OnboardingViewModel.Step.notifications)
            summary.tag(OnboardingViewModel.Step.summary)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }

    private var welcome: some View {
        VStack(spacing: 24) {
            Spacer()
            Text("Welcome to Stylo")
                .smLargeTitle()
            Text("Your AI stylist is here to help you look your best.")
                .smBody()
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
            SMButton(title: "Get Started", style: .filled) {
                viewModel.next()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [ColorTokens.primary, ColorTokens.secondary], startPoint: .topLeading, endPoint: .bottomTrailing))
        .foregroundColor(.white)
    }

    private var sizes: some View {
        VStack(spacing: 24) {
            Text("Your Sizes")
                .smTitle()
            Picker("Top", selection: $viewModel.profile.sizeTop) {
                ForEach(["XS","S","M","L","XL"], id: \.self) { size in
                    Text(size).tag(size)
                }
            }
            Picker("Bottom", selection: $viewModel.profile.sizeBottom) {
                ForEach(["28","30","32","34","36"], id: \.self) { size in
                    Text(size).tag(size)
                }
            }
            Picker("Shoes", selection: $viewModel.profile.sizeShoes) {
                ForEach(["7","8","9","10","11"], id: \.self) { size in
                    Text(size).tag(size)
                }
            }
            Spacer()
            SMButton(title: "Next", style: .filled) { viewModel.next() }
                .padding()
        }
    }

    private var palettes: some View {
        VStack(spacing: 16) {
            Text("Favorite Palettes")
                .smTitle()
            let columns = [GridItem(.adaptive(minimum: 80))]
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(PalettePreference.allCases, id: \.self) { palette in
                    SMTag(title: palette.rawValue.capitalized, isSelected: viewModel.selectedPalettes.contains(palette)) {
                        if viewModel.selectedPalettes.contains(palette) {
                            viewModel.selectedPalettes.remove(palette)
                        } else {
                            viewModel.selectedPalettes.insert(palette)
                        }
                    }
                }
            }
            Spacer()
            SMButton(title: "Next", style: .filled) { viewModel.next() }
                .padding()
        }
        .padding()
    }

    private var budget: some View {
        let upperBound = Binding<Double>(
            get: { viewModel.profile.budgetRange.upperBound },
            set: { viewModel.profile.budgetRange = viewModel.profile.budgetRange.lowerBound...$0 }
        )
        return VStack(spacing: 24) {
            Text("Budget per Item")
                .smTitle()
            Slider(value: upperBound, in: 50...500, step: 10)
            Text("Up to $\(Int(viewModel.profile.budgetRange.upperBound))")
                .smBody()
            Spacer()
            SMButton(title: "Next", style: .filled) { viewModel.next() }
                .padding()
        }
        .padding()
    }

    private var notifications: some View {
        VStack(spacing: 24) {
            Text("Notifications")
                .smTitle()
            Toggle("Price drop alerts", isOn: $viewModel.notificationsEnabled)
                .padding()
            Spacer()
            SMButton(title: "Next", style: .filled) { viewModel.next() }
                .padding()
        }
        .padding()
    }

    private var summary: some View {
        VStack(spacing: 24) {
            Spacer()
            Text("All set, \(viewModel.profile.sizeTop) size fan!")
                .smTitle()
            Text("Let’s start styling.")
                .smBody()
            Spacer()
            SMButton(title: "Continue", style: .filled) {
                viewModel.finish()
                onFinished()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel()) { }
}
