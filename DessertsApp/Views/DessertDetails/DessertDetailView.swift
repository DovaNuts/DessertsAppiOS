import SwiftUI

struct DessertDetailView: View {

    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: DessertDetailViewModel

    init(id: String) {
        self.viewModel = DessertDetailViewModel(id: id)
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                content
                    .padding(.horizontal)
                    .toolbar { ToolbarItem { toolbarCloseButton } }
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading: loading
        case .failed: error
        case .loaded: main
        }
    }

    @ViewBuilder
    private var main: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.spacing10x) {
                thumbnailImage
                dessertNameText
                tagList
                ingredientsAndMeasuresList
                instructions
            }
        }
    }

    @ViewBuilder
    private var thumbnailImage: some View {
        HStack {
            Spacer()
            CachedAsyncImage(urlString: viewModel.dessert?.thumbnail?.absoluteString ?? "")
                .scaledToFit()
                .frame(height: Sizing.sizing175x)
                .cornerRadius(Radius.image)
                .shadow(color: Color.subtext.opacity(0.2), radius: Radius.shadow, x: 0, y: 2)
            Spacer()
        }
    }

    @ViewBuilder
    private var dessertNameText: some View {
        Text(viewModel.dessert?.name ?? "")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.text)
    }

    @ViewBuilder
    private var tagList: some View {
        HStack {
            if let tags = viewModel.dessert?.tags {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .padding(.horizontal, Spacing.spacing5x)
                        .padding(.vertical, Spacing.spacing3x)
                        .background(Color.subtext.opacity(0.3))
                        .cornerRadius(Radius.pill)
                        .foregroundColor(Color.highlight)
                }
            }
        }
    }

    @ViewBuilder
    private var ingredientsAndMeasuresList: some View {
        VStack(alignment: .leading, spacing: Spacing.spacing5x) {
            Text("Ingredients")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.text)

            if let ingredients = viewModel.dessert?.ingredients {
                ForEach(ingredients, id: \.name) { ingredient in
                    Text("• \(ingredient.name) (\(ingredient.measure))")
                        .foregroundColor(Color.subtext)
                }
            }
        }
    }

    @ViewBuilder
    private var instructions: some View {
        VStack(alignment: .leading, spacing: Spacing.spacing5x) {
            Text("Instructions")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.text)

            Text(viewModel.dessert?.instructions ?? "")
                .foregroundColor(Color.text)
                .lineSpacing(Spacing.spacing3x)
                .multilineTextAlignment(.leading)
        }
    }

    @ViewBuilder
    private var toolbarCloseButton: some View {
        Button {
            dismiss()
        } label: {
            Text("X")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.subtext)
        }
    }

    @ViewBuilder
    private var loading: some View {
        DessertDetailLoadingView()
    }

    @ViewBuilder
    private var error: some View {
        ErrorView(retryCallback: { viewModel.fetchDessertDetails() })
    }
}

struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailView(id: "0")
    }
}
