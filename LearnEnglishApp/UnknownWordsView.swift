import SwiftUI

struct UnknownWordsView: View {
    @State private var unknownWords: [String] = UserDefaults.standard.getUnknownWords()

    var body: some View {
        List(unknownWords, id: \.self) { word in
            Text(word)
        }
        .navigationTitle("Bilmediğim Kelimeler")
    }
}

struct UnknownWordsView_Previews: PreviewProvider {
    static var previews: some View {
        UnknownWordsView()
    }
}

