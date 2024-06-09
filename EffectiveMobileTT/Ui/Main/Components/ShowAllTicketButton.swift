//
//  ShowAllTicketButton.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 04.06.2024.
//

import SwiftUI

struct ShowAllTicketButton: View {
    
    let onClick: () -> Void
    
    var body: some View {
        Button(action: { onClick() }) {
            Text("Посмотреть все билеты")
                .font(.ButtonText1)
                .foregroundStyle(Color.systemWhite)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color.systemBlue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    ShowAllTicketButton() {
        
    }
}
