//
//  MainScreenView.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 03.06.2024.
//

import SwiftUI

struct MainScreenView: View {
    @StateObject var mainViewModel: MainViewModel
    
    var body: some View {
        ZStack {
            Color.systemBlack.ignoresSafeArea(.all)
            
            if !mainViewModel.showSelectedCountry {
                MainLayout()
                    .onAppear { mainViewModel.onAppear() }
                    .environmentObject(mainViewModel)
            } else {
                SelectedСountryLayout()
                    .onAppear { mainViewModel.getTicketsOffers() }
                    .environmentObject(mainViewModel)
            }
        }
        .preferredColorScheme(.dark)
    }
}
