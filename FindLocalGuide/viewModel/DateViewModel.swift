//
//  DateViewModel.swift
//  FindLocalGuide
//
//  Created by Cristina on 16.10.2023.
//

import SwiftUI
import Combine
import FirebaseAuth

class DateViewModel: ObservableObject {
    @Published var date = Date()
    @Published var dateAsString = ""

}

struct DatePickerInputView: View {
    var placeHolder: String = ""
    @Binding var txt: String
    @State var showDatePicker = false
    @State private var date = Date.now
    @StateObject var dateViewModel = DateViewModel()
    @FocusState public var fieldIsFocused: Bool
    let formatter = DateFormatter()

    var body: some View {
        TextField("", text: .constant( dateViewModel.dateAsString), prompt: Text(placeHolder).foregroundColor(.gray)).onTapGesture {
            showDatePicker.toggle()
        }.focused($fieldIsFocused, equals: false)
         .sheet(isPresented: $showDatePicker){
            SelectDatePage(viewModel: dateViewModel, showDatePicker: $showDatePicker)
        }.font(Font.custom("Roboto", size: 20)).foregroundColor(.black).offset(x: 27, y: -0.32)
    
    }
    
}

