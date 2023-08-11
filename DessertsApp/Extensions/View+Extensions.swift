import SwiftUI

@ViewBuilder
var placeholderTag: some View {
    placeholderView(width: Sizing.sizing25x, height: Sizing.sizing15x)
}

func placeholderView(width: CGFloat, height: CGFloat) -> some View {
    RoundedRectangle(cornerRadius: Radius.placeholder)
        .fill(Color.placeholder)
        .modifier(ShimmerEffect())
        .frame(width: width, height: height)
}
