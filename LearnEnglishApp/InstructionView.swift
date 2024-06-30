import SwiftUI

struct InstructionView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var navigateToGame = false
    @State private var showCard = false
    @State private var showWelcomeText = false
    @State private var currentUser = "ilyas" // Kullanıcı adını buradan alın

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
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(radius: 5)
                        
                        VStack {
                            Text("Elma")
                                .font(.largeTitle)
                                .padding()
                            
                            HStack {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.green)
                                Text("Kelimeyi Biliyorum")
                                    .foregroundColor(.green)
                            }
                            .padding(.top, 20)
                            
                            HStack {
                                Text("Kelimeyi Bilmiyorum")
                                    .foregroundColor(.red)
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.red)
                            }
                            .padding(.top, 20)
                        }
                    }
                    .frame(width: 300, height: 400)
                    .scaleEffect(showCard ? 1 : 0)
                    .onAppear {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                            showCard = true
                        }
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        HStack {
                            Image(systemName: "1.circle")
                                .foregroundColor(.white)
                            Text("Sağa kaydır: Kelimeyi Bilmiyorum")
                                .foregroundColor(.white)
                        }
                        HStack {
                            Image(systemName: "2.circle")
                                .foregroundColor(.white)
                            Text("Sola kaydır: Kelimeyi Biliyorum")
                                .foregroundColor(.white)
                        }
                        HStack {
                            Image(systemName: "3.circle")
                                .foregroundColor(.white)
                            Text("Başla butonuna tıkla ve oyuna başla!")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom, 20)
                    .transition(.move(edge: .bottom))
                    
                    Button(action: {
                        navigateToGame = true
                    }) {
                        Text("Başla")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.green)
                            .cornerRadius(15.0)
                    }
                    .padding(.bottom, 40)
                    .navigationDestination(isPresented: $navigateToGame) {
                        WordGameView(currentUser: currentUser) // Kullanıcı adını buradan gönderin
                    }
                }
                .onAppear {
                    withAnimation(.easeIn(duration: 2.0)) {
                        showWelcomeText = true
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.blue)
                    Text("Back")
                        .foregroundColor(.blue)
                }
            })
        }
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
    }
}

