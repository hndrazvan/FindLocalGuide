

import Foundation

protocol SubscriptionResponseProtocol {
    
    func onResult(subscriptionResult: SubscriptionResponse)
    func onError(message: String)
    
}
