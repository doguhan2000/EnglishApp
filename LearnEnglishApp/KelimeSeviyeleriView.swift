import SwiftUI

struct KelimeSeviyeleriView: View {
    let levels = ["A1", "A2", "B1", "B2", "C1", "C2"]
    let words: [String: [String]] = [
        "A1": ["apple", "banana", "cat"],
        "A2": ["dog", "elephant", "frog"],
        "B1": ["giraffe", "hippo", "iguana"],
        "B2": ["jaguar", "kangaroo", "lion"],
        "C1": ["monkey", "newt", "octopus"],
        "C2": ["penguin", "quail", "rabbit"]
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Arka plan rengi
                LinearGradient(
                    gradient: Gradient(colors: [Color.green, Color.pink]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                List {
                    ForEach(levels, id: \.self) { level in
                        NavigationLink(destination: WordListView(words: words[level] ?? [])) {
                            Text(level)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                }
                .navigationTitle("Kelime Seviyeleri")
            }
        }
    }
}

struct WordListView: View {
    let words: [String]
    
    var body: some View {
        List(words, id: \.self) { word in
            Text(word)
        }
        .navigationTitle("Kelimeler")
    }
}

struct KelimeSeviyeleriView_Previews: PreviewProvider {
    static var previews: some View {
        KelimeSeviyeleriView()
    }
}

