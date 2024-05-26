import SwiftUI

struct DailySentenceView: View {
    @State private var sentences: [String] = []
    
    var body: some View {
        VStack(spacing: 20) {
            Text("これまでの一文")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            List(sentences, id: \.self) { sentence in
                Text(sentence)
            }
            .onAppear {
                loadSentences()
            }
        }
        .padding()
    }
    
    private func loadSentences() {
        if let savedSentences = UserDefaults.standard.array(forKey: "savedSentences") as? [String] {
            sentences = savedSentences
        }
    }
}

struct DailySentenceView_Previews: PreviewProvider {
    static var previews: some View {
        DailySentenceView()
    }
}
