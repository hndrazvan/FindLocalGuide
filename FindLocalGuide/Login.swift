import SwiftUI
import Combine
import FirebaseAuth

struct Login: View {
  @StateObject var viewModel = ViewModel()

  var body: some View {
    @State var shouldNavigate = false
      NavigationView() {
          ZStack() {
            Group {
                Text("Welcome Back: Your Journey Awaits")
                    .font(Font.custom("Roboto", size: 20).weight(.bold))
                    .foregroundColor(.black)
                    .offset(x: 15, y: -228.50)
                Ellipse()
                    .foregroundColor(Color(red: 0.32, green: 0.35, blue: 0.65))
                    .frame(width: 300, height: 250)
                //.background(Color(red: 0.32, green: 0.35, blue: 0.65))
                    .offset(x: -160.50, y: -380)
                Ellipse()
                    .foregroundColor(Color(red: 0.56, green: 0.88, blue: 0.84))
                    .frame(width: 300, height: 300)
                    .offset(x: 20.50, y: -445)
                ZStack() {
                    ZStack() {
                    }
                    .frame(width: 22.96, height: 23)
                    .background(Color(red: 0, green: 0, blue: 0).opacity(0))
                    .offset(x: 161.25, y: -2.48)
                    ZStack() {
                        
                    }
                    .frame(width: 25, height: 25)
                    .background(Color(red: 0, green: 0, blue: 0).opacity(0))
                    .offset(x: 152.77, y: -0.52)
                    ZStack() {
                        
                    }
                    .frame(width: 25, height: 25)
                    .background(Color(red: 0, green: 0, blue: 0).opacity(0))
                    .offset(x: 112.77, y: 1.48)
                }
                .frame(width: 345.45, height: 27.96)
                .offset(x: -3.77, y: -400.98)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 253, height: 54)
                        .background(Color(red: 0.31, green: 0.76, blue: 0.79))
                        .cornerRadius(10)
                        .offset(x: 0, y: 0)
                    Button("Login", action: {
                        Task {
                            await viewModel.signIn()
                        }
                    }).font(Font.custom("Roboto", size: 20).weight(.bold))
                        .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.08))
                        .offset(x: -0.39, y: 0)
                }
                .frame(width: 253, height: 54)
                .offset(x: 1, y: 263)
                
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 350, height: 48)
                        .background(.white)
                        .cornerRadius(100)
                        .offset(x: 0, y: 0)
                    PasswordInputView(placeHolder: "Enter your password", txt: $viewModel.password)
                        .onChange(of: viewModel.password, perform: onInputChanged)
                }
                .frame(width: 350, height: 48)
                .offset(x: 9.50, y: 139)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 350, height: 45)
                        .background(.white)
                        .cornerRadius(100)
                        .offset(x: 0, y: 0)
                    EmailInputView(placeHolder: "Enter your email", txt: $viewModel.email)
                        .onChange(of: viewModel.email, perform: onInputChanged)
                }
                .frame(width: 350, height: 45)
                .offset(x: 9.50, y: 63.50)
                Text("Forgot password?")
                    .font(Font.custom("Roboto", size: 20))
                    .foregroundColor(Color(red: 0.06, green: 0.50, blue: 0.91))
                    .offset(x: 4.50, y: 203.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 382, height: 198)
                    .background(
                        Image("login-image").resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 382, height: 198)
                            .clipped()
                    )
                    .offset(x: 0, y: -105)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                    )
            }
            Group {
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 253, height: 54)
                        .background(Color(red: 0.31, green: 0.76, blue: 0.79))
                        .cornerRadius(10)
                        .offset(x: 0, y: 0)
                    Button("Login", action: {
                        Task {
                            await viewModel.signIn()
                        }
                    }).font(Font.custom("Roboto", size: 20).weight(.bold))
                        .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.08))
                        .offset(x: -0.39, y: 0)
                }
                .frame(width: 253, height: 54)
                .offset(x: 1, y: 263)
                
                Text("Don't have an account?")
                    .font(Font.custom("Roboto", size: 20))
                    .foregroundColor(.black).offset(x: -25, y: 363)
                Button {
                    
                } label: {
                    NavigationLink(destination: SignUp()){
                        Text("Sign up")
                    }
                }.offset(x: 125, y: 363)
                
                
            }
          }.frame(width: 493, height: 852).background(Color(red: 0.93, green: 0.93, blue: 0.93));
      }.navigationBarBackButtonHidden(true)
  }
    private func onInputChanged(changed: String) {
        //ßprint("-----> in onInputChanged: \(changed) ")
    }
    private func onLoginButtonClick(){
        //print("Hello world: " + viewModel.email)
        //viewModel.signIn();
        //print(Auth.auth().currentUser)
            
    }
}

struct Login_Previews: PreviewProvider {
  static var previews: some View {
    Login()
  }
}
