import SwiftUI

struct CachedAsyncImage: View {
    @ObservedObject var imageFetcher: URLImageFetcher

    init(urlString: String) {
        imageFetcher = URLImageFetcher(urlString: urlString)
    }

    var body: some View {
        Image(uiImage: imageFetcher.image ?? UIImage(named: "placeholder")!)
            .resizable()
    }
}
