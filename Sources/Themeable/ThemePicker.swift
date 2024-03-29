import Defaults
import SwiftUI

// MARK: - ThemePicker

public struct ThemePicker: View {
    // MARK: Lifecycle

    public init() {}

    // MARK: Public

    public var body: some View {
        Section("Theme") {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Spacer().frame(width: 12)
                    ThemeItem(
                        color: Themeable.defaultTint,
                        tintColor: $tintColor
                    )
                    ForEach(
                        Themeable.availableThemes,
                        id: \.description
                    ) { color in
                        if color != Themeable.defaultTint {
                            ThemeItem(
                                color: color,
                                tintColor: $tintColor
                            )
                        }
                    }
                    Spacer().frame(width: 12)
                }
            }.listRowInsets(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
        }
        .sensoryFeedback(.selection, trigger: tintColor)
    }

    // MARK: Private

    @Default(Themeable.defaultsKey) private var tintColor
}

// MARK: - ThemeItem

struct ThemeItem: View {
    let color: Color
    @Binding var tintColor: Color

    var body: some View {
        Button(action: {
            tintColor = color
        }) {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(color)
                .padding(3)
                .overlay(
                    Circle()
                        .stroke(color.secondary, lineWidth: 3)
                        .opacity(color.resolve(in: .init()) == tintColor.resolve(in: .init()) ? 1 : 0)
                )
                .padding(2)
        }
    }
}

#Preview {
    Form {
        ThemePicker()
            .themeable()
    }
}
