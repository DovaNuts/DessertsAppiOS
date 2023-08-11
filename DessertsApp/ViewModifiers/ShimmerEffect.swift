import SwiftUI

struct ShimmerEffect: ViewModifier {
    @State private var opacity: Double = 0.25

    private let duration: Double = 1
    private let minOpacity: Double = 0.25
    private let maxOpacity: Double = 0.75

    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .transition(.opacity)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    self.opacity = maxOpacity
                }
            }
    }
}
