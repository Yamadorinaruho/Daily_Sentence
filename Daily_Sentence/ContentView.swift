import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("ホーム")
                }
            
            DailySentenceView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("日々の一文")
                }
            
            ColumnView()
                .tabItem {
                    Image(systemName: "pencil.and.outline")
                    Text("コラム")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
