import SwiftUI
import Combine
import FirebaseAuth
import InstantSearchSwiftUI

struct Homepage: View {
    @StateObject var loginViewModel = LoginViewModel()
    @StateObject var searchInputViewModel = LocationSearchViewModel()
    @StateObject var dateViewModel = DateViewModel()

    @State public var showLocationPage = false

    
    var body: some View {
        @State var shouldNavigate = false
        var email = loginViewModel.currentUser.email
        
        NavigationView() {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 0.31, green: 0.42, blue: 0.79))
                    .frame(width: 431, height: 321)
                    .background(Color(red: 0.31, green: 0.42, blue: 0.79))
                    .offset(x: 0, y: -264.50)
                Ellipse()
                    .foregroundColor(Color(red: 0.60, green: 0.34, blue: 0.75))
                    .frame(width: 200, height: 200)
                    .offset(x: -160.50, y: -380)
                Ellipse()
                    .foregroundColor(Color(red: 0.57, green: 0.56, blue: 0.88))
                    .frame(width: 200, height: 200)
                    .offset(x: -52.50, y: -410)
                VStack(alignment: .leading, spacing: 12.32) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 54.86, height: 0)
                        .overlay(Rectangle()
                            .stroke(.black, lineWidth: 2.80))
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 54.86, height: 0)
                        .overlay(Rectangle()
                            .stroke(.black, lineWidth: 2.80))
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 54.86, height: 0)
                        .overlay(Rectangle()
                            .stroke(.black, lineWidth: 2.80))
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 54.86, height: 0)
                        .overlay(Rectangle()
                            .stroke(.black, lineWidth: 2.80))
                }.frame(width: 55, height: 37)
                    .offset(x: -98, y: -358.50)
                    .rotationEffect(.degrees(-180))
                
                Text("Start your adventure: Search for \nlocals to guide you")
                    .font(Font.custom("Itim", size: 24))
                    .foregroundColor(.black)
                    .offset(x: 4, y: -274.50)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 359, height: 168)
                        .background(Color(red: 1, green: 1, blue: 1).opacity(0.20))
                        .offset(x: 0, y: 0)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 359, height: 40)
                            .background(Color(red: 1, green: 0.99, blue: 1))
                            .offset(x: 0, y: 0)
                        LocationSearchView(placeHolder: "Around current location")
                            
                    }
                    .frame(width: 359, height: 40)
                    .offset(x: 0, y: -94)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 359, height: 40)
                            .background(Color(red: 1, green: 0.99, blue: 1))
                            .offset(x: 0, y: 0)
                        DatePickerInputView(placeHolder: "Enter dates", txt:$dateViewModel.dateAsString)
                            
                    }
                    .frame(width: 359, height: 40)
                    .offset(x: 0, y: -54)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 359, height: 40)
                            .background(Color(red: 1, green: 0.99, blue: 1))
                            .offset(x: 0, y: -0)
                        GuideListView(placeHolder: "Enter guide names")
                    }
                    .frame(width: 359, height: 40)
                    .offset(x: 0, y: -14)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 359, height: 40)
                            .background(Color(red: 0.31, green: 0.76, blue: 0.79))
                            .cornerRadius(10)
                            .offset(x: 0, y: 35)
                        Text("Search")
                            .font(Font.custom("Roboto", size: 20).weight(.bold))
                            .foregroundColor(.white)
                            .offset(x: -0.55, y: 35)
                        }
                        .frame(width: 359, height: 40)
                        .offset(x: 0, y: 19)
                    }
                    .frame(width: 359, height: 78)
                    .offset(x: 0, y: -75)
                }.onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                }
            
        }.navigationBarBackButtonHidden(true)
        
        
    }
    private func onInputChanged(changed: String) {
        
    }
}
struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}

