# Themeable - Simple SwiftUI Theming

### Usage

```swift
import SwiftUI
import Themeable

@main struct MyApp: App {
    init() {
        Themeable.defaultTint = .pink
    }

    var body: some Scene {
        WindowGroup {
            appView.themeable()
        }
    }
    
    var appView: some View {
        Text("Hello World")
    }
}
```

### Setting a theme

```swift
import SwiftUI
import Themeable

struct SettingsView: View {
    var body: some View {
        Form {
            ThemePicker()
        }
    }
}
```
