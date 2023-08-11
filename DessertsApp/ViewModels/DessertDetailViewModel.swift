import Combine
import Foundation

class DessertDetailViewModel: ObservableObject {
    @Published var dessert: DessertDetails?

    private(set) var state: LoadingState = .loading

    private var id: String

    private var cancellables: Set<AnyCancellable> = []
    private let networkManager: NetworkManager

    init(id: String, networkManager: NetworkManager = .shared) {
        self.id = id
        self.networkManager = networkManager
        fetchDessertDetails()
    }

    func fetchDessertDetails() {
        state = .loading

        networkManager.fetchMealDetails(withID: id)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let error) = completion {
                        self?.state = .failed
                        print("Failed to fetch dessert details: \(error)")
                    }
                },
                receiveValue: { [weak self] receivedValue in
                    guard let dessertDetails = receivedValue.meals.first else {
                        self?.state = .failed
                        return
                    }
                    self?.dessert = DessertDetails(from: dessertDetails)
                    self?.state = .loaded
                }
            )
            .store(in: &cancellables)
    }
}
