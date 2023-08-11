import Combine
import UIKit

class URLImageFetcher: ObservableObject {
    @Published var image: UIImage?

    private var cancellables = Set<AnyCancellable>()

    init(urlString: String, cache: ImageCache = .shared) {
        if let cachedImage = cache.get(forKey: urlString) {
            image = cachedImage
            return
        }

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .compactMap(UIImage.init)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { fetchedImage in
                    self.image = fetchedImage
                    cache.set(fetchedImage, forKey: urlString)
                }
            )
            .store(in: &cancellables)
    }
}
