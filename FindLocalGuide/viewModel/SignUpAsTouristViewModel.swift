import SwiftUI
import Combine
import FirebaseAuth

class SignUpAsTouristViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var zipCode = ""
    @Published var country = ""
    @Published var state = ""
    @Published var city = ""
    @Published var confirmPassword = ""

    @Published private var _currentUser : User? = nil
    @Published var hasError = false
    @Published var errorMessage = ""
    @Published var isLoggedIn = false
        
    private var handler = Auth.auth().addStateDidChangeListener{_,_ in }
    private var userRepository: UserRepository = UserRepository()
    var currentUser: User {
        return _currentUser ?? User(uid: "", email: "", firstName:"",lastName:"", city:"", state:"",country:"", zipCode:"")
    }
    
    init(){
    handler = Auth.auth().addStateDidChangeListener{ auth,user in
        if let user = user {
            self._currentUser = User(uid: user.uid, email: user.email!, firstName: self.firstName, lastName: self.lastName, city: self.city, state:self.state, country:self.country, zipCode:self.zipCode)
                self.isLoggedIn = true
        } else {
            self._currentUser = nil
            self.isLoggedIn = false
        }
    }
}
    
    func createAccount() async {
        hasError = false
        do{
            try await Auth.auth().createUser(withEmail: email, password: password)
        }catch{
            hasError = true
            errorMessage = error.localizedDescription
            print(errorMessage)
        }
        
        userRepository.addTouristUser(user: currentUser)
    }
        
}
 
