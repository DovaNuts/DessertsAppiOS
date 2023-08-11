import Combine
import Foundation

class DessertListViewModel: ObservableObject {
    @Published var desserts: [Dessert] = []
    @Published var selectedDessert: Dessert?
    @Published var searchText: String = ""

    private(set) var state: LoadingState = .loading

    private var cancellables: Set<AnyCancellable> = []
    private let networkManager: NetworkManager

    var searchResults: [Dessert] {
        if searchText.isEmpty {
            return desserts
        } else {
            return desserts.filter { $0.name.contains(searchText) }
        }
    }

    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
        fetchDesserts()
    }

    func cleanCache() {
        ImageCache.shared.clean()
        fetchDesserts()
    }

    func fetchDesserts() {
        state = .loading

        networkManager.fetchDesserts()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let error) = completion {
                        self?.state = .failed
                        print("Failed to fetch desserts: \(error)")
                    }
                },
                receiveValue: { [weak self] receivedValue in
                    guard receivedValue.meals.count > 0 else {
                        self?.state = .failed
                        return
                    }
                    self?.desserts = receivedValue.meals.map { dessert in
                        return Dessert(name: dessert.strMeal, image: dessert.strMealThumb, mealID: dessert.idMeal)
                    }.sorted { $0.name < $1.name }
                    self?.state = .loaded
                }
            )
            .store(in: &cancellables)
    }
}
