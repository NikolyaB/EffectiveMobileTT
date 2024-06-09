//
//  FastButtons.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 04.06.2024.
//

import SwiftUI

struct FastButtons: View {
    
    let onClick: (FastButtonType) -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            fastButton(
                text: "Сложный маршрут",
                icon: "ic_route",
                color: Color.systemGreen
            ) {
                onClick(.route)
            }
            Spacer()
            fastButton(
                text: "Куда угодно",
                icon: "ic_globe",
                color: Color.systemBlue
            ) {
                onClick(.anywhere)
            }
            Spacer()
            fastButton(
                text: "Выходные",
                icon: "ic_calendar",
                color: Color.systemDarkBlue
            ) {
                onClick(.weekend)
            }
            Spacer()
            fastButton(
                text: "Горячие билеты",
                icon: "ic_fire",
                color: Color.systemRed
            ) {
                onClick(.hotTickets)
            }
        }
    }
    
    private func fastButton(text: String, icon: String,color: Color, click: @escaping () -> Void) -> some View {
        Button(action: click) {
            VStack {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(color)
                    Image(icon)
                        .resizable()
                        .frame(maxWidth: 24, maxHeight: 24)
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 48, height: 48)
                
                Text(text)
                    .font(.Text2)
                    .foregroundStyle(Color.systemWhite)
                    .padding(.top, 8)
            }
        }
        .frame(width: 80)
    }
}

#Preview {
    FastButtons() {_ in 
        
    }
}
