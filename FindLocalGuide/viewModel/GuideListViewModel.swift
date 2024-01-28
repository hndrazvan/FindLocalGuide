//
//  GuideListViewModel.swift
//  FindLocalGuide
//
//  Created by Cristina on 16.10.2023.
//

import SwiftUI
import Combine
import FirebaseAuth

class GuideListViewModel: ObservableObject {
    @Published var searchText = "" {
        didSet {
            filterUsers(text: searchText)
        }
    }
    @Published var filteredUsers = [User]()
    @Published var selectedUser = ""
    var userRepository = UserRepository()

    init() {
        Task {
            filterUsers(text:searchText)
        }
    }
    var guideList = [User]()
    func filterUsers(text: String) {
        Task {
            guideList = await userRepository.getTouristUsers()
            
            if text.isEmpty {
                filteredUsers = guideList
            } else {
                filteredUsers = guideList.filter { ($0.firstName + $0.lastName).localizedCaseInsensitiveContains(text) }
            }
        }
    }
    
}

struct GuideListView: View {
    var placeHolder: String = ""
    @State public var showGuideListPage = false
    @StateObject var guideListViewModel = GuideListViewModel()
    @FocusState public var fieldIsFocused: Bool

    var body: some View {
        TextField("", text: .constant(guideListViewModel.searchText), prompt: Text(placeHolder).foregroundColor(.gray)).onTapGesture {
            self.showGuideListPage.toggle()
        }.focused($fieldIsFocused, equals:false)
         .fullScreenCover(isPresented: $showGuideListPage){
            GuideListPage(viewModel: guideListViewModel, showGuideListPage: $showGuideListPage)
            
            
        }.font(Font.custom("Roboto", size: 20)).foregroundColor(.black).offset(x: 27, y: -0.32)
    }
}

