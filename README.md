# Stylo

Stylo is an example iOS application that showcases an AI-powered personal stylist built with SwiftUI. The app demonstrates a modular architecture, a tab-based layout, and reusable UI components.

## Features

- **Onboarding Flow** – Collects sizes, style preferences, palettes, budget, and notification settings through a paged experience.
- **Tab Navigation** – Home, Browse, Outfits, Closet, Alerts, and Profile screens managed by `AppRouter`.
- **Paywall** – Subscription paywall presented as a sheet using `PaywallView` and `PaywallViewModel`.
- **Reusable Design System** – Custom components (`SMButton`, `SMCard`, `SMTag`, etc.) built on color and typography tokens.
- **Mock Services Layer** – Protocol-driven mock implementations for catalog, recommendations, price alerts, closet, insights, paywall, analytics, and image classification.

## Project Structure

```
Stylo
└── StyloApp/              # Xcode project
    ├── App/               # App entry, router, theme, and UI components
    ├── Core/              # Models, protocols, utilities, and service implementations
    ├── Features/          # Feature modules (Onboarding, Paywall, Tabs)
    └── Assets.xcassets/   # App icons and colors
```

## Getting Started

1. Install [Xcode 15](https://developer.apple.com/xcode/) or later.
2. Clone the repository.
3. Open `StyloApp/StyloApp.xcodeproj` in Xcode.
4. Select an iOS 17+ simulator or device and press **Run**.

## Requirements

- iOS 17.0+
- Swift 6.1
- Xcode 15+

## Testing

This project currently does not ship with automated tests or a Swift Package manifest. Running the default test command results in:

```bash
swift test
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

