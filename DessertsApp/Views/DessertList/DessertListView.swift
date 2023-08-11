import SwiftUI

struct DessertListView: View {

    @AppStorage("isDarkMode") private var isDarkMode = false
    @ObservedObject var viewModel = DessertListViewModel()

    var body: some View {
        NavigationView {
            content
            .toolbar { ToolbarItem { toolbarContextMenu } }
            .navigationTitle("Desserts")
            .sheet(item: $viewModel.selectedDessert) { selectedDessert in
                DessertDetailView(id: selectedDessert.mealID)
                    .background(Color.background)
            }
            .refreshable {
                viewModel.fetchDesserts()
            }
            .searchable(text: $viewModel.searchText)
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading: loading
        case .failed: error
        case .loaded: dessertList
        }
    }

    @ViewBuilder
    private var dessertList: some View {
        List {
            ForEach(viewModel.searchResults, id: \.id) { dessert in
                DessertItemRowView(name: dessert.name, imageUrl: dessert.image)
                    .contentShape(Rectangle())
                    .onTapGesture { viewModel.selectedDessert = dessert }
            }
        }
    }

    @ViewBuilder
    private var toolbarContextMenu: some View {
        Menu {
            toolbarDarkModeToggle
            toolbarCleanCacheButton
        } label: {
            Image(systemName: "gear.circle")
        }

    }

    @ViewBuilder
    private var toolbarDarkModeToggle: some View {
        Toggle("Dark mode", isOn: $isDarkMode)
            .tint(Color.highlight)
    }

    @ViewBuilder
    private var toolbarCleanCacheButton: some View {
        Button {
            viewModel.cleanCache()
        } label: {
            Text("Clean image cache")
                .tint(Color.highlight)
        }
    }

    @ViewBuilder
    private var loading: some View {
        List {
            DessertItemRowLoadingView()
            DessertItemRowLoadingView()
            DessertItemRowLoadingView()
            DessertItemRowLoadingView()
            DessertItemRowLoadingView()
        }
    }

    @ViewBuilder
    private var error: some View {
        ErrorView(retryCallback: { viewModel.fetchDesserts() })
    }
}

struct DessertsListView_Previews: PreviewProvider {
    static var previews: some View {
        DessertListView()
    }
}
