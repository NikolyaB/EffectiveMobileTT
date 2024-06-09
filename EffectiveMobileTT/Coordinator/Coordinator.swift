//
//  Coordinator.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 06.06.2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    
    @Published var tab = CScreen.main
    @Published var path = NavigationPath()
    @Published var screen: CScreen = .main
    @Published var sheet: CScreen?
    @Published var mainViewModel: MainViewModel!
    @Published var ticketsListViewModel: TicketsListViewModel?
    
    init() {
        self.mainViewModel = MainViewModel(coordinator: self)
    }
    
    func goMain() {
        path.removeLast(path.count)
    }
    
    func goTicketsList(searchResult: SearchResult) {
        self.ticketsListViewModel = TicketsListViewModel(coordinator: self, searchResult: searchResult)
        path.append(CScreen.ticketsList)
    }
    
    func goRandomRoute() {
        path.append(CScreen.randomRoute)
    }
    
    func goWeekend() {
        path.append(CScreen.weekend)
    }
    
    func goHotTickets() {
        path.append(CScreen.hotTickets)
    }
    
    func goSearchSheet() {
        sheet = .searchSheet
    }
    
    func closeSearchSheet() {
        sheet = nil
    }
    
    @ViewBuilder
    func getScreen(_ screen: CScreen) -> some View {
        switch screen {
        case .main:
            MainScreenView(mainViewModel: self.mainViewModel)
        case .ticketsList:
            TicketsListScreenView(ticketsViewModel: self.ticketsListViewModel!)
        case .searchSheet:
            SearchSheet(viewModel: self.mainViewModel)
        default:
            Color.grey2.ignoresSafeArea(edges: .vertical)
        }
    }
    
    @ViewBuilder
    func getTab(_ screen: CScreen) -> some View {
        switch screen {
        case .main:
            MainScreenCoordinator(coordinator: self)
        default:
            Color.grey2.ignoresSafeArea(edges: .vertical)
        }
    }
}

enum CScreen: String, CaseIterable, Identifiable {
    case main
    case ticketsList
    case hotels
    case profile
    case shortWay
    case subscriptions
    case searchResult
    case randomRoute
    case weekend
    case hotTickets
    case searchSheet
    
    var id: String {self.rawValue}
}
