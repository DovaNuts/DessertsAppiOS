import SwiftUI

public struct DessertItemRowLoadingView: View {
    public var body: some View {
        HStack(spacing: Spacing.spacing10x) {
            placeholderView(width: Sizing.sizing75x, height: Sizing.sizing10x)
            Spacer()
            placeholderView(width: Sizing.sizing50x, height: Sizing.sizing50x)
        }
    }
}

struct DessertItemRowLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        DessertItemRowLoadingView()
    }
}
