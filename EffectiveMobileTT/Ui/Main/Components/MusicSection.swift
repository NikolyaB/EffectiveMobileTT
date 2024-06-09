//
//  MusicSection.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 04.06.2024.
//

import SwiftUI
import Combine


struct MusicSection: View {
    
    let offers: [Offer]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Музыкально отлететь")
                .font(.Title1)
                .foregroundStyle(Color.white)
                .padding(.leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(0..<offers.count, id:\.self) { index in
                        if index == 0 {
                            cardInfo(offer: offers[index])
                                .padding(.horizontal)
                        } else {
                            cardInfo(offer: offers[index])
                                .padding(.trailing)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.top, 26)
        }
    }
    
    private func cardInfo(offer: Offer) -> some View {
        
        VStack(alignment: .leading) {
            Image(offer.image)
                .resizable()
                .frame(maxWidth: 132, maxHeight: 133)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Text(offer.title)
                .font(.Title3)
                .foregroundStyle(Color.systemWhite)
                .padding(.vertical, 8)
            Text(offer.town)
                .font(.Text2)
                .foregroundStyle(Color.systemWhite)
            HStack(spacing: 0) {
                Image("ic_airplane_1")
                    .resizable()
                    .frame(maxWidth: 24, maxHeight: 24)
                Text("от \(offer.price.value.formatted(.number.locale(.init(identifier: "fr_FR")))) ₽")
                    .font(.Text2)
                    .foregroundStyle(Color.systemWhite)
            }
        }
    }
}

#Preview {
    MusicSection(offers: [])
}
