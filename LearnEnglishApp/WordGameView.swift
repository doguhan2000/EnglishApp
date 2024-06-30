import SwiftUI

struct WordGameView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var words: [Word] = [
        Word(text: "Apple"), Word(text: "Banana"), Word(text: "Cherry"), Word(text: "Date"),
        Word(text: "Elderberry"), Word(text: "Fig"), Word(text: "Grape"), Word(text: "Honeydew"),
        Word(text: "Indian Fig"), Word(text: "Jackfruit"), Word(text: "Kiwi"), Word(text: "Lemon"),
        Word(text: "Mango"), Word(text: "Nectarine"), Word(text: "Orange"), Word(text: "Papaya"),
        Word(text: "Quince"), Word(text: "Raspberry"), Word(text: "Strawberry"), Word(text: "Tangerine"),
        Word(text: "Ugli fruit"), Word(text: "Vanilla"), Word(text: "Watermelon"), Word(text: "Xigua"),
        Word(text: "Yellow passion fruit"), Word(text: "Zucchini"), Word(text: "Apricot"), Word(text: "Blackberry"),
        Word(text: "Cantaloupe"), Word(text: "Dragonfruit"), Word(text: "Eggfruit"), Word(text: "Feijoa"),
        Word(text: "Grapefruit"), Word(text: "Hackberry"), Word(text: "Imbe"), Word(text: "Jujube"),
        Word(text: "Kumquat"), Word(text: "Lime"), Word(text: "Mulberry"), Word(text: "Nance"),
        Word(text: "Olive"), Word(text: "Pineapple"), Word(text: "Quandong"), Word(text: "Rambutan"),
        Word(text: "Salak"), Word(text: "Tamarind"), Word(text: "Uva-ursi"), Word(text: "Voavanga"),
        Word(text: "Wolfberry"), Word(text: "Ximenia"), Word(text: "Yumberry"), Word(text: "Ziziphus")
    ]
    
    @State private var currentIndex: Int
    @State private var showRooster = false
    @State private var knownWordCount = 0
    @State private var navigateBack = false

    @State private var currentUser: String
    @State private var backgroundGradient: LinearGradient

    init(currentUser: String) {
        self._currentUser = State(initialValue: currentUser)
        let savedIndex = UserDefaults.standard.integer(forKey: "currentIndex_\(currentUser)")
        self._currentIndex = State(initialValue: savedIndex)
        self._backgroundGradient = State(initialValue: LinearGradient(
            gradient: Gradient(colors: [Color.green, Color.pink]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ))
    }

    var body: some View {
        NavigationStack {
            ZStack {
                backgroundGradient
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("rooster")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.top, 40)
                        .offset(y: showRooster ? 0 : -UIScreen.main.bounds.height)
                        .onAppear {
                            withAnimation(.easeOut(duration: 1.0)) {
                                showRooster = true
                            }
                        }
                    
                    Text("Toplam Kelime Sayısı: \(words.count - knownWordCount)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .transition(.scale)
                        .animation(.easeInOut, value: words.count - knownWordCount)
                    
                    Spacer()
                    
                    if currentIndex < words.count {
                        WordCardView(word: words[currentIndex]) { direction in
                            handleSwipe(direction)
                        }
                    } else {
                        Text("Tüm kelimeler tamamlandı!")
                            .font(.largeTitle)
                            .padding()
                    }
                    
                    Spacer()
                }
                .navigationDestination(isPresented: $navigateBack) {
                    InstructionView()
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(
                    leading: Button(action: {
                        navigateBack = true
                    }) {
                        HStack {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.blue)
                            Text("Back")
                                .foregroundColor(.blue)
                        }
                    },
                    trailing: Button(action: {
                        restart()
                    }) {
                        Text("En Baştan Başlat")
                            .font(.headline)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                )
            }
        }
    }
    
    private func handleSwipe(_ direction: SwipeDirection) {
        if direction == .right {
            print("Bilinmeyen kelime: \(words[currentIndex].text)")
        } else if direction == .left {
            print("Bilinen kelime: \(words[currentIndex].text)")
            withAnimation {
                knownWordCount += 1
            }
        }
        
        currentIndex += 1
        saveProgress()
        changeBackgroundColor()
    }

    private func saveProgress() {
        UserDefaults.standard.set(currentIndex, forKey: "currentIndex_\(currentUser)")
    }

    private func restart() {
        currentIndex = 0
        UserDefaults.standard.set(currentIndex, forKey: "currentIndex_\(currentUser)")
        knownWordCount = 0
        backgroundGradient = LinearGradient(
            gradient: Gradient(colors: [Color.green, Color.pink]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    private func changeBackgroundColor() {
        let colors: [Color] = [.red, .blue, .green, .orange, .purple, .yellow]
        backgroundGradient = LinearGradient(
            gradient: Gradient(colors: [colors.randomElement() ?? .green, .pink]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

struct WordGameView_Previews: PreviewProvider {
    static var previews: some View {
        WordGameView(currentUser: "ilyas")
    }
}

