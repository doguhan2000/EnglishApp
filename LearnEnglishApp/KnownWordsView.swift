import SwiftUI

struct KnownWordsView: View {
    @State private var knownWords: [String] = UserDefaults.standard.getKnownWords()

    var body: some View {
        ZStack {
            // Arka plan rengi
            LinearGradient(
                gradient: Gradient(colors: [Color.green, Color.pink]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Bildiğim Kelimeler")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()

                List(knownWords, id: \.self) { word in
                    Text(word)
                        .foregroundColor(.black) // List item text color
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .listStyle(PlainListStyle())
                .background(Color.clear) // Make the background of the list clear
            }
            .padding()
        }
    }
}

struct KnownWordsView_Previews: PreviewProvider {
    static var previews: some View {
        KnownWordsView()
    }
}

