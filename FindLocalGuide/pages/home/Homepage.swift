import SwiftUI
import Combine
import FirebaseAuth

struct Homepage: View {
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    var body: some View {
        ZStack{
            
            TabView(selection: $selectedSideMenuTab) {
                TouristHomepage(presentSideMenu: $presentSideMenu).tag(0)
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: .constant(0), presentSideMenu: $presentSideMenu)))
        }.navigationBarBackButtonHidden(true)
    }
}
struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}

