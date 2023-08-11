import Foundation

struct DessertDetails {
    let id: String
    let name: String
    let instructions: String
    let thumbnail: URL?
    let tags: [String]
    let ingredients: [Ingredient]
}

extension DessertDetails {
    init(from apiDessertDetails: DessertDetailsDTO) {
        self.id = apiDessertDetails.idMeal
        self.name = apiDessertDetails.strMeal
        self.instructions = apiDessertDetails.strInstructions
        self.thumbnail = URL(string: apiDessertDetails.strMealThumb)
        self.tags = apiDessertDetails.strTags?.split(separator: ",").map(String.init) ?? []
        self.ingredients =  apiDessertDetails.ingredientsList.map { Ingredient(name: $0.name, measure: $0.measure) }
    }
}
