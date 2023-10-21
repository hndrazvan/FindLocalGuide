//
//  GuideListPage.swift
//  FindLocalGuide
//
//  Created by Cristina on 15.10.2023.
//
import Foundation
import SwiftUI

struct GuideListPage: View {

    @ObservedObject var viewModel: GuideListViewModel
    
    @Binding public var showGuideListPage: Bool
    
    

    var body: some View {
        NavigationStack {

            TextField("Enter guide name", text: $viewModel.searchText ).keyboardType(.asciiCapable).font(Font.custom("Roboto", size: 20)).foregroundColor(.white).offset(x: 27, y: -0.32).onSubmit {
                    showGuideListPage.toggle()
            }
                            
           Divider()

            List(viewModel.filteredUsers, id: \.uid) { item in
                         VStack(alignment: .leading) {
                         Text(item.firstName + " " + item.lastName).foregroundColor(.white).onTapGesture {
                         viewModel.searchText = item.firstName + " " + item.lastName
                             self.showGuideListPage.toggle()

                         }
                         Text(item.city + " " + item.country)
                         .foregroundColor(.secondary)
                         }
                    }
            /*}.onAppear(){
                viewModel.filterUsers(text:"")*/
        
        }
        
    }
}

