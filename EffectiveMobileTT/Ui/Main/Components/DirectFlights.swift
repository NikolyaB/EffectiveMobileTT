//
//  DirectFlights.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 04.06.2024.
//

import SwiftUI

struct DirectFlights: View {
    
    let ticketsOffers: [TicketOffer]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Прямые рельсы")
                .font(.Title2)
                .foregroundStyle(Color.systemWhite)
            
            VStack {
                ForEach(0 ..< ticketsOffers.count) { index in
                    switch index {
                    case 0: cellRow(title: ticketsOffers[index].title, cost: ticketsOffers[index].price.value, times: ticketsOffers[index].time_range, colorFlight: Color.systemRed)
                    case 1: cellRow(title: ticketsOffers[index].title, cost: ticketsOffers[index].price.value, times: ticketsOffers[index].time_range, colorFlight: Color.systemBlue)
                    case 2: cellRow(title: ticketsOffers[index].title, cost: ticketsOffers[index].price.value, times: ticketsOffers[index].time_range, colorFlight: Color.systemWhite)
                    default:
                        EmptyView()
                    }
                }
            }
        }
        .padding()
        .background(Color.grey1)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private func cellRow(title: String, cost: Int, times: [String], colorFlight: Color) -> some View {
        VStack {
            Button(action: { }) {
                HStack(alignment: .top) {
                    Circle()
                        .fill(colorFlight)
                        .frame(width: 24)
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 0) {
                            Text(title)
                                .font(.Title4)
                                .foregroundStyle(Color.systemWhite)
                            Spacer()
                            Text("\(cost.formatted(.number.locale(.init(identifier: "fr_FR")))) ₽")
                                .font(.Title4)
                                .foregroundStyle(Color.systemBlue)
                            Image("ic_right")
                                .resizable()
                                .frame(maxWidth: 24, maxHeight: 24)

                        }
                        HStack {
                                Text(times.joined(separator: " "))
                                    .font(.Text2)
                                    .foregroundStyle(Color.systemWhite)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                        }
                    }
                }.padding(.trailing, 2)
            }
            Divider()
                .background(Color.grey7)
        }
    }
}

#Preview {
    DirectFlights(ticketsOffers: [TicketOffer(id: 1, title: "Уральские авиалинии", time_range: [
        "07:00",
        "09:10",
        "10:00",
        "11:30",
        "14:15",
        "19:10",
        "21:00",
        "23:30"
    ], price: Price(value: 3999))])
}
