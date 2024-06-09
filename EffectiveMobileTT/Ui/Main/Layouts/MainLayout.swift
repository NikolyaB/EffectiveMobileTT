//
//  MainLayout.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 04.06.2024.
//

import SwiftUI

struct MainLayout: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Поиск дешевых авиабилетов")
                .font(.Title1)
                .foregroundStyle(Color(hex: "D9D9D9"))
                .frame(width: 172)
                .multilineTextAlignment(.center)
                .padding(.top, 26)
            
            InputFields(screen: .main)
                .environmentObject(viewModel)
                .padding(.horizontal)
                .padding(.top, 38)
            
            if let offers = viewModel.offers {
                MusicSection(offers: offers)
                    .padding(.top, 32)
            }
            else {
                Spacer()
                ProgressView()
                Spacer()
            }
            
            Spacer()
        }
        .ignoresSafeArea(.keyboard, edges: .all)
    }
}

#Preview {
    MainLayout() 
}
