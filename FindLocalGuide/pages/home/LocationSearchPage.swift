//
//  LocationSearchPage.swift
//  FindLocalGuide
//
//  Created by Cristina on 14.10.2023.
//

import Foundation
import SwiftUI

struct LocationSearchPage: View {

    @ObservedObject var viewModel: LocationSearchViewModel
    
    @Binding public var showLocationPage: Bool
        
    var body: some View {
        NavigationStack {
            TextField("Enter location", text: $viewModel.cityText)     .keyboardType(.asciiCapable)
                .font(Font.custom("Roboto", size: 20)).foregroundColor(.white).offset(x: 27, y: -0.32)
                .onSubmit {
                    showLocationPage.toggle()
                }
            Divider()
            List(viewModel.viewData) { item in
                            VStack(alignment: .leading) {
                                Text(item.title).foregroundColor(.white).onTapGesture {
                                    viewModel.cityText = item.subtitle
                                    self.showLocationPage.toggle()
                                }
                                Text(item.subtitle)
                                    .foregroundColor(.secondary)
                            }
                        }
        }
        
    }
}





