<img width="512" height="512" alt="SparrowLogo" src="https://github.com/user-attachments/assets/d3231d0d-54bb-4f7b-897a-f89db8752050" />

# 🐦 Sparrow  
A lightweight, backend-agnostic analytics layer for Swift applications.

Sparrow provides a small, predictable API for recording analytics events, user identity, and screen views. It forwards all analytics data to any number of registered providers that conform to `AnalyticsProvider`. Sparrow does not rely on any specific backend and works with Segment, Mixpanel, Firebase, Supabase, custom APIs, or any internal analytics service.

The design emphasizes clarity, minimalism, and extensibility.

---

## Features

- Simple, unified analytics API  
- Backend-agnostic provider system  
- Event tracking with structured properties  
- Screen/view tracking  
- User identification with traits  
- Main actor isolation for UI-safe dispatch  
- No dependencies  
- Swift Testing support via a built-in mock provider  

---

## Installation

Add Sparrow to your **Package.swift**:

```swift
dependencies: [
    .package(url: "https://github.com/<your-username>/Sparrow.git", from: "1.0.0")
]
```

Then add this to your target:

```swift
.target(
    name: "YourApp",
    dependencies: ["Sparrow"]
)
```

## Usage
1. Register Providers

Register providers at application startup:

```swift
import Sparrow

@main
struct MyApp: App {
    init() {
        AnalyticsService.shared.register(ConsoleProvider())
        AnalyticsService.shared.register(MyCustomProvider())
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```
2. Track Events

Record structured analytics events:

```swift
AnalyticsService.shared.track(
    "ingredient_added",
    properties: [
        "name": "Tomato",
        "quantity": 3
    ]
)
```

Equivalent explicit form:

```swift
AnalyticsService.shared.track(
    AnalyticsEvent("ingredient_added", properties: ["name": "Tomato"])
)
```

3. Identify Users

Associate traits or persistent metadata with a user:

```swift
let user = AppUser(
    "user_123",
    traits: [
        "tier": "gold",
        "subscribed": true
    ]
)

AnalyticsService.shared.identify(user)
```
4. Record Screen Views

Record screen or view transitions:

```swift
AnalyticsService.shared.screen(
    Display("Pantry", properties: ["filter": "produce"])
)
```

Creating a Custom Provider

To integrate Sparrow with any backend, implement AnalyticsProvider:

```swift
import Sparrow

struct MyCustomProvider: AnalyticsProvider {
    func configure() {
        // Perform any initial setup here
    }

    func track(_ event: AnalyticsEvent) {
        // Send event.name and event.properties to your backend
    }

    func identify(_ user: AppUser) {
        // Send user.userId and traits
    }

    func screen(_ display: Display) {
        // Send screen view information
    }
}
```

Register it:

```swift
AnalyticsService.shared.register(MyCustomProvider())
```

Example: Console Provider
```swift
struct ConsoleProvider: AnalyticsProvider {
    func configure() { }

    func track(_ event: AnalyticsEvent) {
        print("[Event] \(event.name) -> \(event.properties ?? [:])")
    }

    func identify(_ user: AppUser) {
        print("[Identify] \(user.userId) -> \(user.traits ?? [:])")
    }

    func screen(_ display: Display) {
        print("[Screen] \(display.name) -> \(display.properties ?? [:])")
    }
}
```

## License

Sparrow is released under the MIT License.
