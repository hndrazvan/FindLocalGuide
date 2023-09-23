import SwiftUI
import Combine
import FirebaseAuth

struct SignUp: View {
  @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationView(){
            ZStack() {
                Group {
                    Ellipse()
                        .foregroundColor(Color(red: 0.56, green: 0.88, blue: 0.84))
                        .frame(width: 300, height: 250)
                        .offset(x: -160.50, y: -380)
                    Ellipse()
                        .foregroundColor(Color(red: 0.56, green: 0.88, blue: 0.84))
                        .frame(width: 300, height: 300)
                        .offset(x: 20.50, y: -445).overlay(Text("Join the adventure: Sign Up Now!")
                            .font(Font.custom("Roboto", size: 20).weight(.bold))
                            .foregroundColor(.black)
                            .offset(x: 15, y: -328.50))
                    Text(" Become a Local Expert:")
                        .font(Font.custom("Roboto", size: 20))
                        .foregroundColor(.black)
                        .offset(x: 15, y: -268.50)
                    Text("Join as a Guide and Share Your Insights!")
                        .font(Font.custom("Roboto", size: 20))
                        .foregroundColor(.black)
                        .offset(x: 15, y: -238.50)
                }
                Group {
                    
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 350, height: 45)
                            .background(.white)
                            .cornerRadius(100)
                            .offset(x: 0, y: 0)
                        EmailInputView(placeHolder: "Enter your firstname", txt: $viewModel.firstName)
                            .onChange(of: viewModel.firstName, perform: onInputChanged)
                    }.frame(width: 350, height: 45)
                        .offset(x: 9.50, y: -150)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 350, height: 45)
                            .background(.white)
                            .cornerRadius(100)
                            .offset(x: 0, y: 0)
                        EmailInputView(placeHolder: "Enter your lastname", txt: $viewModel.lastName)
                            .onChange(of: viewModel.lastName, perform: onInputChanged)
                    }.frame(width: 350, height: 45)
                        .offset(x: 9.50, y: -95)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 350, height: 45)
                            .background(.white)
                            .cornerRadius(100)
                            .offset(x: 0, y: 0)
                        EmailInputView(placeHolder: "Enter your email", txt: $viewModel.email)
                            .onChange(of: viewModel.email, perform: onInputChanged)
                    }.frame(width: 350, height: 45)
                        .offset(x: 9.50, y: -40)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 350, height: 45)
                            .background(.white)
                            .cornerRadius(100)
                            .offset(x: 0, y: 0)
                        PasswordInputView(placeHolder: "Enter your password", txt: $viewModel.password)
                            .onChange(of: viewModel.password, perform: onInputChanged)
                    }.frame(width: 350, height: 45)
                        .offset(x: 9.50, y: 15)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 350, height: 45)
                            .background(.white)
                            .cornerRadius(100)
                            .offset(x: 0, y: 0)
                        PasswordInputView(placeHolder: "Confirm password", txt: $viewModel.password)
                            .onChange(of: viewModel.password, perform: onConfirmPassword)
                    }.frame(width: 350, height: 45)
                        .offset(x: 9.50, y: 70)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 170, height: 45)
                            .background(.white)
                            .cornerRadius(100)
                            .offset(x: 0, y: 0)
                        EmailInputView(placeHolder: "City", txt: $viewModel.city)
                            .onChange(of: viewModel.city, perform: onInputChanged)
                    }.frame(width: 170, height: 45)
                        .offset(x: -80, y: 125)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 170, height: 45)
                            .background(.white)
                            .cornerRadius(100)
                            .offset(x: 0, y: 0)
                        EmailInputView(placeHolder: "State", txt: $viewModel.state)
                            .onChange(of: viewModel.state, perform: onInputChanged)
                    }.frame(width: 170, height: 45)
                        .offset(x: 100, y: 125)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 170, height: 45)
                            .background(.white)
                            .cornerRadius(100)
                            .offset(x: 0, y: 0)
                        EmailInputView(placeHolder: "Country", txt: $viewModel.country)
                            .onChange(of: viewModel.country, perform: onInputChanged)
                    }.frame(width: 170, height: 45)
                        .offset(x: -80, y: 180)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 170, height: 45)
                            .background(.white)
                            .cornerRadius(100)
                            .offset(x: 0, y: 0)
                        EmailInputView(placeHolder: "Zip code", txt: $viewModel.zipCode)
                            .onChange(of: viewModel.zipCode, perform: onInputChanged)
                    }.frame(width: 170, height: 45)
                        .offset(x: 100, y: 180)
                    
                    
                }
                Group {
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 253, height: 54)
                            .background(Color(red: 0.31, green: 0.76, blue: 0.79))
                            .cornerRadius(10)
                            .offset(x: 0, y: 0)
                        Button("Sign up", action: {
                            Task {
                                await viewModel.createAccount()
                            }
                        }).font(Font.custom("Roboto", size: 20).weight(.bold))
                            .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.08))
                            .offset(x: -0.39, y: 0)
                    }
                    .frame(width: 253, height: 54)
                    .offset(x: 1, y: 263)
                    
                    Text("Already have an account?")
                        .font(Font.custom("Roboto", size: 20))
                        .foregroundColor(.black).offset(x: -25, y: 363)
                    Button {
                        
                    } label: {
                        NavigationLink(destination: Login()){
                            Text("Sign in")
                        }
                    }.offset(x: 125, y: 363)
                }
            }.frame(width: 493, height: 852)
                .background(Color(red: 0.93, green: 0.93, blue: 0.93));
        }.navigationBarBackButtonHidden(true)
  }
    private func onConfirmPassword(changed: String) {
        if( !changed.elementsEqual(viewModel.password)){
            print("Passwords do not matchß")
        }
    }
    private func onInputChanged(changed: String) {

    }
    private func onLoginButtonClick(){
        //print("Hello world: " + viewModel.email)
        //viewModel.signIn();
        //print(Auth.auth().currentUser)
            
    }
}

struct SignUp_Previews: PreviewProvider {
  static var previews: some View {
    SignUp()
  }
}
