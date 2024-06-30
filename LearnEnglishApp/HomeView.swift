import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showRooster = false
    @State private var showFirstRow = false
    @State private var showSecondRow = false
    @State private var showThirdRow = false

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
                
                VStack(spacing: 20) {
                    // Horoz resmi
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
                    
                    // Kartlar
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            NavigationLink(destination: InstructionView()) {
                                HomeCardView(imageName: "camera.metering.spot", title: "Kelime Kaydırma")
                            }
                            .offset(x: showFirstRow ? 0 : -UIScreen.main.bounds.width)
                            
                            NavigationLink(destination: WordTestView()) {
                                HomeCardView(imageName: "server.rack", title: "Kelime Test")
                            }
                            .offset(x: showFirstRow ? 0 : UIScreen.main.bounds.width)
                        }
                        .onAppear {
                            withAnimation(.easeOut(duration: 1.0).delay(0.5)) {
                                showFirstRow = true
                            }
                        }

                        HStack(spacing: 20) {
                            NavigationLink(destination: KelimeSeviyeleriView()) {
                                HomeCardView(imageName: "bubble.left.and.bubble.right", title: "Kelime Seviyeleri")
                            }
                            .offset(x: showSecondRow ? 0 : -UIScreen.main.bounds.width)
                            
                            NavigationLink(destination: Text("Dil Bilgisi")) {
                                HomeCardView(imageName: "network", title: "Dil Bilgisi")
                            }
                            .offset(x: showSecondRow ? 0 : UIScreen.main.bounds.width)
                        }
                        .onAppear {
                            withAnimation(.easeOut(duration: 1.0).delay(0.7)) {
                                showSecondRow = true
                            }
                        }

                        HStack(spacing: 20) {
                            NavigationLink(destination: Text("Makaleler")) {
                                HomeCardView(imageName: "desktopcomputer", title: "Makaleler")
                            }
                            .offset(x: showThirdRow ? 0 : -UIScreen.main.bounds.width)
                            
                            NavigationLink(destination: Text("Bize Ulaşın")) {
                                HomeCardView(imageName: "doc.text", title: "Bize Ulaşın")
                            }
                            .offset(x: showThirdRow ? 0 : UIScreen.main.bounds.width)
                        }
                        .onAppear {
                            withAnimation(.easeOut(duration: 1.0).delay(0.9)) {
                                showThirdRow = true
                            }
                        }
                    }
                    .padding()
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

struct HomeCardView: View {
    var imageName: String
    var title: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
            Text(title)
                .foregroundColor(.yellow)
        }
        .frame(width: 100, height: 100)
        .background(Color.green)
        .cornerRadius(10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

