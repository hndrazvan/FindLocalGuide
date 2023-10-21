import SwiftUI
import Combine
import FirebaseAuth
import UIKit
import MapKit
import Combine

class LocationSearchViewModel: ObservableObject {
    private var cancellable: AnyCancellable?

    @Published var cityText = "" {
        didSet {
            searchForCity(text: cityText)
        }
    }
    
    @Published var poiText = "" {
        didSet {
            searchForPOI(text: poiText)
        }
    }
    
    @Published var viewData = [LocalSearchViewData]()

    var service: LocalSearchService
    
    init() {
//        New York
        let center = CLLocationCoordinate2D(latitude: 40.730610, longitude: -73.935242)
        service = LocalSearchService(in: center)
        
        cancellable = service.localSearchPublisher.sink { mapItems in
            self.viewData = mapItems.map({ LocalSearchViewData(mapItem: $0) })
        }
    }
    
    private func searchForCity(text: String) {
        service.searchCities(searchText: text)
    }
    
    private func searchForPOI(text: String) {
        service.searchPointOfInterests(searchText: text)
    }
}


struct LocationSearchView: View {
    var placeHolder: String = ""
    @State public var showLocationPage = false
    @StateObject var locationSearchViewModel = LocationSearchViewModel()
    
    @FocusState public var fieldIsFocused: Bool

    
    var body: some View {
        TextField("", text: .constant(locationSearchViewModel.cityText), prompt: Text(placeHolder).foregroundColor(.gray)).onTapGesture {
            self.showLocationPage.toggle()
        }.focused($fieldIsFocused, equals: false)
            .fullScreenCover(isPresented: $showLocationPage){
            LocationSearchPage(viewModel: locationSearchViewModel, showLocationPage: $showLocationPage)
            
        }.font(Font.custom("Roboto", size: 20)).foregroundColor(.black).offset(x: 27, y: -0.32)
    }
}

          
