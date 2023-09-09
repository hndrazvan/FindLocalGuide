import SwiftUI

struct Login: View {
  var body: some View {
    ZStack() {
      Group {
        Text("Welcome Back: Your Journey Awaits")
          .font(Font.custom("Roboto", size: 20).weight(.bold))
          .foregroundColor(.black)
          .offset(x: 15, y: -228.50)
        Ellipse()
          .foregroundColor(.clear)
          .frame(width: 200, height: 200)
          .background(Color(red: 0.32, green: 0.35, blue: 0.65))
          .offset(x: -176.50, y: -340)
        Ellipse()
          .foregroundColor(.clear)
          .frame(width: 200, height: 200)
          .background(Color(red: 0.56, green: 0.88, blue: 0.84))
          .offset(x: -52.50, y: -375)
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
          Text("Login")
            .font(Font.custom("Roboto", size: 20).weight(.bold))
            .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.08))
            .offset(x: -0.39, y: 0)
        }
        .frame(width: 253, height: 54)
        .offset(x: 1, y: 263)
        Text("       Don’t have an account?\n \n          Sign up as tourist\n        Sign up as local guide")
          .font(Font.custom("Roboto", size: 20))
          .foregroundColor(.black)
          .offset(x: 0.50, y: 365)
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 350, height: 48)
            .background(.white)
            .cornerRadius(100)
            .offset(x: 0, y: 0)
          Text("Enter your  password")
            .font(Font.custom("Roboto", size: 20))
            .foregroundColor(.black)
            .offset(x: -49.50, y: 0.34)
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
          Text("Enter your email")
            .font(Font.custom("Roboto", size: 20))
            .foregroundColor(.black)
            .offset(x: -67, y: -0.32)
        }
        .frame(width: 350, height: 45)
        .offset(x: 9.50, y: 63.50)
        Text("Forgot password?")
          .font(Font.custom("Roboto", size: 20))
          .foregroundColor(Color(red: 0.06, green: 0.50, blue: 0.91))
          .offset(x: 4.50, y: 203.50)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 422, height: 198)
          .background(
            AsyncImage(url: URL(string: "https://via.placeholder.com/422x198"))
          )
          .offset(x: 14.50, y: -105)
          .shadow(
            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
          )
      }
    }
    .frame(width: 393, height: 852)
    .background(Color(red: 0.93, green: 0.93, blue: 0.93));
  }
}

struct Login_Previews: PreviewProvider {
  static var previews: some View {
    Login()
  }
}
