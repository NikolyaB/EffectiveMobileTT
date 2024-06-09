//
//  SelectedСountryLayout.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 04.06.2024.
//

import SwiftUI

struct SelectedСountryLayout: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            InputFields(screen: .searchResult)
                .environmentObject(viewModel)
                .padding(.top, 30)
            
            SearchParameters(depDate: $viewModel.departureDate, returnDate: $viewModel.returnDate)
            
            if let ticketsOffers = viewModel.ticketsOffers {
                ScrollView {
                    DirectFlights(ticketsOffers: ticketsOffers)
                        .padding(.top)
                        .padding(.horizontal)
                    
                    ShowAllTicketButton() {
                        viewModel.goTicketsList()
                    }
                    .padding(.top, 18)
                    .padding(.horizontal)
                }
                .scrollDisabled(true)
            } else {
                Spacer()
                ProgressView()
                Spacer()
            }
            
            Spacer()
        }
        .ignoresSafeArea(.keyboard, edges: .all)
    }
}
