//
//  TicketsScreenView.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 04.06.2024.
//

import SwiftUI

struct TicketsListScreenView: View {
    @StateObject var ticketsViewModel: TicketsListViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Title(searchResult: ticketsViewModel.searchResult) {
                dismiss()
            }
            .padding(.horizontal)
            .padding(.vertical)
            
            if let tickets = ticketsViewModel.tickets {
                ZStack(alignment: .bottom) {
                    
                    ScrollView(.vertical) {
                        ForEach(tickets) { data in
                            if (tickets.last?.id == data.id) {
                                CardTicket(
                                    price: data.price.value,
                                    startTime: ticketsViewModel.normalTime(time: data.departure.date),
                                    endTime: ticketsViewModel.normalTime(time: data.arrival.date),
                                    travelTime: ticketsViewModel.timeTravel(start: data.departure.date, end: data.arrival.date),
                                    depCodeAirport: data.departure.airport,
                                    arCodeAirport: data.arrival.airport,
                                    badge: data.badge,
                                    hasTransfer: data.has_transfer
                                )
                                .padding()
                            } else {
                                CardTicket(
                                    price: data.price.value,
                                    startTime: ticketsViewModel.normalTime(time: data.departure.date),
                                    endTime: ticketsViewModel.normalTime(time: data.arrival.date),
                                    travelTime: ticketsViewModel.timeTravel(start: data.departure.date, end: data.arrival.date),
                                    depCodeAirport: data.departure.airport,
                                    arCodeAirport: data.arrival.airport,
                                    badge: data.badge,
                                    hasTransfer: data.has_transfer
                                )
                                .padding(.horizontal)
                                .padding(.top)
                            }
                        }
                    }
                    
                    DuoButtons()
                        .padding(.bottom)
                }
            } else {
                Spacer()
                ProgressView()
                Spacer()
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .onAppear { ticketsViewModel.onAppear() }
        .background(Color.systemBlack)
    }
}
