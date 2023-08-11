import Foundation

enum APIEndpoint {
    case getDesserts
    case getMealDetails(id: String)

    var scheme: String {
        return URLProvider.scheme.rawValue
    }

    var host: String {
        return URLProvider.host.rawValue
    }

    var path: String {
        switch self {
        case .getDesserts:
            return URLProvider.mealsFilterEndpoint.rawValue
        case .getMealDetails:
            return URLProvider.mealLookUpEndpoint.rawValue
        }
    }

    var queryItem: URLQueryItem {
        switch self {
        case .getDesserts:
            return URLQueryItem(name: "c", value: "Dessert")
        case .getMealDetails(let id):
            return URLQueryItem(name: "i", value: id)
        }
    }

    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = [queryItem]
        return components.url
    }
}

private enum URLProvider: String {
    case scheme = "https"
    case host = "themealdb.com"
    case mealsFilterEndpoint = "/api/json/v1/1/filter.php"
    case mealLookUpEndpoint = "/api/json/v1/1/lookup.php"
}
