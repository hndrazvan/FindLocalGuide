//
//  MainSideMenuView.swift
//  FindLocalGuide
//
//  Created by Cristina on 22.10.2023.
//

import SwiftUI
struct MainTabbedView: View {
    
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    var body: some View {
        ZStack{
            
            TabView(selection: $selectedSideMenuTab) {
                TouristHomepage(presentSideMenu: $presentSideMenu)
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}

struct Previews_MainSideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabbedView()
    }
}
