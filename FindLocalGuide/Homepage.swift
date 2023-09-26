import SwiftUI
import Combine
import FirebaseAuth

struct Homepage: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        @State var shouldNavigate = false
        var email = viewModel.currentUser.email

        NavigationView() {
            ZStack() {
                Text("Welcome \(email)")
            }
            
        }.navigationBarBackButtonHidden(true)
    }
    
    struct Homepage_Previews: PreviewProvider {
        static var previews: some View {
            Homepage()
        }
    }
}
