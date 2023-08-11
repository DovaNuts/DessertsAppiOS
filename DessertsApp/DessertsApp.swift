import SwiftUI

@main
struct DessertsApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some Scene {
        WindowGroup {
            DessertListView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
