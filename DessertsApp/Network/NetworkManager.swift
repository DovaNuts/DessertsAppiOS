import Combine

class NetworkManager {
    static let shared = NetworkManager()

    private let apiClient = APIClient()

    func fetchDesserts() -> AnyPublisher<MealsDTO, Error> {
        return apiClient.request(APIEndpoint.getDesserts)
    }

    func fetchMealDetails(withID id: String) -> AnyPublisher<MealDetailsDTO, Error> {
        return apiClient.request(APIEndpoint.getMealDetails(id: id))
    }
}
