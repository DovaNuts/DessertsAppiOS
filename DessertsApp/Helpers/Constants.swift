import SwiftUI

public struct Radius {
    private init() {}
}

public struct Sizing {
    private init() {}
}
public struct Spacing {
    private init() {}
}

// MARK: - Radius
public extension Radius {
    static var image: CGFloat {
        return 16
    }

    static var pill: CGFloat {
        return 15
    }

    static var placeholder: CGFloat {
        return 6
    }

    static var button: CGFloat {
        return 20
    }

    static var shadow: CGFloat {
        return 8
    }
}

// MARK: - Sizing
public extension Sizing {
    static var sizing10x: CGFloat {
        return 20
    }

    static var sizing15x: CGFloat {
        return 30
    }

    static var sizing20x: CGFloat {
        return 40
    }

    static var sizing25x: CGFloat {
        return 50
    }

    static var sizing50x: CGFloat {
        return 100
    }

    static var sizing75x: CGFloat {
        return 150
    }

    static var sizing100x: CGFloat {
        return 200
    }

    static var sizing125x: CGFloat {
        return 250
    }

    static var sizing175x: CGFloat {
        return 350
    }
}

// MARK: - Spacing
public extension Spacing {
    static var spacing3x: CGFloat {
        return 6
    }

    static var spacing5x: CGFloat {
        return 10
    }

    static var spacing10x: CGFloat {
        return 20
    }
}

// MARK: - Color
public extension Color {
    static var isDarkMode: Bool {
        @AppStorage("isDarkMode") var isDarkMode = false
        return isDarkMode
    }

    static var background: Color {
        return isDarkMode ? backgroundDark : backgroundLight
    }

    static var button: Color {
        return isDarkMode ? buttonDark : buttonLight
    }

    static var highlight: Color {
        return isDarkMode ? highlightDark : highlightLight
    }

    static var text: Color {
        return isDarkMode ? textDark : textLight
    }

    static var subtext: Color {
        return isDarkMode ? subtextDark : subtextLight
    }

    static var placeholder: Color {
        return isDarkMode ? placeholderDark : placeholderLight
    }

    // Light
    private static var backgroundLight: Color {
        return Color(hex: "#FFF5E1")
    }

    private static var buttonLight: Color {
        return Color(hex: "#FFC2A2")
    }

    private static var highlightLight: Color {
        return Color(hex: "EB5081")
    }

    private static var textLight: Color {
        return Color(hex: "#4A2A20")
    }

    private static var subtextLight: Color {
        return Color(hex: "#C72257")
    }

    private static var secondaryLight: Color {
        return Color(hex: "#FFB389")
    }

    private static var placeholderLight: Color {
        return Color(hex: "#ffeac7")
    }

    // Dark
    private static var backgroundDark: Color {
        return Color(hex: "#1E1E1E")
    }

    private static var buttonDark: Color {
        return Color(hex: "#8A4A30")
    }

    private static var highlightDark: Color {
        return Color(hex: "#EB5081")
    }

    private static var textDark: Color {
        return Color(hex: "#EDEDED")
    }

    private static var subtextDark: Color {
        return Color(hex: "#FF8BA0")
    }

    private static var secondaryDark: Color {
        return Color(hex: "#8A5B57")
    }

    private static var placeholderDark: Color {
        return Color(hex: "#3D3D3D")
    }
}
