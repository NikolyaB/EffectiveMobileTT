//
//  MainViewModel.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 05.06.2024.
//

import Foundation
import Combine
import SwiftUI

class MainViewModel: ObservableObject {
    let offersURL = URL(string: "https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd")!
    let ticketsOffersURL = URL(string: "https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017")!
    
    @Published var offers: [Offer]?
    @Published var ticketsOffers: [TicketOffer]?
    @Published var whereFrom = UserDefaults.standard.string(forKey: "whereFrom") ?? ""
    @Published var whereGo = ""
    @Published var showSelectedCountry = false
    @Published var departureDate = Date()
    @Published var returnDate = Date()
    
    private let images = ["music_1", "music_2", "music_3"]
    private var cancellableSet: Set<AnyCancellable> = []
    
    private unowned let coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
                   
        $whereFrom
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { value in
                UserDefaults.standard.set(value, forKey: "whereFrom")
            }
            .store(in: &cancellableSet)
        
        $whereGo
            .debounce(for: 1.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                if input.count != 0 {
                    self.closeSearchSheet()
                }
                return input.count >= 1
            }
            .assign(to: \.showSelectedCountry, on: self)
            .store(in: &cancellableSet)
        }
    
    func closeSearchSheet() {
        coordinator.closeSearchSheet()
    }
    
    func goTicketsList() {
        let routeTitle = String(format: "%1$@-%2$@", whereFrom, whereGo)
        let description = String(format: "%1$@, 1 пассажир", dateToString(date: departureDate))
        let searchResult = SearchResult(routeTitle: routeTitle, descritpion: description)
        coordinator.goTicketsList(searchResult: searchResult)
    }
    
    func goSearchSheet() {
        coordinator.goSearchSheet()
    }
    
    func onAppear() {
        URLSession.shared.dataTaskPublisher(for: offersURL)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 300 else { throw
                    URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: OffersResponse.self, decoder: JSONDecoder())
            .sink { completion in
            } receiveValue: { [weak self] returnData in
                self?.offers = returnData.offers.map { data in
                    Offer(id: data.id, title: data.title, town: data.town, price: data.price, image: self!.images[data.id-1])
                }
            }
            .store(in: &cancellableSet)
    }
    
    func getTicketsOffers() {
        URLSession.shared.dataTaskPublisher(for: ticketsOffersURL)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 300 else { throw
                    URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: TicketsOffers.self, decoder: JSONDecoder())
            .sink { completion in
            } receiveValue: { [weak self] returnData in
                self?.ticketsOffers = returnData.tickets_offers
            }
            .store(in: &cancellableSet)
    }
    
    func onClickFastButton(buttonType: FastButtonType) {
        switch buttonType {
        case .route:
            coordinator.closeSearchSheet()
            coordinator.goRandomRoute()
        case .anywhere:
            whereGo = "Куда угодно"
        case .weekend:
            coordinator.closeSearchSheet()
            coordinator.goWeekend()
        case .hotTickets:
            coordinator.closeSearchSheet()
            coordinator.goHotTickets()
        }
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "dd MMM"
        return formatter.string(from: date).lowercased().replacingOccurrences(of: ".", with: "")
    }
}

enum FastButtonType: String, CaseIterable, Identifiable {
    case route, anywhere, weekend, hotTickets
    
    var id: String {self.rawValue}
}
