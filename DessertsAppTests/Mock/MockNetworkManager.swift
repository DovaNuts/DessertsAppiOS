import Combine
import XCTest
@testable import DessertsApp

class MockNetworkManager: NetworkManager {

    var shouldError = false
    var sampleMeals = [
        DessertDTO(strMeal: "Cake", strMealThumb: "cakeURL", idMeal: "1"),
        DessertDTO(strMeal: "Pie", strMealThumb: "pieURL", idMeal: "2")
    ]

    var sampleDessertDetails = DessertDetailsDTO(idMeal: "1",
                          strMeal: "Pie",
                          strDrinkAlternate: nil,
                          strArea: "",
                          strInstructions: "Heat real good",
                          strMealThumb: "",
                          strTags: "Hot,Cold",
                          strIngredient1: "Cream", strIngredient2: "Bread", strIngredient3: nil, strIngredient4: nil,
                          strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil,
                          strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil,
                          strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil,
                          strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil,
                          strMeasure1: "5g", strMeasure2: "2 slices", strMeasure3: nil, strMeasure4: nil,
                          strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil,
                          strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil,
                          strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil,
                          strMeasure20: nil)

    override func fetchDesserts() -> AnyPublisher<MealsDTO, Error> {
        if shouldError {
            return Fail(error: NSError(domain: "", code: 1001, userInfo: nil)).eraseToAnyPublisher()
        } else {
            let response = MealsDTO(meals: sampleMeals)
            return Just(response).setFailureType(to: Error.self).eraseToAnyPublisher()
        }
    }

    override func fetchMealDetails(withID id: String) -> AnyPublisher<MealDetailsDTO, Error> {
        if shouldError || id != sampleDessertDetails.idMeal {
            return Fail(error: NSError(domain: "", code: 1001, userInfo: nil)).eraseToAnyPublisher()
        } else {
            let response = MealDetailsDTO(meals: [sampleDessertDetails])
            return Just(response).setFailureType(to: Error.self).eraseToAnyPublisher()
        }
    }
}
