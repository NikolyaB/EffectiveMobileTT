//
//  CardTicket.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 04.06.2024.
//

import SwiftUI

struct CardTicket: View {
    let price: Int
    let startTime: String
    let endTime: String
    let travelTime: String
    let depCodeAirport: String
    let arCodeAirport: String
    let badge: String?
    let hasTransfer: Bool?
    
    init(
        price: Int,
        startTime: String,
        endTime: String,
        travelTime: String,
        depCodeAirport: String,
        arCodeAirport: String,
        badge: String? = nil,
        hasTransfer: Bool? = nil
    ) {
        self.price = price
        self.startTime = startTime
        self.endTime = endTime
        self.travelTime = travelTime
        self.depCodeAirport = depCodeAirport
        self.arCodeAirport = arCodeAirport
        self.badge = badge
        self.hasTransfer = hasTransfer
    }
    
    var body: some View {
        Button(action: { }) {
            VStack(alignment: .leading) {
                Text("\(price.formatted(.number.locale(.init(identifier: "fr_FR")))) ₽")
                    .font(.Title1)
                    .foregroundStyle(Color.systemWhite)
                HStack(alignment: .center, spacing: 0) {
                    Circle()
                        .fill(Color.systemRed)
                        .frame(width: 24)
                        .padding(.trailing, 8)
                    
                    HStack(alignment: .top, spacing: 0) {
                        VStack(alignment: .leading) {
                            Text(startTime)
                                .font(.Title4)
                                .foregroundStyle(Color.systemWhite)
                            
                            Text(depCodeAirport)
                                .font(.Title4)
                                .foregroundStyle(Color.grey6)
                        }
                        
                        Color.grey6.frame(width: 10, height: 4 / UIScreen.main.scale)
                            .padding(.top, 8)
                            .padding(.horizontal, 4)
                        
                        VStack(alignment: .leading) {
                            Text(endTime)
                                .font(.Title4)
                                .foregroundStyle(Color.systemWhite)
                            
                            Text(arCodeAirport)
                                .font(.Title4)
                                .foregroundStyle(Color.grey6)
                        }
                        .padding(.trailing, 13)
                        
                        HStack(spacing: 0) {
                            Text("\(travelTime)ч в пути")
                                .font(.Text2)
                                .foregroundStyle(Color.systemWhite)
                                .lineLimit(1)
                            
                            if hasTransfer == false {
                                Text(" / ")
                                    .font(.Text2)
                                    .foregroundStyle(Color.grey6)
                                Text("Без пересадок")
                                    .font(.Text2)
                                    .foregroundStyle(Color.systemWhite)
                                    .lineLimit(1)
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.grey1)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                if let badge = badge {
                    Text(badge)
                        .font(.Title4)
                        .foregroundStyle(Color.systemWhite)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 2)
                        .background(Color.systemBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .position(CGPoint(x: 62, y: 4.0))
                }
            }
        }
    }
}

#Preview {
    CardTicket(price: 6990, startTime: "15:00", endTime: "18:35", travelTime: "3.5", depCodeAirport: "DME", arCodeAirport: "AER", badge: "Самый удобный")
}
