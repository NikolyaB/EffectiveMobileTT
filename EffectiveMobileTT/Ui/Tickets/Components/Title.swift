//
//  Title.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 04.06.2024.
//

import SwiftUI

struct Title: View {
    let searchResult: SearchResult
    let onClick: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: { onClick() }) {
                Image("ic_left")
                    .renderingMode(.template)
                    .foregroundStyle(Color.systemBlue)
                    .frame(width: 24, height: 24)
            }
            .padding(.leading, 5)
            .padding(.trailing, 13)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(searchResult.routeTitle)
                    .font(.Title3)
                    .foregroundStyle(Color.systemWhite)
                Text(searchResult.descritpion)
                    .font(.Title4)
                    .foregroundStyle(Color.grey6)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
        .background(Color.grey2)
    }
}
