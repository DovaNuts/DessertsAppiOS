import SwiftUI

public struct DessertDetailLoadingView: View {
    public var body: some View {
        VStack(alignment: .leading, spacing: Spacing.spacing10x) {
            placeholderView(width: Sizing.sizing175x, height: Sizing.sizing175x)
            placeholderView(width: Sizing.sizing125x, height: Sizing.sizing50x)

            HStack {
                placeholderTag
                placeholderTag
            }

            VStack(alignment: .leading, spacing: Spacing.spacing5x) {
                placeholderView(width: Sizing.sizing100x, height: Sizing.sizing10x)
                placeholderView(width: Sizing.sizing100x, height: Sizing.sizing10x)
                placeholderView(width: Sizing.sizing100x, height: Sizing.sizing10x)
            }

            Spacer()
        }
    }
}

struct DessertDetailLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailLoadingView()
    }
}
