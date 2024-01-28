//
//  ContentView.swift
//  FindLocalGuide
//
//  Created by Cristina on 27.01.2024.
//

import Foundation
import SwiftUI

struct PaymentContentView: View {
    
    @StateObject var viewModel = SubscriptionViewModel()
    
    var body: some View {
        
        VStack{
            
            if viewModel.errorMessage != nil {
                
                Text(viewModel.errorMessage ?? "")
                
            }else if viewModel.isSuccessPayment {
                
                Text("Payment Successful!")
                
            } else{
                CheckoutView(viewModel: self.viewModel)
            }
            
        }.onAppear{
            
            self.viewModel.tokenization()
            
        }
        
    }
}

struct PaymentContentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentContentView()
    }
}
