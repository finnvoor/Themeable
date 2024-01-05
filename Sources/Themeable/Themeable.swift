import Defaults
import SwiftUI

public extension View {
    func themeable() -> some View {
        modifier(Themeable())
    }
}

// MARK: - Themeable

public struct Themeable: ViewModifier {
    // MARK: Public

    public static var defaultTint: Color = .blue
    public static var availableThemes: [Color] = [
        .red, .orange, .yellow, .green, .mint, .teal,
        .cyan, .blue, .indigo, .purple, .pink, .brown
    ]
    public static var defaultsKey = Defaults.Key("themeTint") { Self.defaultTint }

    public func body(content: Content) -> some View {
        content
            .tint(tintColor)
            .onAppear { tintWindows() }
            .onChange(of: tintColor) { _, _ in tintWindows() }
    }

    // MARK: Private

    @Default(Self.defaultsKey) private var tintColor: Color

    private func tintWindows() {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .forEach { $0.tintColor = UIColor(tintColor) }
    }
}
