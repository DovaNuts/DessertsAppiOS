import SwiftUI

struct ErrorView: View {
    let retryCallback: (() -> Void)

    var body: some View {
        content
    }

    @ViewBuilder
    private var content: some View {
        VStack(spacing: Spacing.spacing10x) {
            errorText
            retryButton
        }
    }

    @ViewBuilder
    private var errorText: some View {
        Text("Something went wrong")
            .font(.title3)
            .tint(Color.text)
    }

    @ViewBuilder
    private var retryButton: some View {
        Button {
            retryCallback()
        } label: {
            Text("Try again")
                .font(.callout)
                .frame(width: Sizing.sizing75x, height: Sizing.sizing20x)
                .background(Color.button)
                .tint(Color.text)
                .cornerRadius(Radius.button)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(retryCallback: {})
    }
}
