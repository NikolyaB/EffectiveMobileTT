//
//  DuoButtons.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 04.06.2024.
//

import SwiftUI

struct DuoButtons: View {
    var body: some View {
        HStack(spacing: 16) {
            button(title: "Фильтер", icon: "ic_filter") {
                
            }
            button(title: "График цен", icon: "ic_chart") {
                
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10.5)
        .background(Color.systemBlue)
        .clipShape(RoundedRectangle(cornerRadius: 50))
    }
    
    private func button(title: String, icon: String, onClick: @escaping () -> Void) -> some View {
        Button(action: { onClick() }) {
            HStack(alignment: .center, spacing: 4) {
                Group {
                    Image(icon)
                        .renderingMode(.template)
                        .frame(width: 16, height: 16)
                    Text(title)
                        .font(.Title4)
                }
                .foregroundStyle(Color.systemWhite)
            }
        }
    }
}

#Preview {
    DuoButtons()
}
