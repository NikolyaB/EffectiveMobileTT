//
//  SearchSheet.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 04.06.2024.
//

import SwiftUI

struct SearchSheet: View {
    @ObservedObject var viewModel: MainViewModel
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                InputFields(screen: .searchSheet)
                    .environmentObject(viewModel)
                
                FastButtons() { data in
                    viewModel.onClickFastButton(buttonType: data)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                PopularRoute() { data in
                    viewModel.whereGo = data
                }
                .padding(.horizontal)
                .padding(.top, 26)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 26)
        }
        .scrollDisabled(true)
        .background(Color.grey2)
    }
}
