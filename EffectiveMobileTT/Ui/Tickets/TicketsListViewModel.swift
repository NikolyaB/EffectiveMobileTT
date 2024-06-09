//
//  TicketsViewModel.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 05.06.2024.
//

import Foundation
import Combine

class TicketsListViewModel: ObservableObject {
    let ticketsURL = URL(string: "https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf")!

    @Published var tickets: [Ticket]?
    @Published var searchResult: SearchResult
    
    private var cancellableSet: Set<AnyCancellable> = []

    private unowned let coordinator: Coordinator
    
    init(coordinator: Coordinator, searchResult: SearchResult) {
        self.searchResult = searchResult
        self.coordinator = coordinator
    }
    
    func onAppear() {
        URLSession.shared.dataTaskPublisher(for: ticketsURL)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 300 else { throw
                    URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: Tickets.self, decoder: JSONDecoder())
            .sink { completion in
            } receiveValue: { [weak self] returnData in
                self?.tickets = returnData.tickets
            }
            .store(in: &cancellableSet)
    }
    
    func normalTime(time: String) -> String {
        let hours = time.components(separatedBy: "T").last!.components(separatedBy: ":")[0]
        let minutes = time.components(separatedBy: "T").last!.components(separatedBy: ":")[1]
        return String(format: "%1$@:%2$@",hours,minutes)
    }
    
    func timeTravel(start: String, end: String) -> String {
        let startDate = start
        let endDate = end
        let formaterDate = DateFormatter()
        formaterDate.dateFormat = "yyyy.MM.dd'T'HH:mm:ss"
        formaterDate.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let convertStartDate = formaterDate.date(from: startDate) ?? Date()
        let convertEndDate = formaterDate.date(from: endDate) ?? Date()
        let calendar = Calendar.current.dateComponents([.hour, .minute], from: convertStartDate, to: convertEndDate)
        guard let hour = calendar.hour, let minute = calendar.minute else {
            return "-"
        }
        
        if minute >= 30 {
            let minute = "5"
            return String(format: "%1$@.%2$@", String(hour), minute)
        } else {
            return String(format: "%1$@", String(hour))
        }
        
    }
}
