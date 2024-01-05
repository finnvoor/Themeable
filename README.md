# Themeable - Simple SwiftUI Theming

### Usage

```swift
import Themeable
import SwiftUI

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

```
