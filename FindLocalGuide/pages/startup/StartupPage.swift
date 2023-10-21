import SwiftUI

struct StartupPage: View {
@State public var timer = Timer.publish(every: 10, on: .main , in: .common).autoconnect()
@State private var selection = 0
@State public var showLogin = false
@State public var presentHomepage = true

  private let images = ["tajmahal", "machupichu", "greatwall", "colloseum"]

  var body: some View {
          VStack{
              TabView(selection: $selection){
                  ForEach(0..<4){i in Image("\(images[i])")
                          .resizable().ignoresSafeArea().overlay(ImageOverlay(showLogin: self.$showLogin, presentHomepage: self.$presentHomepage),alignment: .bottom)
                  }
              }.tabViewStyle(PageTabViewStyle()).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                  .onReceive(timer, perform: {_ in
                      if self.showLogin {
                          timer.upstream.connect().cancel()
                      } else {
                          withAnimation{
                              selection = selection < 4 ? selection + 1 : 0
                          }
                      }
                      
                  })
              
          }.ignoresSafeArea()

  }
}

struct ImageOverlay: View {
    @Binding public var showLogin: Bool
    @Binding public var presentHomepage: Bool
    

    var body: some View {
        VStack {
            Text("Embark on a journey of discovery with the premier local guide application")
                .font(Font.custom("Stardos Stencil", size: 20).weight(.bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            
        }.opacity(0.9)
        .cornerRadius(10.0)
        .padding([.bottom], 180)
        
        Button("Get started") {
            self.showLogin.toggle()
            self.presentHomepage.toggle()
        }.fullScreenCover(isPresented: $showLogin){
            LoginPage()
        }.font(Font.custom("Roboto", size: 20).weight(.bold)).contentShape(Rectangle()).frame(width: 325, height: 60)
            .background(Color(red: 0.31, green: 0.76, blue: 0.79)).cornerRadius(10)


    }
    
}

struct StartupPage_Previews: PreviewProvider {
  static var previews: some View {
    StartupPage()
  }
}
//test commit
