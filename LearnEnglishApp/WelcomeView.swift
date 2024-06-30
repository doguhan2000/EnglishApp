import SwiftUI

struct WelcomeView: View {
    @State private var navigateToHome = false
    @State private var showWelcomeMessage = false
    let username: String
    
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
                    Spacer()
                    
                    // Horoz animasyonu
                    Image("horoz")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .offset(y: showWelcomeMessage ? 0 : -UIScreen.main.bounds.height / 2)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.5)) {
                                showWelcomeMessage = true
                            }
                        }
                    
                    Spacer()
                    
                    if showWelcomeMessage {
                        Text("İngilizce Öğrenmeye Hazır Mısın, \(username)?")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .transition(.opacity)
                            .padding(.bottom, 20)
                        
                        Button(action: {
                            navigateToHome = true
                        }) {
                            Text("Hazırım")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(Color.green)
                                .cornerRadius(15.0)
                        }
                    }
                    
                    Spacer()
                }
                
                // Animasyonlu toplar
                ForEach(0..<10) { _ in
                    FallingBallView()
                }
            }
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(username: "TestUser")
    }
}

