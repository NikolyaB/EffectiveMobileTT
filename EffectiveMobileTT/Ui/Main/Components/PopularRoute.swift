//
//  PopularRoute.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 04.06.2024.
//

import SwiftUI

struct PopularRoute: View {
    var onClick: (String) -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            cellRow(title: "Стамбул", icon: "ic_stambul") { data in
                onClick(data)
            }
            cellRow(title: "Сочи", icon: "ic_sochi") { data in
                onClick(data)
            }
            cellRow(title: "Пхукет", icon: "ic_phuket") { data in
                onClick(data)
            }
        }
        .padding()
        .background(Color.grey3)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private func cellRow(title: String, icon: String, onClick: @escaping (String) -> Void) -> some View {
        VStack(alignment: .leading) {
            Button(action: { onClick(title) }) {
                HStack {
                    Image(icon)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(.Title3)
                            .foregroundStyle(Color.systemWhite)
                        Text("Популярное направление")
                            .font(.Text2)
                            .foregroundStyle(Color.grey5)
                    }
                }
            }
            Divider()
                .background(Color.grey7)
        }
    }
}

#Preview {
    PopularRoute() { data in
    }
}
