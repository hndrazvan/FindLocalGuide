//
//  CheckoutView.swift
//  FindLocalGuide
//
//  Created by Cristina on 27.01.2024.
//

import SwiftUI
import Stripe
import StripePaymentSheet

struct CheckoutView: View {
    
    @StateObject var viewModel: SubscriptionViewModel
    
    var body: some View {
        
        
        VStack{
            
            Text("Order Details").font(.headline).fontWeight(.bold).frame(maxWidth: .infinity,alignment: .leading).padding(.leading)
            
            ZStack{
                
                HStack{
                    
                    Image(systemName: "applewatch").resizable().colorInvert().background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(Utils.getColor("#fea686")).frame(width: 80, height: 80, alignment: .leading)).frame(width: 40, height: 60).padding()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Day with guide").font(.headline)
                        
                        Text("1RON/user").font(.subheadline).fontWeight(.semibold).opacity(0.8)
                        
                        Text("change plan").font(.subheadline).fontWeight(.semibold).opacity(0.8).foregroundColor(.red)
                        
                    }.padding()
                    
                }.frame(maxWidth: .infinity, alignment: .leading).padding([.leading, .trailing])
                
                
                
            }.background( RoundedRectangle(cornerRadius: 25.0).foregroundColor(Utils.getColor("#fff0ea"))).padding([.leading, .trailing])
            
            HStack{
                
                Text("Plan duration").font(.headline).fontWeight(.bold).foregroundColor(.gray)
                
                Spacer()
                
                Text("3 months").font(.subheadline).fontWeight(.semibold)
                
            }.padding([.leading, .trailing, .top])
            
            HStack{
                
                
            }.padding([.leading, .trailing, .top])
            
            Divider()
            
            HStack{
                
                
            }.padding([.leading, .trailing, .top])
            
            Divider()
            
            HStack{
                
                Text("Total Amount").font(.headline).fontWeight(.bold).foregroundColor(.gray)
                
                Spacer()
                
                Text("1 RON").font(.title).fontWeight(.semibold)
                
            }.padding([.leading, .trailing, .top])
            
            
            //payment button part
            if viewModel.paymentSheet != nil {
                
                PaymentSheet.PaymentButton(
                    paymentSheet: viewModel.paymentSheet!,
                    onCompletion: viewModel.onPaymentCompletion
                ) {
                    
                    Button(action: {
                        
                        
                        
                    }, label: {
                        
                        Text("Proceed to payment").foregroundColor(.white)
                        
                    }).frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15.0).foregroundColor(.blue))
                    .frame(maxWidth: .infinity)
                    .padding().disabled(true)
                }
                
            }else {
                Button(action: {
                    self.viewModel.tokenization()

                    
                    
                }, label: {
                    
                    Text("Proceed to payment").foregroundColor(.white)
                    
                }).frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15.0).foregroundColor(.blue))
                .frame(maxWidth: .infinity)
                .padding().disabled(false)
                
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(viewModel: SubscriptionViewModel())
    }
}
