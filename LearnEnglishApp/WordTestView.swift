import SwiftUI

struct WordTestView: View {
    @State private var currentQuestionIndex = UserDefaults.standard.integer(forKey: "currentQuestionIndex")
    @State private var showResult = false
    @State private var isCorrect = false

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

                VStack {
                    // Renkli başlık
                    VStack {
                        HStack {
                            Text("En")
                                .foregroundColor(.red)
                            Text("Çok")
                                .foregroundColor(.orange)
                            Text("Çıkan")
                                .foregroundColor(.yellow)
                        }
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                        .shadow(radius: 5)
                        
                        HStack {
                            Text("Kelimeler")
                                .foregroundColor(.blue)
                        }
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom)
                        .shadow(radius: 5)
                    }

                    // Soru sayacı
                    Text("Kalan Sorular: \(testQuestions.count - currentQuestionIndex)")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()

                    if currentQuestionIndex < testQuestions.count {
                        QuestionCardView(
                            question: testQuestions[currentQuestionIndex],
                            onAnswerSelected: { answer in
                                checkAnswer(answer)
                            }
                        )
                    } else {
                        Text("Tüm sorular tamamlandı!")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }

                if showResult {
                    ResultView(
                        isCorrect: isCorrect,
                        onNextQuestion: {
                            nextQuestion()
                        },
                        onDismiss: {
                            showResult = false
                        }
                    )
                }
            }
            .navigationBarItems(trailing:
                Button(action: {
                    restartTest()
                }) {
                    Text("Tekrar Başla")
                        .font(.headline)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .transition(.scale)
                }
            )
        }
    }

    private func checkAnswer(_ answer: String) {
        let correctAnswer = testQuestions[currentQuestionIndex].correctAnswer
        isCorrect = (answer == correctAnswer)
        showResult = true
    }

    private func nextQuestion() {
        showResult = false
        if isCorrect {
            currentQuestionIndex += 1
            UserDefaults.standard.set(currentQuestionIndex, forKey: "currentQuestionIndex")
        }
    }

    private func restartTest() {
        currentQuestionIndex = 0
        UserDefaults.standard.set(currentQuestionIndex, forKey: "currentQuestionIndex")
        showResult = false
        isCorrect = false
    }
}

struct WordTestView_Previews: PreviewProvider {
    static var previews: some View {
        WordTestView()
    }
}

