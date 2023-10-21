//
//  SelectDatePage.swift
//  FindLocalGuide
//
//  Created by Cristina on 14.10.2023.
//


import Foundation
import SwiftUI
import RangeCalendar

struct SelectDatePage: View {
    
    @ObservedObject var viewModel: DateViewModel
    
    @Binding public var showDatePicker: Bool
    @StateObject var manager = RCManager(
            calendar: Calendar.current,
            minimumDate: Date.now,
            maximumDate: Date().addingTimeInterval(40*40*24*365))

    var body: some View {
        ZStack() {
            ScrollView(.vertical) {
                ZStack {
                    RangeCalendar(manager: manager).scrollDisabled(false)
                }.frame(maxWidth: .infinity, maxHeight:660)
                ZStack(){
                    Rectangle()
                        .foregroundColor(Color(red: 0.31, green: 0.76, blue: 0.79))
                        .frame(width: 253, height: 54)
                        .cornerRadius(10)
                        .offset(x: 0, y: 45)
                    Button("Select dates"){
                        viewModel.dateAsString = formatDate(date: manager.startDate) + " - " + formatDate(date: manager.endDate)
                        showDatePicker.toggle()

                    }.font(Font.custom("Roboto", size: 20).weight(.bold))
                        .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.08))
                        .offset(x: 0, y: 45)
                        
                }.frame(minWidth: 253, maxHeight: 24)
                    
                }
            }
        
           
    }
    func formatDate(date: Date) ->
        String {
            var stringFormatter = DateFormatter()
            stringFormatter.dateStyle = .short
            
            return stringFormatter.string(from: date)
        }
    
}

struct SelectDatePage_Previews: PreviewProvider {
    static var previews: some View {
        SelectDatePage(viewModel: DateViewModel(), showDatePicker: .constant(true))
    }
}

