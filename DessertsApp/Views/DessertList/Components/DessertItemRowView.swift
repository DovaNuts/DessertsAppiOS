import SwiftUI

struct DessertItemRowView: View {

    let name: String
    let imageUrl: String

    var body: some View {
        content
    }

    @ViewBuilder
    private var content: some View {
        HStack(spacing: Spacing.spacing5x) {
            nameText
            Spacer()
            thumbnailImage
        }
    }

    @ViewBuilder
    private var nameText: some View {
        Text(name)
            .foregroundColor(Color.text)
            .font(.headline)
            .fontWeight(.medium)
    }

    @ViewBuilder
    private var thumbnailImage: some View {
        CachedAsyncImage(urlString: imageUrl)
            .aspectRatio(contentMode: .fit)
            .frame(height: Sizing.sizing50x)
            .clipShape(RoundedRectangle(cornerRadius: Radius.image))
            .overlay(RoundedRectangle(cornerRadius: Radius.image)
                .stroke(Color.secondary.opacity(0.2), lineWidth: 1))
            .shadow(color: Color.highlight.opacity(0.1), radius: Radius.shadow, x: 0, y: 4)
    }
}

struct DessertView_Previews: PreviewProvider {
    static var previews: some View {
        DessertItemRowView(name: "Dessert", imageUrl: "")
    }
}
